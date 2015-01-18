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



typedef enum
{
    SFLASH_WRITE_NOT_ALLOWED = 0,
    SFLASH_WRITE_ALLOWED     = 1,

} sflash_write_allowed_t;

typedef /*@abstract@*/ /*@immutable@*/ struct
{
    uint32_t device_id;
    void * platform_peripheral;
    sflash_write_allowed_t write_allowed;
} sflash_handle_t;





#ifndef SAMPLE_RATE
  #define SAMPLE_RATE 44
#elif (SAMPLE_RATE == 88)||(SAMPLE_RATE == 44)||(SAMPLE_RATE == 22)||(SAMPLE_RATE == 8)||(SAMPLE_RATE == 2)
#else
  #error SAMPLE_RATE value not defined
#endif

#ifndef ADCHPD
  #define ADCHPD 0
#elif (ADCHPD == 0)||(ADCHPD == 1)
#else
  #error ADCHPD value not defined
#endif

#ifndef ADCS
  #define ADCS 2
#elif (ADCS >=0)&&(ADCS <= 2)
#else
  #error ADCS value not defined
#endif

#ifndef HYST
  #define HYST 64 // default is higher for Maple due to noisier ADCs
#elif (HYST >= 0)&&(HYST <= 255)
#else
  #error HYST value not defined
#endif

#ifndef LINVOL
  #define LINVOL 23
#elif (LINVOL >= 0) && (LINVOL <= 0x1f)
#else
  #error LINVOL value not defined
#endif

#ifndef RINVOL
  #define RINVOL 23
#elif (RINVOL >= 0) && (RINVOL <= 0x1f)
#else
  #error RINVOL value not defined
#endif

#ifndef LHPVOL
  #define LHPVOL 121
#elif (LHPVOL == 0) || ((LHPVOL >= 0x30) && (LHPVOL <= 0x7f))
#else
  #error LHPVOL value not defined
#endif

#ifndef RHPVOL
  #define RHPVOL 121
#elif (RHPVOL == 0) || ((RHPVOL >= 0x30) && (RHPVOL <= 0x7f))
#else
  #error RHPVOL value not defined
#endif

#ifndef MICBOOST
  #define MICBOOST 0
#elif (MICBOOST == 0)||(MICBOOST == 1)
#else
  #error MICBOOST value not defined
#endif

#ifndef MUTEMIC
  #define MUTEMIC 1
#elif (MUTEMIC == 0)||(MUTEMIC == 1)
#else
  #error MUTEMIC value not defined
#endif

#ifndef INSEL
  #define INSEL 0
#elif (INSEL == 0)||(INSEL == 1)
#else
  #error INSEL value not defined
#endif

#ifndef BYPASS
  #define BYPASS 0
#elif (BYPASS == 0)||(BYPASS == 1)
#else
  #error BYPASS value not defined
#endif

#ifndef DACSEL
  #define DACSEL 1
#elif (DACSEL == 0)||(DACSEL == 1)
#else
  #error DACSEL value not defined
#endif

#ifndef SIDETONE
  #define SIDETONE 0
#elif (SIDETONE == 0)||(SIDETONE == 1)
#else
  #error SIDETONE value not defined
#endif

#ifndef SIDEATT
  #define SIDEATT 0
#elif (SIDEATT >= 0)&&(SIDEATT <= 3)
#else
  #error SIDEATT value not defined
#endif

#ifndef KILLSWITCH
  #define KILLSWITCH 0
#elif (KILLSWITCH == 1)||(KILLSWITCH == 0)
#else
  #error KILLSWITCH engaged
#endif



Status I2C_Write(I2C_TypeDef* I2Cx, const uint8_t* buf, uint32_t nbuf,  uint8_t SlaveAddress);
void I2C_LowLevel_Init();



#endif /* AUDIOBOARD_H_ */
