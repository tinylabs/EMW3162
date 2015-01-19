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



#endif /* SPI_H_ */
