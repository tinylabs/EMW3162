/*
 * audioboard.c
 *
 *  Created on: Jan 10, 2015
 *      Author: wouters
 */
#include "wiced.h"

#include <stm32f2xx_rcc.h>
#include <stm32f2xx_spi.h>
#include "platform_peripheral.h"

#include <stm32f2xx_gpio.h>
#include <stm32f2xx_tim.h>
#include "misc.h"
#include "audioboard.h"
#include "spi.h"
#include "wiced_platform.h"
#include "platform.h"
#include "queue.h"
#include "i2c.h"

#define OUTPUT_LIVE 1

extern const platform_spi_t        platform_spi_peripherals[];
#define WICED_SPI_FLASH_CS ( WICED_GPIO_5 )
platform_spi_config_t config;

#define rcvbuffersize 1000
uint16_t * activereceivebuffer;
int receivebufferpointer = 0;
#define maxreadbufsize  4
uint16_t * readbufferarr[maxreadbufsize];
int curractivereadbuffer = 0;
queue read_queue;
int recvlength = 0;
char recvbuffstart = 1;

#define buffersize 400
#define maxbufsize  2
uint16_t * writebufferarr[maxbufsize];
int curractivewritebuffer = 0;
int bufferpointer = 0;
uint16_t * activewritebuffer;
queue write_queue;
uint16_t rcvright = 0;
uint16_t rcvleft = 0;

void AllocateUDPBuffers() {

	int i = 0;
	for(i = 0; i < maxbufsize; i++) {
		writebufferarr[i] = malloc(buffersize*sizeof(uint16_t));
	}
	activewritebuffer = writebufferarr[curractivewritebuffer];


	for(i = 0; i < maxreadbufsize; i++) {
		readbufferarr[i] = malloc(rcvbuffersize*sizeof(uint16_t));
		memset(readbufferarr[i], 0, rcvbuffersize*sizeof(uint16_t));
	}
	activereceivebuffer = readbufferarr[curractivereadbuffer];
}

	platform_gpio_t io = { GPIOC,  6 };

void Audioboard_Receive_audio(char* data, int length) {
	uint16_t * tmpbuff = readbufferarr[curractivereadbuffer];
	recvlength = (length/2);
	memcpy(tmpbuff, data, (length) * sizeof(char));
	enqueue(&read_queue, tmpbuff);

	curractivereadbuffer += 1;
	if(curractivereadbuffer >= maxreadbufsize)
	curractivereadbuffer = 0;
}

void switchactivewritebuffer() {
	curractivewritebuffer += 1;
	if(curractivewritebuffer >= maxbufsize)
		curractivewritebuffer = 0;

	activewritebuffer = writebufferarr[curractivewritebuffer];
}

PLATFORM_DEFINE_ISR( timerhandle ) {
	if (TIM_GetITStatus(TIM3, TIM_IT_Update) == RESET) {
		return;
	}
	platform_mcu_powersave_disable();

	if(receivebufferpointer >= rcvbuffersize || receivebufferpointer >= recvlength) { // reaching end of receive buffer
		uint16_t * oldp = activereceivebuffer; // store for error
		if(recvbuffstart == 0 && getqueuesize(&read_queue) >= maxreadbufsize) {// queue a bit
			activereceivebuffer = (uint16_t *) dequeue(&read_queue); // get new recv buffer
			recvbuffstart = 1;
		} else if(recvbuffstart == 1){
			activereceivebuffer = (uint16_t *) dequeue(&read_queue); // get new recv buffer
		}
		if(activereceivebuffer == 0) {
			//recvbuffstart = 0; // buffer probably empty, restart
			activereceivebuffer = oldp;
		}
		receivebufferpointer = 0;
	}

	if(bufferpointer == buffersize) { // we read a new package from spi, transmit
		if(getqueuesize(&write_queue) >= maxbufsize) {	// queue a bit
			uint16_t * tmpdata = (uint16_t *) dequeue(&write_queue); // get from queue
			SendUdpData(tmpdata, buffersize * 2); // send over udp
		}
		enqueue(&write_queue, (void*) activewritebuffer); // store new package for next round
		switchactivewritebuffer(); // switch to empty package for write
		bufferpointer = 0;
	}

	GPIO_WriteBit(GPIOC, SS, HIGH);
	/* Send the byte */
	if (platform_gpio_input_get(&io)) {
		SPI_I2S_SendData(SPI1, rcvright);
	} else {
		SPI_I2S_SendData(SPI1, activereceivebuffer[receivebufferpointer]);
	}
	/* Wait until the transmit buffer is empty */
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET) {
	}
	GPIO_WriteBit(GPIOC, SS, LOW);
	if (platform_gpio_input_get(&io)) {
		SPI_I2S_SendData(SPI1, rcvright);
	} else {
		SPI_I2S_SendData(SPI1, activereceivebuffer[receivebufferpointer]);
	}
	/* Wait until a data is received */
	while (SPI_I2S_GetFlagStatus( SPI1, SPI_I2S_FLAG_RXNE) == RESET) {
	}
	//  /* Get the received data */
	rcvleft = SPI_I2S_ReceiveData( SPI1);
	while (SPI_I2S_GetFlagStatus( SPI1, SPI_I2S_FLAG_RXNE) == RESET) {
	}
	activewritebuffer[bufferpointer] = rcvleft;
	bufferpointer++;

	receivebufferpointer++;
	/* Get the received data */
	rcvright = SPI_I2S_ReceiveData( SPI1);

	platform_mcu_powersave_enable();

	TIM_ClearITPendingBit(TIM3, TIM_IT_Update);
}

void del(int m) {
	long i;
	for(i = 0; i < (500 * m); i++) {
		Audioboard_I2C_Delay(500);
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
    timerInitStructure.TIM_Period = 2720;
    timerInitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    timerInitStructure.TIM_RepetitionCounter = 0;
    TIM_TimeBaseInit(TIM3, &timerInitStructure);
    TIM_ClearITPendingBit( TIM3, TIM_IT_Update );
    TIM_ITConfig(TIM3, TIM_IT_Update, ENABLE);
    TIM_UpdateRequestConfig( TIM3, TIM_UpdateSource_Regular );
    NVIC_EnableIRQ( TIM3_IRQn );
    TIM_Cmd(TIM3, ENABLE);
}

void Audioboard_Init()
{
	del(20); // DO NOT REMOVE DELAY, WILL ALMOST BRICK JTAG

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
	
	

	GPIO_InitTypeDef gpioStructure;
	gpioStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7;
	gpioStructure.GPIO_Mode = GPIO_Mode_OUT;
	gpioStructure.GPIO_PuPd = GPIO_PuPd_UP;
	gpioStructure.GPIO_OType = GPIO_OType_PP;
	gpioStructure.GPIO_Speed = GPIO_Speed_25MHz;
	GPIO_Init(GPIOB, &gpioStructure);

	gpioStructure.GPIO_Pin = SS;
	gpioStructure.GPIO_Mode = GPIO_Mode_OUT;
	gpioStructure.GPIO_PuPd = GPIO_PuPd_UP;
	gpioStructure.GPIO_OType = GPIO_OType_PP;
	gpioStructure.GPIO_Speed = GPIO_Speed_25MHz;
	GPIO_WriteBit(GPIOC, SS, LOW);
	GPIO_Init(GPIOC, &gpioStructure);
	Audioboard_I2C_Delay(500);
	digitalWrite(SCL_PIN, HIGH); // release clock line
	digitalWrite(SDA_PIN, HIGH); // release data line
	Audioboard_I2C_Delay(500);

	Audioboard_I2C_Config();	// start sending config
	GPIO_DeInit(GPIOB); // done

	config.chip_select = WICED_SPI_FLASH_CS; //&platform_gpio_pins[wiced_spi_audioshield.chip_select];
	config.speed       = 9000000;
	config.mode        = (SPI_CLOCK_RISING_EDGE | SPI_CLOCK_IDLE_LOW | SPI_NO_DMA | SPI_MSB_FIRST);
	config.bits        = 16;
	platform_spi_init( &platform_spi_peripherals[WICED_SPI_1], &config );
	init_queue(&read_queue);
	init_queue(&write_queue);
	AllocateUDPBuffers();
	InitializeTimer(); // Setup timer for spi audio samping
	EnableTimerInterrupt(); // setup interrupt and start timer
	
	platform_gpio_init(&io, INPUT_PULL_UP );
    

}
PLATFORM_MAP_ISR( timerhandle, TIM3_irq )
