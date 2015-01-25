/*
 * audioboard.h
 *
 *  Created on: Jan 10, 2015
 *      Author: wouters
 */

#ifndef AUDIOBOARD_H_
#define AUDIOBOARD_H_

#include <stm32f2xx_i2c.h>

typedef enum {Error = 0, Success = !Error } Status;




void Audioboard_Receive_audio(char* data, int length);
Status I2C_Write(I2C_TypeDef* I2Cx, const uint8_t* buf, uint32_t nbuf,  uint8_t SlaveAddress);
void Audioboard_Init();



#endif /* AUDIOBOARD_H_ */
