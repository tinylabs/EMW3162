/*
 * i2c.c
 *
 *  Created on: Jan 25, 2015
 *      Author: wouters
 */

#include <stm32f2xx.h>
#include <stm32f2xx_i2c.h>
#include <stm32f2xx_gpio.h>
#include "i2c.h"

unsigned char i2cbb(unsigned char reg, unsigned char data);
char i2cbb_send(unsigned char data);
char i2cbb_start(void);
void i2cbb_stop(void);

void Audioboard_I2C_Config(void) {
  i2cbb(0x0c, 0x00); // power save registers -> all on
	  Audioboard_I2C_Delay(10);

  i2cbb(0x0e, 0x83); // digital data format -> 16b spi mode
	  Audioboard_I2C_Delay(10);

  i2cbb(0x00, LINVOL); // left input configure
	  Audioboard_I2C_Delay(10);

  i2cbb(0x02, RINVOL); // right input configure
	  Audioboard_I2C_Delay(10);

  i2cbb(0x04, LHPVOL); // left headphone configure
	  Audioboard_I2C_Delay(10);

  i2cbb(0x06, RHPVOL); // right headphone configure
	  Audioboard_I2C_Delay(10);

  i2cbb(0x0a, ADCHPD);  // digital pathway configure
	  Audioboard_I2C_Delay(10);

  i2cbb(0x08, (SIDEATT << 6)|(SIDETONE << 5)|(DACSEL << 4)|(BYPASS << 3)|(INSEL << 2)|(MUTEMIC << 1)|(MICBOOST << 0)) ; // analog pathway configure
	  Audioboard_I2C_Delay(10);


  #if SAMPLE_RATE == 88
    while (i2cbb(0x10, 0xbc) ; // clock select 88.2kHz
    	Audioboard_I2C_Delay(10);
    }
  #elif SAMPLE_RATE == 44
   i2cbb(0x10, 0xa0);// clock select 44.1kHz
    	Audioboard_I2C_Delay(10);

  #elif SAMPLE_RATE == 22
    i2cbb(0x10, 0xe0) ; // clock select 22.05kHz
    	Audioboard_I2C_Delay(10);

  #elif SAMPLE_RATE == 8
    i2cbb(0x10, 0xac); // clock select 8.018kHz
    	Audioboard_I2C_Delay(10);

  #elif SAMPLE_RATE == 2
     i2cbb(0x10, 0xce) ; // clock select 2.45kHz
    	Audioboard_I2C_Delay(10);

  #endif

   i2cbb(0x12, 0x01) ;// device enable
	  Audioboard_I2C_Delay(10);

}


void digitalWrite(int pin, int value) {
	GPIO_WriteBit(GPIOB, pin, value);
}

int digitalRead(int pin) {
	return GPIO_ReadOutputDataBit(GPIOB, pin);
}
// us delay timer (~1us per unit)
// sets the i2c clock rate

void Audioboard_I2C_Delay(long t) {
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
    Audioboard_I2C_Delay(10); // delay
    ////WPRINT_PLATFORM_INFO( ("Start..\n") );
    digitalWrite(SCL_PIN, LOW); // clock low
    Audioboard_I2C_Delay(10); // delay
    return 1; // set state to success
  }
}


// i2c stop condition
void i2cbb_stop(void) {
  digitalWrite(SDA_PIN, LOW); // pull data low
  Audioboard_I2C_Delay(10); // delay
  digitalWrite(SCL_PIN, HIGH); // release clock line
  Audioboard_I2C_Delay(10); // delay
  digitalWrite(SDA_PIN, HIGH); // release data line
  Audioboard_I2C_Delay(400); // delay to make sure a new data transfer doesnt occur too quickly
}


// i2c data send
char i2cbb_send(unsigned char data) {  // clock out data
  unsigned char state = 0; // initialize return state
  unsigned char i;
  for(i = 8 ; i > 0  ; i--) {
    digitalWrite(SDA_PIN, (data & (1 << (i - 1))));
    Audioboard_I2C_Delay(10);
    digitalWrite(SCL_PIN, HIGH);
    Audioboard_I2C_Delay(10);
    digitalWrite(SCL_PIN, LOW);
  }
  // check for ack
  digitalWrite(SDA_PIN, LOW); // release line

  Audioboard_I2C_Delay(9); // wait a bit
// // clock the ack or nack
  digitalWrite(SCL_PIN, HIGH);
  Audioboard_I2C_Delay(9);
  digitalWrite(SCL_PIN, LOW);
  // make sure line is released
  Audioboard_I2C_Delay(15);

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
