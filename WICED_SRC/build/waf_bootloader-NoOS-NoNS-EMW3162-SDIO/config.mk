WICED_SDK_MAKEFILES           += ./WICED/platform/MCU/STM32F2xx/peripherals/libraries/libraries.mk ./libraries/utilities/ring_buffer/ring_buffer.mk ./WICED/platform/MCU/STM32F2xx/peripherals/peripherals.mk ./WICED/platform/GCC/GCC.mk ././WICED/platform/MCU/STM32F2xx/STM32F2xx.mk ././WICED/WWD/WWD.mk ./libraries/drivers/spi_flash/spi_flash.mk ././WICED/network/NoNS/WWD/WWD.mk ././WICED/RTOS/NoOS/WWD/WWD.mk ./libraries/filesystems/wicedfs/wicedfs.mk ././WICED/WICED.mk ./platforms/EMW3162/EMW3162.mk ./WICED/network/NoNS/NoNS.mk ./WICED/RTOS/NoOS/NoOS.mk ./apps/waf/bootloader/bootloader.mk
TOOLCHAIN_NAME            := GCC
WICED_SDK_LDFLAGS             += -Wl,--gc-sections -Wl,-O3 -Wl,--cref -mthumb -mcpu=cortex-m3 -Wl,-A,thumb -mlittle-endian -nostartfiles -Wl,--defsym,__STACKSIZE__=4000 -L ./WICED/platform/MCU/STM32F2xx/GCC -L ./WICED/platform/MCU/STM32F2xx/GCC/STM32F2x5
RESOURCE_CFLAGS           += -mthumb -mcpu=cortex-m3 -mlittle-endian
WICED_SDK_LINK_SCRIPT         += ././WICED/platform/MCU/STM32F2xx/GCC/bootloader.ld
WICED_SDK_LINK_SCRIPT_CMD     += -Wl,-T ././WICED/platform/MCU/STM32F2xx/GCC/bootloader.ld
WICED_SDK_PREBUILT_LIBRARIES  += 
WICED_SDK_CERTIFICATES        += 
WICED_SDK_PRE_APP_BUILDS      += 
WICED_SDK_DCT_LINK_SCRIPT     += ././WICED/platform/MCU/STM32F2xx/GCC/STM32F2x5/dct.ld
WICED_SDK_DCT_LINK_CMD        += -Wl,-T ././WICED/platform/MCU/STM32F2xx/GCC/STM32F2x5/dct.ld
WICED_SDK_APPLICATION_DCT     += 
WICED_SDK_WIFI_CONFIG_DCT_H   += ./include/default_wifi_config_dct.h
WICED_SDK_LINK_FILES          +=                      $(OUTPUT_DIR)/Modules/./WICED/platform/MCU/STM32F2xx/../../ARM_CM3/crt0_GCC.o $(OUTPUT_DIR)/Modules/./WICED/platform/MCU/STM32F2xx/../../ARM_CM3/hardfault_handler.o $(OUTPUT_DIR)/Modules/./WICED/platform/MCU/STM32F2xx/platform_vector_table.o $(OUTPUT_DIR)/Modules/./WICED/platform/MCU/STM32F2xx/WAF/waf_platform.o  $(OUTPUT_DIR)/Modules/WICED/platform/GCC/mem_newlib.o $(OUTPUT_DIR)/Modules/WICED/platform/GCC/stdio_newlib.o      
WICED_SDK_INCLUDES            +=                                 -I./WICED/platform/MCU/STM32F2xx/peripherals/libraries/. -I./WICED/platform/MCU/STM32F2xx/peripherals/libraries//inc -I./WICED/platform/MCU/STM32F2xx/peripherals/libraries/../../../ARM_CM3/CMSIS -I./libraries/utilities/ring_buffer/. -I./WICED/platform/MCU/STM32F2xx/peripherals/. -I./WICED/platform/GCC/. -I././WICED/platform/MCU/STM32F2xx/. -I././WICED/platform/MCU/STM32F2xx/.. -I././WICED/platform/MCU/STM32F2xx/../.. -I././WICED/platform/MCU/STM32F2xx/../../include -I././WICED/platform/MCU/STM32F2xx/../../ARM_CM3 -I././WICED/platform/MCU/STM32F2xx/../../ARM_CM3/CMSIS -I././WICED/platform/MCU/STM32F2xx/../../GCC -I././WICED/platform/MCU/STM32F2xx/peripherals -I././WICED/WWD/. -I././WICED/WWD/include -I././WICED/WWD/include/network -I././WICED/WWD/include/RTOS -I././WICED/WWD/internal/bus_protocols/SDIO -I././WICED/WWD/internal/chips/43362A2 -I./libraries/drivers/spi_flash/. -I././WICED/network/NoNS/WWD/. -I././WICED/RTOS/NoOS/WWD/. -I./libraries/filesystems/wicedfs/. -I././WICED/. -I./platforms/EMW3162/. -I./WICED/RTOS/NoOS/. -I./WICED/RTOS/NoOS/WICED -I./apps/waf/bootloader/. -I./WICED/WWD/internal/chips/43362A2 -I./libraries -I./include
WICED_SDK_DEFINES             +=                  -DUSE_STDPERIPH_DRIVER -D_STM32F205RGT6_ -D_STM3x_ -D_STM32x_ -DMAX_WATCHDOG_TIMEOUT_SECONDS=22 -DFIRMWARE_WITH_PMK_CALC_SUPPORT -DWWD_STARTUP_DELAY=10 -DBOOTLOADER_MAGIC_NUMBER=0x4d435242 -DWWD_DIRECT_RESOURCES -DHSE_VALUE=26000000 -DCRLF_STDIO_REPLACEMENT -DNETWORK_NoNS=1 -DRTOS_NoOS=1 -DWICED_NO_WIFI -DWICED_DISABLE_STDIO -DWICED_DISABLE_MCU_POWERSAVE -DWICED_SDK_WIFI_CONFIG_DCT_H=\"./include/default_wifi_config_dct.h\"
COMPONENTS                := App_WICED_Bootloader_EMW3162 NoOS NoNS Platform_EMW3162 WICED Lib_Wiced_RO_FS WWD_NoOS_Interface WWD_NoNS_Interface SPI_Flash_Library_EMW3162 WWD_for_SDIO_NoOS STM32F2xx common_GCC STM32F2xx_Peripheral_Drivers Ring_Buffer STM32F2xx_Peripheral_Libraries
BUS                       := SDIO
NETWORK_FULL              := NoNS
RTOS_FULL                 := NoOS
PLATFORM_FULL             := EMW3162
APP_FULL                  := waf/bootloader
NETWORK                   := NoNS
RTOS                      := NoOS
PLATFORM                  := EMW3162
APP                       := bootloader
HOST_OPENOCD                := stm32f2x
HOST_ARCH                 := ARM_CM3
WICED_SDK_CERTIFICATE         := ./resources/certificates/brcm_demo_server_cert.cer
WICED_SDK_PRIVATE_KEY         :=  ./resources/certificates/brcm_demo_server_cert_key.key
App_WICED_Bootloader_EMW3162_LOCATION         := ./apps/waf/bootloader/
NoOS_LOCATION         := ./WICED/RTOS/NoOS/
NoNS_LOCATION         := ./WICED/network/NoNS/
Platform_EMW3162_LOCATION         := ./platforms/EMW3162/
WICED_LOCATION         := ././WICED/
Lib_Wiced_RO_FS_LOCATION         := ./libraries/filesystems/wicedfs/
WWD_NoOS_Interface_LOCATION         := ././WICED/RTOS/NoOS/WWD/
WWD_NoNS_Interface_LOCATION         := ././WICED/network/NoNS/WWD/
SPI_Flash_Library_EMW3162_LOCATION         := ./libraries/drivers/spi_flash/
WWD_for_SDIO_NoOS_LOCATION         := ././WICED/WWD/
STM32F2xx_LOCATION         := ././WICED/platform/MCU/STM32F2xx/
common_GCC_LOCATION         := ./WICED/platform/GCC/
STM32F2xx_Peripheral_Drivers_LOCATION         := ./WICED/platform/MCU/STM32F2xx/peripherals/
Ring_Buffer_LOCATION         := ./libraries/utilities/ring_buffer/
STM32F2xx_Peripheral_Libraries_LOCATION         := ./WICED/platform/MCU/STM32F2xx/peripherals/libraries/
App_WICED_Bootloader_EMW3162_SOURCES          += bootloader.c
NoOS_SOURCES          += 
NoNS_SOURCES          += 
Platform_EMW3162_SOURCES          += platform.c
WICED_SOURCES          += 
Lib_Wiced_RO_FS_SOURCES          += wicedfs.c
WWD_NoOS_Interface_SOURCES          += wwd_rtos.c Cortex_M3_M4/noos.c
WWD_NoNS_Interface_SOURCES          += wwd_buffer.c
SPI_Flash_Library_EMW3162_SOURCES          += spi_flash.c spi_flash_wiced.c
WWD_for_SDIO_NoOS_SOURCES          += internal/wwd_thread.c internal/wwd_sdpcm.c internal/wwd_internal.c internal/wwd_management.c internal/wwd_wifi.c internal/wwd_crypto.c internal/wwd_logging.c internal/bus_protocols/wwd_bus_common.c internal/bus_protocols/SDIO/wwd_bus_protocol.c internal/chips/43362A2/wwd_ap.c
STM32F2xx_SOURCES          += ../../ARM_CM3/crt0_GCC.c ../../ARM_CM3/hardfault_handler.c ../platform_resource.c ../platform_stdio.c ../wiced_platform_common.c ../wwd_platform_common.c ../wwd_resources.c platform_vector_table.c platform_init.c platform_unhandled_isr.c WWD/wwd_platform.c WWD/wwd_SDIO.c WAF/waf_platform.c
common_GCC_SOURCES          += mem_newlib.c math_newlib.c cxx_funcs.c stdio_newlib.c
STM32F2xx_Peripheral_Drivers_SOURCES          += platform_adc.c platform_gpio.c platform_i2c.c platform_mcu_powersave.c platform_pwm.c platform_rtc.c platform_spi.c platform_uart.c platform_watchdog.c
Ring_Buffer_SOURCES          += ring_buffer.c
STM32F2xx_Peripheral_Libraries_SOURCES          += src/misc.c src/stm32f2xx_adc.c src/stm32f2xx_can.c src/stm32f2xx_crc.c src/stm32f2xx_dac.c src/stm32f2xx_dbgmcu.c src/stm32f2xx_dma.c src/stm32f2xx_exti.c src/stm32f2xx_flash.c src/stm32f2xx_fsmc.c src/stm32f2xx_gpio.c src/stm32f2xx_rng.c src/stm32f2xx_i2c.c src/stm32f2xx_iwdg.c src/stm32f2xx_pwr.c src/stm32f2xx_rcc.c src/stm32f2xx_rtc.c src/stm32f2xx_sdio.c src/stm32f2xx_spi.c src/stm32f2xx_syscfg.c src/stm32f2xx_tim.c src/stm32f2xx_usart.c src/stm32f2xx_wwdg.c
App_WICED_Bootloader_EMW3162_CHECK_HEADERS    += 
NoOS_CHECK_HEADERS    += 
NoNS_CHECK_HEADERS    += 
Platform_EMW3162_CHECK_HEADERS    += 
WICED_CHECK_HEADERS    += 
Lib_Wiced_RO_FS_CHECK_HEADERS    += 
WWD_NoOS_Interface_CHECK_HEADERS    += wwd_rtos.h
WWD_NoNS_Interface_CHECK_HEADERS    += wwd_buffer.h
SPI_Flash_Library_EMW3162_CHECK_HEADERS    += 
WWD_for_SDIO_NoOS_CHECK_HEADERS    += internal/wwd_ap.h internal/wwd_bcmendian.h internal/wwd_internal.h internal/wwd_logging.h internal/wwd_sdpcm.h internal/wwd_thread.h internal/bus_protocols/wwd_bus_protocol_interface.h internal/bus_protocols/SDIO/wwd_bus_protocol.h internal/chips/43362A2/chip_constants.h include/wwd_assert.h include/wwd_constants.h include/wwd_crypto.h include/wwd_debug.h include/wwd_events.h include/wwd_management.h include/wwd_poll.h include/wwd_structures.h include/wwd_wifi.h include/wwd_wlioctl.h include/Network/wwd_buffer_interface.h include/Network/wwd_network_constants.h include/Network/wwd_network_interface.h include/platform/wwd_bus_interface.h include/platform/wwd_platform_interface.h include/platform/wwd_resource_interface.h include/platform/wwd_sdio_interface.h include/platform/wwd_spi_interface.h include/RTOS/wwd_rtos_interface.h
STM32F2xx_CHECK_HEADERS    += 
common_GCC_CHECK_HEADERS    += 
STM32F2xx_Peripheral_Drivers_CHECK_HEADERS    += 
Ring_Buffer_CHECK_HEADERS    += 
STM32F2xx_Peripheral_Libraries_CHECK_HEADERS    += 
App_WICED_Bootloader_EMW3162_INCLUDES         := 
NoOS_INCLUDES         := 
NoNS_INCLUDES         := 
Platform_EMW3162_INCLUDES         := 
WICED_INCLUDES         := 
Lib_Wiced_RO_FS_INCLUDES         := 
WWD_NoOS_Interface_INCLUDES         := 
WWD_NoNS_Interface_INCLUDES         := 
SPI_Flash_Library_EMW3162_INCLUDES         := 
WWD_for_SDIO_NoOS_INCLUDES         := 
STM32F2xx_INCLUDES         := 
common_GCC_INCLUDES         := 
STM32F2xx_Peripheral_Drivers_INCLUDES         := 
Ring_Buffer_INCLUDES         := 
STM32F2xx_Peripheral_Libraries_INCLUDES         := 
App_WICED_Bootloader_EMW3162_DEFINES          := 
NoOS_DEFINES          := 
NoNS_DEFINES          := 
Platform_EMW3162_DEFINES          := 
WICED_DEFINES          := 
Lib_Wiced_RO_FS_DEFINES          := 
WWD_NoOS_Interface_DEFINES          := 
WWD_NoNS_Interface_DEFINES          := 
SPI_Flash_Library_EMW3162_DEFINES          := -DSFLASH_SUPPORT_SST_PARTS -DSFLASH_SUPPORT_MACRONIX_PARTS -DSFLASH_SUPPORT_EON_PARTS
WWD_for_SDIO_NoOS_DEFINES          := 
STM32F2xx_DEFINES          := 
common_GCC_DEFINES          := 
STM32F2xx_Peripheral_Drivers_DEFINES          := 
Ring_Buffer_DEFINES          := 
STM32F2xx_Peripheral_Libraries_DEFINES          := 
App_WICED_Bootloader_EMW3162_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
NoOS_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
NoNS_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
Platform_EMW3162_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
WICED_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
Lib_Wiced_RO_FS_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
WWD_NoOS_Interface_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
WWD_NoNS_Interface_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
SPI_Flash_Library_EMW3162_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
WWD_for_SDIO_NoOS_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
common_GCC_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_Peripheral_Drivers_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
Ring_Buffer_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_Peripheral_Libraries_CFLAGS           :=     -mthumb -mcpu=cortex-m3    -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
App_WICED_Bootloader_EMW3162_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
NoOS_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
NoNS_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
Platform_EMW3162_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
WICED_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
Lib_Wiced_RO_FS_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
WWD_NoOS_Interface_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
WWD_NoNS_Interface_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
SPI_Flash_Library_EMW3162_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
WWD_for_SDIO_NoOS_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
common_GCC_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_Peripheral_Drivers_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
Ring_Buffer_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_Peripheral_Libraries_CXXFLAGS         :=     -mthumb -mcpu=cortex-m3  -mlittle-endian           -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/waf_bootloader-NoOS-NoNS-EMW3162-SDIO/resources/ -DPLATFORM=\"EMW3162\"
App_WICED_Bootloader_EMW3162_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
NoOS_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
NoNS_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
Platform_EMW3162_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
WICED_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
Lib_Wiced_RO_FS_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
WWD_NoOS_Interface_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
WWD_NoNS_Interface_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
SPI_Flash_Library_EMW3162_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
WWD_for_SDIO_NoOS_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
STM32F2xx_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
common_GCC_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
STM32F2xx_Peripheral_Drivers_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
Ring_Buffer_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
STM32F2xx_Peripheral_Libraries_ASMFLAGS         :=     -mcpu=cortex-m3 -mfpu=softvfp             -ggdb
App_WICED_Bootloader_EMW3162_RESOURCES        := 
NoOS_RESOURCES        := 
NoNS_RESOURCES        := 
Platform_EMW3162_RESOURCES        := 
WICED_RESOURCES        := 
Lib_Wiced_RO_FS_RESOURCES        := 
WWD_NoOS_Interface_RESOURCES        := 
WWD_NoNS_Interface_RESOURCES        := 
SPI_Flash_Library_EMW3162_RESOURCES        := 
WWD_for_SDIO_NoOS_RESOURCES        := ./resources/firmware/43362/43362A2.bin
STM32F2xx_RESOURCES        := 
common_GCC_RESOURCES        := 
STM32F2xx_Peripheral_Drivers_RESOURCES        := 
Ring_Buffer_RESOURCES        := 
STM32F2xx_Peripheral_Libraries_RESOURCES        := 
App_WICED_Bootloader_EMW3162_MAKEFILE         := ./apps/waf/bootloader/bootloader.mk
NoOS_MAKEFILE         := ./WICED/RTOS/NoOS/NoOS.mk
NoNS_MAKEFILE         := ./WICED/network/NoNS/NoNS.mk
Platform_EMW3162_MAKEFILE         := ./platforms/EMW3162/EMW3162.mk
WICED_MAKEFILE         := ././WICED/WICED.mk
Lib_Wiced_RO_FS_MAKEFILE         := ./libraries/filesystems/wicedfs/wicedfs.mk
WWD_NoOS_Interface_MAKEFILE         := ././WICED/RTOS/NoOS/WWD/WWD.mk
WWD_NoNS_Interface_MAKEFILE         := ././WICED/network/NoNS/WWD/WWD.mk
SPI_Flash_Library_EMW3162_MAKEFILE         := ./libraries/drivers/spi_flash/spi_flash.mk
WWD_for_SDIO_NoOS_MAKEFILE         := ././WICED/WWD/WWD.mk
STM32F2xx_MAKEFILE         := ././WICED/platform/MCU/STM32F2xx/STM32F2xx.mk
common_GCC_MAKEFILE         := ./WICED/platform/GCC/GCC.mk
STM32F2xx_Peripheral_Drivers_MAKEFILE         := ./WICED/platform/MCU/STM32F2xx/peripherals/peripherals.mk
Ring_Buffer_MAKEFILE         := ./libraries/utilities/ring_buffer/ring_buffer.mk
STM32F2xx_Peripheral_Libraries_MAKEFILE         := ./WICED/platform/MCU/STM32F2xx/peripherals/libraries/libraries.mk
App_WICED_Bootloader_EMW3162_PREBUILT_LIBRARY := 
NoOS_PREBUILT_LIBRARY := 
NoNS_PREBUILT_LIBRARY := 
Platform_EMW3162_PREBUILT_LIBRARY := 
WICED_PREBUILT_LIBRARY := 
Lib_Wiced_RO_FS_PREBUILT_LIBRARY := 
WWD_NoOS_Interface_PREBUILT_LIBRARY := 
WWD_NoNS_Interface_PREBUILT_LIBRARY := 
SPI_Flash_Library_EMW3162_PREBUILT_LIBRARY := 
WWD_for_SDIO_NoOS_PREBUILT_LIBRARY := 
STM32F2xx_PREBUILT_LIBRARY := 
common_GCC_PREBUILT_LIBRARY := 
STM32F2xx_Peripheral_Drivers_PREBUILT_LIBRARY := 
Ring_Buffer_PREBUILT_LIBRARY := 
STM32F2xx_Peripheral_Libraries_PREBUILT_LIBRARY := 
WICED_SDK_UNIT_TEST_SOURCES   :=            ./libraries/filesystems/wicedfs/unit/wicedfs_unit_images.c ./libraries/filesystems/wicedfs/unit/wicedfs_unit.cpp                  
APP_WWD_ONLY              := 1
USES_BOOTLOADER_OTA       := 1
NODCT                     := 
ALL_RESOURCES             :=  ./resources/firmware/43362/43362A2.bin
INTERNAL_MEMORY_RESOURCES :=  ./resources/firmware/43362/43362A2.bin
PLATFORM_TARGETS_MAKEFILE := ./tools/makefiles//standard_platform_targets.mk
