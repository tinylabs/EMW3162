/*
 * audioboard.c
 *
 *  Created on: Jan 10, 2015
 *      Author: wouters
 */
#include "wiced.h"

#include <stm32f2xx.h>
#include <stm32f2xx_i2c.h>
#include <stm32f2xx_rcc.h>
#include <stm32f2xx_spi.h>
#include "platform_peripheral.h"

#include <stm32f2xx_gpio.h>
#include <stm32f2xx_tim.h>
#include "misc.h"
#include "audioboard.h"
#include "spi.h"
#include "wiced_platform.h"
#define ADDR 0x34 // i2c address and write bit
#define SDA_PIN GPIO_Pin_7 // i2c data line
#define SCL_PIN GPIO_Pin_6 // i2c clock line
#define SS GPIO_Pin_7
#define LED_PIN 13 // board led pin

#define HIGH Bit_SET
#define LOW Bit_RESET


void digitalWrite(int pin, int value) {
	GPIO_WriteBit(GPIOB, pin, value);
}

int digitalRead(int pin) {
	return GPIO_ReadOutputDataBit(GPIOB, pin);
}
// us delay timer (~1us per unit)
// sets the i2c clock rate

void mydelay(long t) {
	long i = 0;



	for(i = 0; i < (7 * t); i++) {
		__asm("nop");
	}
}


// i2c start condition
char i2cbb_start(void) {
  if (digitalRead(SDA_PIN) == 0) { // check if data line released
    return -1; // end with failure if not released
  }

  else { // send start condition
    digitalWrite(SDA_PIN, LOW);  // data low
    mydelay(10); // delay
    ////WPRINT_PLATFORM_INFO( ("Start..\n") );
    digitalWrite(SCL_PIN, LOW); // clock low
    mydelay(10); // delay
    return 1; // set state to success
  }
}


// i2c stop condition
void i2cbb_stop(void) {
  digitalWrite(SDA_PIN, LOW); // pull data low
  mydelay(10); // delay
  digitalWrite(SCL_PIN, HIGH); // release clock line
  mydelay(10); // delay
  digitalWrite(SDA_PIN, HIGH); // release data line
  mydelay(400); // delay to make sure a new data transfer doesnt occur too quickly
}


// i2c data send
char i2cbb_send(unsigned char data) {  // clock out data
  unsigned char state = 0; // initialize return state
  unsigned char i;
  for(i = 8 ; i > 0  ; i--) {
    digitalWrite(SDA_PIN, (data & (1 << (i - 1))));
    mydelay(10);
    digitalWrite(SCL_PIN, HIGH);
    mydelay(10);
    digitalWrite(SCL_PIN, LOW);
  }
  // check for ack
  digitalWrite(SDA_PIN, LOW); // release line

  mydelay(9); // wait a bit
// // clock the ack or nack
  digitalWrite(SCL_PIN, HIGH);
  mydelay(9);
  digitalWrite(SCL_PIN, LOW);
  // make sure line is released
  mydelay(15);

  if (state > 1) { // send stop if failure
    i2cbb_stop();
  }
  else { // set state to success
    state = 1;
  }
  return state;
}

// full i2c protocol for 3 byte transfer
unsigned char i2cbb(unsigned char reg, unsigned char data) {
  if (i2cbb_start() != 1) { // send start condition
    return 2;
  }
  else if (i2cbb_send(ADDR) != 1) { // send address and write bit
    return 3;
  }
  else if (i2cbb_send(reg) != 1) { // send register to write to
    return 4;
  }
  else if (i2cbb_send(data) != 1) { // write data to register
    return 5;
  }
  else {
  i2cbb_stop(); // send stop condition
  return 1;
  }
}

void codec_maple_reg_setup(void) {
  i2cbb(0x0c, 0x00); // power save registers -> all on
	  mydelay(10);

  i2cbb(0x0e, 0x03); // digital data format -> 16b spi mode
	  mydelay(10);

  i2cbb(0x00, LINVOL); // left input configure
	  mydelay(10);

  i2cbb(0x02, RINVOL); // right input configure
	  mydelay(10);

  i2cbb(0x04, LHPVOL); // left headphone configure
	  mydelay(10);

  i2cbb(0x06, RHPVOL); // right headphone configure
	  mydelay(10);

  i2cbb(0x0a, ADCHPD);  // digital pathway configure
	  mydelay(10);

  i2cbb(0x08, (SIDEATT << 6)|(SIDETONE << 5)|(DACSEL << 4)|(BYPASS << 3)|(INSEL << 2)|(MUTEMIC << 1)|(MICBOOST << 0)) ; // analog pathway configure
	  mydelay(10);


  #if SAMPLE_RATE == 88
    while (i2cbb(0x10, 0xbc) ; // clock select 88.2kHz
    	mydelay(10);
    }
  #elif SAMPLE_RATE == 44
   i2cbb(0x10, 0xa0);// clock select 44.1kHz
    	mydelay(10);

  #elif SAMPLE_RATE == 22
    i2cbb(0x10, 0xe0) ; // clock select 22.05kHz
    	mydelay(10);

  #elif SAMPLE_RATE == 8
    i2cbb(0x10, 0xac); // clock select 8.018kHz
    	mydelay(10);

  #elif SAMPLE_RATE == 2
     i2cbb(0x10, 0xce) ; // clock select 2.45kHz
    	mydelay(10);

  #endif

   i2cbb(0x12, 0x01) ;// device enable
	  mydelay(10);

}

int spi_send(platform_spi_message_segment_t* segments, uint16_t num_segments) {
	if ( WICED_SUCCESS != wiced_spi_transfer( &wiced_spi_audioshield, (wiced_spi_message_segment_t*) segments, (uint16_t) num_segments ) )
	{
		return -1;
	}
	return 0;
}
static xTimerHandle timer;


int freqcounter = 0;
int dir = 0;
PLATFORM_DEFINE_ISR( timerhandler )
{
	if (TIM_GetITStatus(TIM3, TIM_IT_Update) != RESET)
	{
        TIM_ClearITPendingBit(TIM3, TIM_IT_Update);
        GPIO_WriteBit(GPIOC, SS, HIGH);
        mydelay(1);
        GPIO_WriteBit(GPIOC, SS, LOW);


   // TIM3->SR = (uint16_t)~TIM_IT_Update;
	}

}

int16_t rcvright = 0;
int16_t rcvleft = 0;

platform_spi_config_t config;
PLATFORM_DEFINE_ISR( timerhandle )
{
	if (TIM_GetITStatus(TIM3, TIM_IT_Update) == RESET)
		{
return;
		}
	   platform_mcu_powersave_disable();

	char * data = "0";
	data[0] = freqcounter;

	if(dir == 0)
	freqcounter++;

	if(dir == 1)
		freqcounter--;

	if(freqcounter > 5000)
	dir = 1;

	if(freqcounter < -5000)
	dir = 0;





	GPIO_WriteBit(GPIOC, SS, HIGH);

	    /* Send the byte */
	    SPI_I2S_SendData(SPI1, rcvleft );

	    asm volatile ("nop"); // delay for appropriate timing
	    asm volatile ("nop");
	    asm volatile ("nop");
	    asm volatile ("nop");
	    asm volatile ("nop");
	    asm volatile ("nop");
	    asm volatile ("nop");
	    asm volatile ("nop");
	    asm volatile ("nop");
	    asm volatile ("nop");




		/* Wait until the transmit buffer is empty */
		    while ( SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE ) == RESET )
		    {
		    }

		    GPIO_WriteBit(GPIOC, SS, LOW);


	    SPI_I2S_SendData(SPI1, rcvright );


	    /* Wait until a data is received */
	 	    while ( SPI_I2S_GetFlagStatus( SPI1, SPI_I2S_FLAG_RXNE ) == RESET )
	 	    {
	 	    }
	  //  /* Get the received data */
	    rcvleft = SPI_I2S_ReceiveData( SPI1 );

	    while ( SPI_I2S_GetFlagStatus( SPI1, SPI_I2S_FLAG_RXNE ) == RESET )
	 	    {
	 	    }
	    /* Get the received data */
	    rcvright = SPI_I2S_ReceiveData( SPI1 );

	    platform_mcu_powersave_enable();

    TIM_ClearITPendingBit(TIM3, TIM_IT_Update);
}

void del(int m) {
	long i;
	for(i = 0; i < (500 * m); i++) {
		mydelay(500);
	}
}
void EnableTimerInterrupt()
{
    NVIC_InitTypeDef nvicStructure;
    nvicStructure.NVIC_IRQChannel = TIM3_IRQn;
    nvicStructure.NVIC_IRQChannelPreemptionPriority = 0;
    nvicStructure.NVIC_IRQChannelSubPriority = 1;
    nvicStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&nvicStructure);
}

void InitializeTimer()
{
	RCC_APB1PeriphClockCmd( RCC_APB1Periph_TIM3, ENABLE  );
	RCC_APB1PeriphResetCmd( RCC_APB1Periph_TIM3, DISABLE );

    TIM_TimeBaseInitTypeDef timerInitStructure;
    timerInitStructure.TIM_Prescaler = 0;
    timerInitStructure.TIM_CounterMode = TIM_CounterMode_Up;
    timerInitStructure.TIM_Period = 271;
    timerInitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    timerInitStructure.TIM_RepetitionCounter = 0;
    TIM_TimeBaseInit(TIM3, &timerInitStructure);

    TIM_ClearITPendingBit( TIM3, TIM_IT_Update );
    TIM_ITConfig(TIM3, TIM_IT_Update, ENABLE);
    TIM_UpdateRequestConfig( TIM3, TIM_UpdateSource_Regular );
    NVIC_EnableIRQ( TIM3_IRQn );
    TIM_Cmd(TIM3, ENABLE);
}


/* @brief vTimer task
 *
 * This task configures and starts a timer.
 *
 * @param pvParameters
 */
extern const platform_spi_t        platform_spi_peripherals[];

#define WICED_SPI_FLASH_CS ( WICED_GPIO_5 )
void I2C_LowLevel_Init()
{
	del(20); // DO NOT REMOVE DELAY, WILL ALMOST BRICK JTAG
	void * pvTimerID;
    //WPRINT_PLATFORM_INFO( ("Start I2C_LowLevel_Init.\n") );

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

    //WPRINT_PLATFORM_INFO( ("done RCC_AHB1PeriphClockCmd Init.\n") );

	//WICED_GPIO_14] = { GPIOA,  4 }, // SPI1_CS

	   GPIO_InitTypeDef gpioStructure;
	   gpioStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7;
	   gpioStructure.GPIO_Mode = GPIO_Mode_OUT;
	   gpioStructure.GPIO_PuPd = GPIO_PuPd_UP;
	   gpioStructure.GPIO_OType = GPIO_OType_PP;
	   gpioStructure.GPIO_Speed = GPIO_Speed_25MHz;
	   //GPIO_DeInit(GPIOB);
	   GPIO_Init(GPIOB, &gpioStructure);
	    //WPRINT_PLATFORM_INFO( ("done GPIOB_Init.\n") );


	   // wiced_gpio_init( WICED_GPIO_14, OUTPUT_PUSH_PULL );
	   //wiced_gpio_output_high(WICED_GPIO_14);
	   gpioStructure.GPIO_Pin = SS;
	   gpioStructure.GPIO_Mode = GPIO_Mode_OUT;
	   gpioStructure.GPIO_PuPd = GPIO_PuPd_UP;
	   gpioStructure.GPIO_OType = GPIO_OType_PP;
	   gpioStructure.GPIO_Speed = GPIO_Speed_25MHz;
		GPIO_WriteBit(GPIOC, SS, LOW);

	   GPIO_Init(GPIOC, &gpioStructure);
	    //WPRINT_PLATFORM_INFO( ("done GPIOA_Init.\n") );

	    mydelay(500);
		//GPIO_WriteBit(GPIOB, GPIO_Pin_6, value);


	   digitalWrite(SCL_PIN, HIGH); // release clock line
	   digitalWrite(SDA_PIN, HIGH); // release data line
   	   mydelay(500);

	  // digitalWrite(SCL_PIN, HIGH);
   	   codec_maple_reg_setup();
	   GPIO_DeInit(GPIOB);

       //WPRINT_PLATFORM_INFO( ("Audio shield initialized 2.\n") );

	   config.chip_select = WICED_SPI_FLASH_CS; //&platform_gpio_pins[wiced_spi_audioshield.chip_select];
	   config.speed       = 9000000;
	   config.mode        = (SPI_CLOCK_RISING_EDGE | SPI_CLOCK_IDLE_LOW | SPI_NO_DMA | SPI_MSB_FIRST);
	   config.bits        = 16;
	   platform_spi_init( &platform_spi_peripherals[WICED_SPI_1], &config );

	   WPRINT_PLATFORM_INFO( ("Audio shield initialized 2\n") );

	   InitializeTimer();


	   EnableTimerInterrupt();
		GPIO_ToggleBits(GPIOC, SS);

	   //WPRINT_PLATFORM_INFO( ("Audio shield initialized 3.\n") );

//	      NVIC_InitTypeDef nvicStructure;
//	      nvicStructure.NVIC_IRQChannel = TIM3_IRQn;
//	      nvicStructure.NVIC_IRQChannelPreemptionPriority = 0;
//	      nvicStructure.NVIC_IRQChannelSubPriority = 1;
//	      nvicStructure.NVIC_IRQChannelCmd = ENABLE;
//	      NVIC_Init(&nvicStructure);
	   //xTaskCreate(vTimer, "Timer", 256, NULL, 7, NULL);

}
PLATFORM_MAP_ISR( timerhandle, TIM3_irq )
