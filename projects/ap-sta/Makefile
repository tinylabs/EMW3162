
BINARY = bin/out.bin
BINARY_STRIPPED = bin/out.stripped.bin

SRCS=apsta.c
BUILDDIR=build
BSP=./bsp

ARM=$(BSP)/arm/bin/Linux64/
CC=$(ARM)arm-none-eabi-gcc
STRIP=$(ARM)arm-none-eabi-strip	





#INCLUDES=-I../build/snip_apsta-MXCHIP3162-FreeRTOS-LwIP/resources/  -I../WICED/platform/MCU/STM32F2xx/peripherals/libraries/. -I../WICED/platform/MCU/STM32F2xx/peripherals/libraries//inc -I../WICED/platform/MCU/STM32F2xx/peripherals/libraries/../../../ARM_CM3/CMSIS -I../libraries/utilities/ring_buffer/. -I../WICED/platform/MCU/STM32F2xx/peripherals/. -I../WICED/platform/GCC/. -I../libraries/utilities/base64/. -I../libraries/daemons/DHCP_server/. -I.././WICED/network/LwIP/WWD/FreeRTOS/. -I.././WICED/platform/MCU/STM32F2xx/. -I.././WICED/platform/MCU/STM32F2xx/.. -I.././WICED/platform/MCU/STM32F2xx/../.. -I.././WICED/platform/MCU/STM32F2xx/../../include -I.././WICED/platform/MCU/STM32F2xx/../../ARM_CM3 -I.././WICED/platform/MCU/STM32F2xx/../../ARM_CM3/CMSIS -I.././WICED/platform/MCU/STM32F2xx/../../GCC -I.././WICED/platform/MCU/STM32F2xx/peripherals -I.././WICED/platform/MCU/STM32F2xx/WAF -I.././WICED/platform/MCU/STM32F2xx/../../../../../apps/waf/bootloader/ -I../libraries/filesystems/wicedfs/. -I.././WICED/WWD/. -I.././WICED/WWD/include -I.././WICED/WWD/include/network -I.././WICED/WWD/include/RTOS -I.././WICED/WWD/internal/bus_protocols/SDIO -I.././WICED/WWD/internal/chips/43362A2 -I../libraries/protocols/DNS/. -I../libraries/daemons/DNS_redirect/. -I../libraries/daemons/HTTP_server/. -I.././WICED/security/BESL/host/WICED -I.././WICED/security/BESL/TLS -I.././WICED/security/BESL/crypto -I.././WICED/security/BESL/TLV -I.././WICED/security/BESL/WPS -I.././WICED/security/BESL/include -I.././WICED/security/BESL/P2P -I.././WICED/security/BESL/crypto/srp -I.././WICED/security/BESL/crypto/ed25519 -I.././WICED/network/LwIP/WICED/. -I.././WICED/network/LwIP/WWD/. -I.././WICED/RTOS/FreeRTOS/WICED/. -I.././WICED/RTOS/FreeRTOS/WWD/. -I.././WICED/RTOS/FreeRTOS/WWD/./MXCHIP3162 -I.././WICED/RTOS/FreeRTOS/WWD/./ARM_CM3 -I../libraries/drivers/spi_flash/. -I.././WICED/. -I../WICED/network/LwIP/ver1.4.0.rc1 -I../WICED/network/LwIP/ver1.4.0.rc1/src/include -I../WICED/network/LwIP/ver1.4.0.rc1/src/include/ipv4 -I../WICED/network/LwIP/WICED -I../WICED/RTOS/FreeRTOS/ver7.5.2/Source/include -I../WICED/RTOS/FreeRTOS/ver7.5.2/Source/portable/GCC/ARM_CM3 -I../platforms/MXCHIP3162/. -I../apps/snip/apsta/ -I../WICED/WWD/internal/chips/43362A2 -I../libraries -I../include -DUSE_STDPERIPH_DRIVER -D_STM32F205RGT6_ -D_STM3x_ -D_STM32x_ -DMAX_WATCHDOG_TIMEOUT_SECONDS=22 -DFIRMWARE_WITH_PMK_CALC_SUPPORT -DADD_LWIP_EAPOL_SUPPORT -DNXD_EXTENDED_BSD_SOCKET_SUPPORT -DOPENSSL -DSTDC_HEADERS -DUSE_SRP_SHA_512 -DWWD_STARTUP_DELAY=10 -DBOOTLOADER_MAGIC_NUMBER=0x4d435242 -DNETWORK_LwIP=1 -DLwIP_VERSION=\"v1.4.0.rc1\" -DRTOS_FreeRTOS=1 -DconfigUSE_MUTEXES -DconfigUSE_RECURSIVE_MUTEXES -DFreeRTOS_VERSION=\"v7.5.2\" -DWWD_DIRECT_RESOURCES -DHSE_VALUE=26000000 -DCRLF_STDIO_REPLACEMENT -DWIFI_CONFIG_APPLICATION_DEFINED -DWICED_SDK_WIFI_CONFIG_DCT_H=\"./apps/snip/apsta/wifi_config_dct.h\" -DCUSTOM_DEFAULT_DCT=1
INCLUDES=-I$(BSP)/include -I$(BSP)/include/periph  -I$(BSP)/include/WWD -I$(BSP)/include/WWD/network -I$(BSP)/include/platform -I$(BSP)/include/libraries -I$(BSP)/include/WWD/internal  -I$(BSP)/include/WWD/internal/chips -I$(BSP)/include/RTOS/FreeRTOS -I$(BSP)/include/platform/ARM_CM3 -I$(BSP)/include/RTOS/FreeRTOS/ARM_CM3 -I$(BSP)/include/MXCHIP3162 -I$(BSP)/include/network/lwip -I$(BSP)/include/network/lwip/ipv4 -I$(BSP)/include/security/BESL/include

DEFINES=-DPLATFORM=\"MXCHIP3162\"
CCFLAGS=$(DEFINES) -isystem $(ARM)/../../include -isystem $(ARM)/../../lib/include -isystem $(ARM)/../../lib/include-fixed -c  -MD -mthumb -mcpu=cortex-m3    -mlittle-endian   -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common $(INCLUDES) -DNDEBUG -ggdb -O3 
LIBRARYLIST=./bsp/link.opts

LDFLAGS=-L$(BSP)/ld/  -T$(BSP)/ld/app_with_bootloader.ld
CCLINKFLAGS=-Wl,--gc-sections -Wl,-O3 -mthumb -mcpu=cortex-m3 -Wl,-A,thumb -mlittle-endian -nostartfiles -Wl,--defsym,__STACKSIZE__=800 $(LDFLAGS) -Wl,--start-group  bsp/lib/*.o bsp/lib/*.a 



OBJECTS := $(addprefix $(BUILDDIR)/,$(SRCS:%.c=%.o))

all: $(BINARY_STRIPPED)

clean:
	rm -rf ./bin
	rm -rf ./build
	



$(BINARY_STRIPPED): $(BINARY)
	$(STRIP) -o $@ $(STRIPFLAGS) $<

$(BINARY): $(OBJECTS)
	@mkdir -p bin
	$(CC) $(CCLINKFLAGS)  $(OBJECTS) -Wl,--end-group  -o $(BINARY) 
	cp $(BSP)/bin/waf_bootloader-NoOS-NoNS-EMW3162-SDIO.stripped.elf ./bin/bootloader.elf
	cp $(BSP)/bin/DCT.bin ./bin/DCT.bin
	cp $(BSP)/bin/DCT.stripped.elf ./bin/DCT.elf
	
$(BUILDDIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CCFLAGS)  -o $@ $<

download:
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/bootloader.elf" -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/DCT.elf" -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/out.stripped.bin" -c shutdown
