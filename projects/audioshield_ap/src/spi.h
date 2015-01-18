/*
 * spi.h
 *
 *  Created on: Jan 18, 2015
 *      Author: wouters
 */

#ifndef SPI_H_
#define SPI_H_
typedef struct
 {
     /*@null@*/ /*@observer@*/  const void*   tx_buffer;
     /*@null@*/ /*@dependent@*/ void*         rx_buffer;
                                unsigned long length;
 } sflash_platform_message_segment_t;


 /* Status Register bit definitions */
 #define SFLASH_STATUS_REGISTER_BUSY                          ( (unsigned char) 0x01 )
 #define SFLASH_STATUS_REGISTER_WRITE_ENABLED                 ( (unsigned char) 0x02 )
 #define SFLASH_STATUS_REGISTER_BLOCK_PROTECTED_0             ( (unsigned char) 0x04 )
 #define SFLASH_STATUS_REGISTER_BLOCK_PROTECTED_1             ( (unsigned char) 0x08 )
 #define SFLASH_STATUS_REGISTER_BLOCK_PROTECTED_2             ( (unsigned char) 0x10 ) /* SST Only */
 #define SFLASH_STATUS_REGISTER_BLOCK_PROTECTED_3             ( (unsigned char) 0x20 ) /* SST Only */
 #define SFLASH_STATUS_REGISTER_AUTO_ADDRESS_INCREMENT        ( (unsigned char) 0x40 ) /* SST Only */
 #define SFLASH_STATUS_REGISTER_BLOCK_PROTECT_BITS_READ_ONLY  ( (unsigned char) 0x80 ) /* SST Only */

/* Command definitions */
typedef enum
{

    SFLASH_WRITE_STATUS_REGISTER        = 0x01,  /* WRSR                  */
    SFLASH_WRITE                        = 0x02,
    SFLASH_READ                         = 0x03,
    SFLASH_WRITE_DISABLE                = 0x04, /* WRDI                   */
    SFLASH_READ_STATUS_REGISTER         = 0x05, /* RDSR                   */
    SFLASH_WRITE_ENABLE                 = 0x06, /* WREN                   */
    SFLASH_FAST_READ                    = 0x0B,
    SFLASH_SECTOR_ERASE                 = 0x20, /* SE                     */
    SFLASH_BLOCK_ERASE_MID              = 0x52, /* SE                     */
    SFLASH_BLOCK_ERASE_LARGE            = 0xD8, /* SE                     */
    SFLASH_READ_ID1                     = 0x90, /* data size varies       */
    SFLASH_READ_ID2                     = 0xAB, /* data size varies       */
    SFLASH_READ_JEDEC_ID                = 0x9F, /* RDID                   */
    SFLASH_CHIP_ERASE1                  = 0x60, /* CE                     */
    SFLASH_CHIP_ERASE2                  = 0xC7, /* CE                     */
    SFLASH_ENABLE_WRITE_STATUS_REGISTER = 0x50, /* EWSR   - SST only      */
    SFLASH_READ_SECURITY_REGISTER       = 0x2B, /* RDSCUR - Macronix only */
    SFLASH_WRITE_SECURITY_REGISTER      = 0x2F, /* WRSCUR - Macronix only */
    SFLASH_ENTER_SECURED_OTP            = 0xB1, /* ENSO   - Macronix only */
    SFLASH_EXIT_SECURED_OTP             = 0xC1, /* EXSO   - Macronix only */
    SFLASH_DEEP_POWER_DOWN              = 0xB9, /* DP     - Macronix only */
    SFLASH_RELEASE_DEEP_POWER_DOWN      = 0xAB, /* RDP    - Macronix only */


} sflash_command_t;


#endif /* SPI_H_ */
