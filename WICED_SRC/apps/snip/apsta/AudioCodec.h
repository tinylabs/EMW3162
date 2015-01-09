
#pragma once
#include "platform.h"
#include "wiced.h"
#include "wiced_platform.h"
#include "wiced_rtos.h"




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
  #define HYST 32
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



#define I2C_XFER_RETRY_COUNT    3
#define I2C_DMA_POLICY          WICED_FALSE


typedef struct
{
    wiced_gpio_t            addr0;
    wiced_gpio_t            cifmode;
    wiced_i2c_device_t *    i2c_data;
    uint8_t                 fmt;
} wm8533_device_data_t;


wiced_i2c_device_t ac_control_port =
{
    .port          = WICED_I2C_1,
    .address       = 0x1A, /* 0011010b */ //0x25,  /* 100101 */
    .address_width = I2C_ADDRESS_WIDTH_7BIT,
    .speed_mode    = I2C_STANDARD_SPEED_MODE, //I2C_LOW_SPEED_MODE,
};

wm8533_device_data_t ac =
{
    .i2c_data       = &ac_control_port,
};


static wiced_result_t i2c_reg_write(wiced_i2c_device_t *device, uint8_t reg, uint16_t value)
{
    wiced_result_t result;
    static wiced_i2c_message_t msg[1];
    struct i2c_wm8533_payload
    {
        uint8_t reg;
        uint8_t value_h;
        uint8_t value_l;
    };
    struct i2c_wm8533_payload payload;

    payload.reg = reg;
    payload.value_h = ( (value & 0xFF00) >> 8 )  ;
    payload.value_l = ( value & 0x00FF );
		WPRINT_WICED_INFO(("Audio - i2c_reg_write\n"));

    result = wiced_i2c_init_tx_message(msg, &payload, 3, 3, 1);
    if (WICED_SUCCESS == result)
    {
		WPRINT_WICED_INFO(("Audio - wiced_i2c_init_tx_message succesfull\n"));
        result = wiced_i2c_transfer(device, msg, 1);
    }
     if (WICED_SUCCESS == result)
    {
		WPRINT_WICED_INFO(("Audio - wiced_i2c_transfer succesfull\n"));
        
	}
    return result;
}

static wiced_result_t i2c_reg_read(wiced_i2c_device_t *device, uint8_t reg, uint16_t *value)
{
    wiced_result_t result;
    static wiced_i2c_message_t msg[1];
    uint8_t value_read[2];
    result = wiced_i2c_init_combined_message(msg, &reg, value_read, sizeof(reg), sizeof(value_read), I2C_XFER_RETRY_COUNT, I2C_DMA_POLICY);
    if (WICED_SUCCESS == result)
    {
        result = wiced_i2c_transfer(device, msg, 1);
        *value = ( value_read[0] << 8 ) + value_read[1];
    }
    return result;
}




static wiced_result_t wm8533_reg_write( wm8533_device_data_t* wm8533, uint8_t address, uint16_t reg_data )
{
    return i2c_reg_write(wm8533->i2c_data, address, reg_data);
}

static wiced_result_t wm8533_reg_read(wm8533_device_data_t* wm8533, uint8_t address, uint16_t* reg_data)
{
    return i2c_reg_read(wm8533->i2c_data, address, reg_data);
}


static wiced_result_t wm8533_init ( wm8533_device_data_t* wm8533 )
{
   
    wiced_result_t result;
WPRINT_WICED_INFO(("I2C Init 1\n"));
    /* Enable I2C clocks, init I2C peripheral. */
    result = wiced_i2c_init(wm8533->i2c_data);
    if (WICED_SUCCESS == result)
    {
		WPRINT_WICED_INFO(("Audio - i2c init succesfull\n"));
	}
    result = wm8533_reg_write(wm8533, 0x0c, 0x0);  // power reduction register
    
    if (WICED_SUCCESS == result)
    {
		WPRINT_WICED_INFO(("Audio -  Power register succesfull\n"));
	}
    result = wm8533_reg_write(wm8533, 0x0e, 0x03);  // digital data format register
       
    if (WICED_SUCCESS == result)
    {
		WPRINT_WICED_INFO(("Audio - digital data format register succesfull\n"));
	}
    result = wm8533_reg_write(wm8533, 0x00, LINVOL);  //  left in setup register
    
    if (WICED_SUCCESS == result)
    {
		WPRINT_WICED_INFO(("Audio - left register succesfull\n"));
	}
    result = wm8533_reg_write(wm8533, 0x02, RINVOL);  //  right in setup register
     
     
   
        uint16_t psctrl_value = 0;
        uint8_t SYS_ENA_POWER_DOWN = 0x04;  // right in setup register
        uint8_t SYS_ENA_FIELD_SHIFT = LHPVOL; 
        psctrl_value = ( SYS_ENA_POWER_DOWN << SYS_ENA_FIELD_SHIFT );
        result = wm8533_reg_write(wm8533, 0x1a, psctrl_value);
    
    
         psctrl_value = 0;
         SYS_ENA_POWER_DOWN = 0x06;  // right in setup register
         SYS_ENA_FIELD_SHIFT = RHPVOL; 
        psctrl_value = ( SYS_ENA_POWER_DOWN << SYS_ENA_FIELD_SHIFT );
        result = wm8533_reg_write(wm8533, 0x1a, psctrl_value);
    
         psctrl_value = 0;
         SYS_ENA_POWER_DOWN = 0x0a;  // right in setup register
         SYS_ENA_FIELD_SHIFT = ADCHPD; 
        psctrl_value = ( SYS_ENA_POWER_DOWN << SYS_ENA_FIELD_SHIFT );
        result = wm8533_reg_write(wm8533, 0x1a, psctrl_value);
    
         psctrl_value = 0;
         SYS_ENA_POWER_DOWN = 0x08;  // analog audio pathway configuration
         SYS_ENA_FIELD_SHIFT = (uint8_t)((SIDEATT << 6)|(SIDETONE << 5)|(DACSEL << 4)|(BYPASS << 3)|(INSEL << 2)|(MUTEMIC << 1)|(MICBOOST << 0));
        psctrl_value = ( SYS_ENA_POWER_DOWN << SYS_ENA_FIELD_SHIFT );
        result = wm8533_reg_write(wm8533, 0x1a, psctrl_value);
    
         psctrl_value = 0;
         SYS_ENA_POWER_DOWN = 0x10;  // clock configuration
         SYS_ENA_FIELD_SHIFT = 0xa0; 
        #if SAMPLE_RATE == 88
			SYS_ENA_FIELD_SHIFT = (0xbc);
		  #elif SAMPLE_RATE == 44
		   SYS_ENA_FIELD_SHIFT = (0xa0);
		  #elif SAMPLE_RATE == 22
			SYS_ENA_FIELD_SHIFT = (0xe0);
		  #elif SAMPLE_RATE == 8
		   SYS_ENA_FIELD_SHIFT = (0xac);
		  #elif SAMPLE_RATE == 2
			SYS_ENA_FIELD_SHIFT = (0xce);
		  #endif
        psctrl_value = ( SYS_ENA_POWER_DOWN << SYS_ENA_FIELD_SHIFT );
        result = wm8533_reg_write(wm8533, 0x1a, psctrl_value);
    
         psctrl_value = 0;
         SYS_ENA_POWER_DOWN = 0x12;  // analog audio pathway configuration
         SYS_ENA_FIELD_SHIFT = 0x01;
        psctrl_value = ( SYS_ENA_POWER_DOWN << SYS_ENA_FIELD_SHIFT );
        result = wm8533_reg_write(wm8533, 0x1a, psctrl_value);
    
  
	return result;
}
