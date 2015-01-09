WICED_SDK_MAKEFILES           += ./WICED/platform/MCU/STM32F2xx/peripherals/libraries/libraries.mk ./libraries/utilities/ring_buffer/ring_buffer.mk ./WICED/platform/MCU/STM32F2xx/peripherals/peripherals.mk ./WICED/platform/GCC/GCC.mk ./libraries/utilities/base64/base64.mk ./libraries/daemons/DHCP_server/DHCP_server.mk ././WICED/platform/MCU/STM32F2xx/STM32F2xx.mk ./libraries/filesystems/wicedfs/wicedfs.mk ././WICED/WWD/WWD.mk ./libraries/protocols/DNS/DNS.mk ./libraries/daemons/DNS_redirect/DNS_redirect.mk ./libraries/daemons/HTTP_server/HTTP_server.mk ././WICED/security/BESL/BESL.mk ././WICED/network/NetX_Duo/WICED/WICED.mk ././WICED/network/NetX_Duo/WWD/WWD.mk ././WICED/RTOS/ThreadX/WICED/WICED.mk ././WICED/RTOS/ThreadX/WWD/WWD.mk ./libraries/drivers/spi_flash/spi_flash.mk ././WICED/WICED.mk ./WICED/network/NetX_Duo/NetX_Duo.mk ./WICED/RTOS/ThreadX/ThreadX.mk ./platforms/EMW3162/EMW3162.mk
TOOLCHAIN_NAME            := GCC
WICED_SDK_LDFLAGS             += -Wl,--gc-sections -Wl,-O3 -Wl,--cref -mthumb -mcpu=cortex-m3 -Wl,-A,thumb -mlittle-endian -nostartfiles -Wl,--defsym,__STACKSIZE__=800 -L ./WICED/platform/MCU/STM32F2xx/GCC -L ./WICED/platform/MCU/STM32F2xx/GCC/STM32F2x5
RESOURCE_CFLAGS           += -mthumb -mcpu=cortex-m3 -mlittle-endian
WICED_SDK_LINK_SCRIPT         += ././WICED/platform/MCU/STM32F2xx/GCC/app_with_bootloader.ld
WICED_SDK_LINK_SCRIPT_CMD     += -Wl,-T ././WICED/platform/MCU/STM32F2xx/GCC/app_with_bootloader.ld
WICED_SDK_PREBUILT_LIBRARIES  += ./WICED/RTOS/ThreadX/ThreadX.ARM_CM3.release.a ./WICED/network/NetX_Duo/NetX_Duo.ARM_CM3.release.a ././WICED/security/BESL/BESL.ARM_CM3.release.a
WICED_SDK_CERTIFICATES        += 
WICED_SDK_PRE_APP_BUILDS      += bootloader
WICED_SDK_DCT_LINK_SCRIPT     += ././WICED/platform/MCU/STM32F2xx/GCC/STM32F2x5/dct.ld
WICED_SDK_DCT_LINK_CMD        += -Wl,-T ././WICED/platform/MCU/STM32F2xx/GCC/STM32F2x5/dct.ld
WICED_SDK_APPLICATION_DCT     += 
WICED_SDK_WIFI_CONFIG_DCT_H   += ./include/default_wifi_config_dct.h
WICED_SDK_LINK_FILES          +=                                $(OUTPUT_DIR)/Modules/./WICED/platform/MCU/STM32F2xx/../../ARM_CM3/crt0_GCC.o $(OUTPUT_DIR)/Modules/./WICED/platform/MCU/STM32F2xx/../../ARM_CM3/hardfault_handler.o $(OUTPUT_DIR)/Modules/./WICED/platform/MCU/STM32F2xx/platform_vector_table.o      $(OUTPUT_DIR)/Modules/WICED/platform/GCC/mem_newlib.o $(OUTPUT_DIR)/Modules/WICED/platform/GCC/stdio_newlib.o      
WICED_SDK_INCLUDES            +=                                                    -I./WICED/platform/MCU/STM32F2xx/peripherals/libraries/. -I./WICED/platform/MCU/STM32F2xx/peripherals/libraries//inc -I./WICED/platform/MCU/STM32F2xx/peripherals/libraries/../../../ARM_CM3/CMSIS -I./libraries/utilities/ring_buffer/. -I./WICED/platform/MCU/STM32F2xx/peripherals/. -I./WICED/platform/GCC/. -I./libraries/utilities/base64/. -I./libraries/daemons/DHCP_server/. -I././WICED/platform/MCU/STM32F2xx/. -I././WICED/platform/MCU/STM32F2xx/.. -I././WICED/platform/MCU/STM32F2xx/../.. -I././WICED/platform/MCU/STM32F2xx/../../include -I././WICED/platform/MCU/STM32F2xx/../../ARM_CM3 -I././WICED/platform/MCU/STM32F2xx/../../ARM_CM3/CMSIS -I././WICED/platform/MCU/STM32F2xx/../../GCC -I././WICED/platform/MCU/STM32F2xx/peripherals -I././WICED/platform/MCU/STM32F2xx/WAF -I././WICED/platform/MCU/STM32F2xx/../../../../../apps/waf/bootloader/ -I./libraries/filesystems/wicedfs/. -I././WICED/WWD/. -I././WICED/WWD/include -I././WICED/WWD/include/network -I././WICED/WWD/include/RTOS -I././WICED/WWD/internal/bus_protocols/SDIO -I././WICED/WWD/internal/chips/43362A2 -I./libraries/protocols/DNS/. -I./libraries/daemons/DNS_redirect/. -I./libraries/daemons/HTTP_server/. -I././WICED/security/BESL/host/WICED -I././WICED/security/BESL/TLS -I././WICED/security/BESL/crypto -I././WICED/security/BESL/TLV -I././WICED/security/BESL/WPS -I././WICED/security/BESL/include -I././WICED/security/BESL/P2P -I././WICED/security/BESL/crypto/srp -I././WICED/security/BESL/crypto/ed25519 -I././WICED/network/NetX_Duo/WICED/. -I././WICED/network/NetX_Duo/WWD/. -I././WICED/RTOS/ThreadX/WICED/. -I././WICED/RTOS/ThreadX/WWD/. -I./libraries/drivers/spi_flash/. -I././WICED/. -I./WICED/network/NetX_Duo/ver5.7_sp1 -I./WICED/network/NetX_Duo/WICED -I./WICED/RTOS/ThreadX/ver5.6 -I./WICED/RTOS/ThreadX/ver5.6/Cortex_M3_M4/GCC -I./platforms/EMW3162/. -I./WICED/WWD/internal/chips/43362A2 -I./libraries -I./include
WICED_SDK_DEFINES             +=                            -DUSE_STDPERIPH_DRIVER -D_STM32F215RGT6_ -D_STM3x_ -D_STM32x_ -DMAX_WATCHDOG_TIMEOUT_SECONDS=22 -DFIRMWARE_WITH_PMK_CALC_SUPPORT -DADD_LWIP_EAPOL_SUPPORT -DNXD_EXTENDED_BSD_SOCKET_SUPPORT -DOPENSSL -DSTDC_HEADERS -DUSE_SRP_SHA_512 -DADD_NETX_EAPOL_SUPPORT -DUSE_MICRORNG -DWWD_STARTUP_DELAY=10 -DBOOTLOADER_MAGIC_NUMBER=0x4d435242 -DNETWORK_NetX_Duo=1 -DNetX_Duo_VERSION=\"v5.7_sp1\" -DNX_INCLUDE_USER_DEFINE_FILE -D__fd_set_defined -DSYS_TIME_H_AVAILABLE -DRTOS_ThreadX=1 -DThreadX_VERSION=\"v5.6\" -DTX_INCLUDE_USER_DEFINE_FILE -DWWD_DIRECT_RESOURCES -DHSE_VALUE=26000000 -DCRLF_STDIO_REPLACEMENT -DWICED_SDK_WIFI_CONFIG_DCT_H=\"./include/default_wifi_config_dct.h\"
COMPONENTS                := Platform_EMW3162 ThreadX NetX_Duo WICED SPI_Flash_Library_EMW3162 WWD_ThreadX_Interface Wiced_ThreadX_Interface WWD_NetX_Duo_Interface Wiced_NetX_Interface Supplicant_BESL Lib_HTTP_Server Lib_DNS_Redirect_Daemon Lib_DNS WWD_for_SDIO_ThreadX Lib_Wiced_RO_FS STM32F2xx Lib_DHCP_Server Lib_base64 common_GCC STM32F2xx_Peripheral_Drivers Ring_Buffer STM32F2xx_Peripheral_Libraries
BUS                       := SDIO
NETWORK_FULL              := 
RTOS_FULL                 := 
PLATFORM_FULL             := EMW3162
APP_FULL                  := 
NETWORK                   := NetX_Duo
RTOS                      := ThreadX
PLATFORM                  := EMW3162
APP                       := 
HOST_OPENOCD                := stm32f2x
HOST_ARCH                 := ARM_CM3
WICED_SDK_CERTIFICATE         := ./resources/certificates/brcm_demo_server_cert.cer
WICED_SDK_PRIVATE_KEY         :=  ./resources/certificates/brcm_demo_server_cert_key.key
Platform_EMW3162_LOCATION         := ./platforms/EMW3162/
ThreadX_LOCATION         := ./WICED/RTOS/ThreadX/
NetX_Duo_LOCATION         := ./WICED/network/NetX_Duo/
WICED_LOCATION         := ././WICED/
SPI_Flash_Library_EMW3162_LOCATION         := ./libraries/drivers/spi_flash/
WWD_ThreadX_Interface_LOCATION         := ././WICED/RTOS/ThreadX/WWD/
Wiced_ThreadX_Interface_LOCATION         := ././WICED/RTOS/ThreadX/WICED/
WWD_NetX_Duo_Interface_LOCATION         := ././WICED/network/NetX_Duo/WWD/
Wiced_NetX_Interface_LOCATION         := ././WICED/network/NetX_Duo/WICED/
Supplicant_BESL_LOCATION         := ././WICED/security/BESL/
Lib_HTTP_Server_LOCATION         := ./libraries/daemons/HTTP_server/
Lib_DNS_Redirect_Daemon_LOCATION         := ./libraries/daemons/DNS_redirect/
Lib_DNS_LOCATION         := ./libraries/protocols/DNS/
WWD_for_SDIO_ThreadX_LOCATION         := ././WICED/WWD/
Lib_Wiced_RO_FS_LOCATION         := ./libraries/filesystems/wicedfs/
STM32F2xx_LOCATION         := ././WICED/platform/MCU/STM32F2xx/
Lib_DHCP_Server_LOCATION         := ./libraries/daemons/DHCP_server/
Lib_base64_LOCATION         := ./libraries/utilities/base64/
common_GCC_LOCATION         := ./WICED/platform/GCC/
STM32F2xx_Peripheral_Drivers_LOCATION         := ./WICED/platform/MCU/STM32F2xx/peripherals/
Ring_Buffer_LOCATION         := ./libraries/utilities/ring_buffer/
STM32F2xx_Peripheral_Libraries_LOCATION         := ./WICED/platform/MCU/STM32F2xx/peripherals/libraries/
Platform_EMW3162_SOURCES          += platform.c
ThreadX_SOURCES          += 
NetX_Duo_SOURCES          += 
WICED_SOURCES          += internal/wifi.c internal/config.c internal/config_http_content.c internal/time.c internal/wiced_lib.c internal/management.c internal/system_monitor.c internal/wiced_cooee.c internal/wiced_easy_setup.c internal/waf.c
SPI_Flash_Library_EMW3162_SOURCES          += spi_flash.c spi_flash_wiced.c
WWD_ThreadX_Interface_SOURCES          += wwd_rtos.c low_level_init.c
Wiced_ThreadX_Interface_SOURCES          += wiced_rtos.c ../../wiced_rtos_common.c
WWD_NetX_Duo_Interface_SOURCES          += wwd_buffer.c wwd_network.c
Wiced_NetX_Interface_SOURCES          += wiced_network.c tcpip.c
Supplicant_BESL_SOURCES          += host/WICED/besl_host.c host/WICED/wiced_tls.c host/WICED/wiced_wps.c host/WICED/wiced_p2p.c host/WICED/cipher_suites.c
Lib_HTTP_Server_SOURCES          += http_server.c
Lib_DNS_Redirect_Daemon_SOURCES          += dns_redirect.c
Lib_DNS_SOURCES          += dns.c
WWD_for_SDIO_ThreadX_SOURCES          += internal/wwd_thread.c internal/wwd_sdpcm.c internal/wwd_internal.c internal/wwd_management.c internal/wwd_wifi.c internal/wwd_crypto.c internal/wwd_logging.c internal/bus_protocols/wwd_bus_common.c internal/bus_protocols/SDIO/wwd_bus_protocol.c internal/chips/43362A2/wwd_ap.c
Lib_Wiced_RO_FS_SOURCES          += wicedfs.c
STM32F2xx_SOURCES          += ../../ARM_CM3/crt0_GCC.c ../../ARM_CM3/hardfault_handler.c ../platform_resource.c ../platform_stdio.c ../wiced_platform_common.c ../wwd_platform_common.c ../wwd_resources.c platform_vector_table.c platform_init.c platform_unhandled_isr.c WWD/wwd_platform.c WWD/wwd_SDIO.c
Lib_DHCP_Server_SOURCES          += dhcp_server.c
Lib_base64_SOURCES          += bsd-base64.c
common_GCC_SOURCES          += mem_newlib.c math_newlib.c cxx_funcs.c stdio_newlib.c
STM32F2xx_Peripheral_Drivers_SOURCES          += platform_adc.c platform_gpio.c platform_i2c.c platform_mcu_powersave.c platform_pwm.c platform_rtc.c platform_spi.c platform_uart.c platform_watchdog.c
Ring_Buffer_SOURCES          += ring_buffer.c
STM32F2xx_Peripheral_Libraries_SOURCES          += src/misc.c src/stm32f2xx_adc.c src/stm32f2xx_can.c src/stm32f2xx_crc.c src/stm32f2xx_dac.c src/stm32f2xx_dbgmcu.c src/stm32f2xx_dma.c src/stm32f2xx_exti.c src/stm32f2xx_flash.c src/stm32f2xx_fsmc.c src/stm32f2xx_gpio.c src/stm32f2xx_rng.c src/stm32f2xx_i2c.c src/stm32f2xx_iwdg.c src/stm32f2xx_pwr.c src/stm32f2xx_rcc.c src/stm32f2xx_rtc.c src/stm32f2xx_sdio.c src/stm32f2xx_spi.c src/stm32f2xx_syscfg.c src/stm32f2xx_tim.c src/stm32f2xx_usart.c src/stm32f2xx_wwdg.c
Platform_EMW3162_CHECK_HEADERS    += 
ThreadX_CHECK_HEADERS    += 
NetX_Duo_CHECK_HEADERS    += 
WICED_CHECK_HEADERS    += internal/wiced_internal_api.h ../include/default_wifi_config_dct.h ../include/resource.h ../include/wiced.h ../include/wiced_defaults.h ../include/wiced_easy_setup.h ../include/wiced_framework.h ../include/wiced_management.h ../include/wiced_platform.h ../include/wiced_rtos.h ../include/wiced_security.h ../include/wiced_tcpip.h ../include/wiced_time.h ../include/wiced_utilities.h ../include/wiced_wifi.h
SPI_Flash_Library_EMW3162_CHECK_HEADERS    += 
WWD_ThreadX_Interface_CHECK_HEADERS    += wwd_rtos.h
Wiced_ThreadX_Interface_CHECK_HEADERS    += rtos.h
WWD_NetX_Duo_Interface_CHECK_HEADERS    += wwd_buffer.h wwd_network.h
Wiced_NetX_Interface_CHECK_HEADERS    += wiced_network.h
Supplicant_BESL_CHECK_HEADERS    += 
Lib_HTTP_Server_CHECK_HEADERS    += 
Lib_DNS_Redirect_Daemon_CHECK_HEADERS    += 
Lib_DNS_CHECK_HEADERS    += 
WWD_for_SDIO_ThreadX_CHECK_HEADERS    += internal/wwd_ap.h internal/wwd_bcmendian.h internal/wwd_internal.h internal/wwd_logging.h internal/wwd_sdpcm.h internal/wwd_thread.h internal/bus_protocols/wwd_bus_protocol_interface.h internal/bus_protocols/SDIO/wwd_bus_protocol.h internal/chips/43362A2/chip_constants.h include/wwd_assert.h include/wwd_constants.h include/wwd_crypto.h include/wwd_debug.h include/wwd_events.h include/wwd_management.h include/wwd_poll.h include/wwd_structures.h include/wwd_wifi.h include/wwd_wlioctl.h include/Network/wwd_buffer_interface.h include/Network/wwd_network_constants.h include/Network/wwd_network_interface.h include/platform/wwd_bus_interface.h include/platform/wwd_platform_interface.h include/platform/wwd_resource_interface.h include/platform/wwd_sdio_interface.h include/platform/wwd_spi_interface.h include/RTOS/wwd_rtos_interface.h
Lib_Wiced_RO_FS_CHECK_HEADERS    += 
STM32F2xx_CHECK_HEADERS    += 
Lib_DHCP_Server_CHECK_HEADERS    += 
Lib_base64_CHECK_HEADERS    += 
common_GCC_CHECK_HEADERS    += 
STM32F2xx_Peripheral_Drivers_CHECK_HEADERS    += 
Ring_Buffer_CHECK_HEADERS    += 
STM32F2xx_Peripheral_Libraries_CHECK_HEADERS    += 
Platform_EMW3162_INCLUDES         := 
ThreadX_INCLUDES         := 
NetX_Duo_INCLUDES         := 
WICED_INCLUDES         := -I././WICED/security/BESL/TLV -I././WICED/security/BESL/crypto -I././WICED/security/BESL/include
SPI_Flash_Library_EMW3162_INCLUDES         := 
WWD_ThreadX_Interface_INCLUDES         := 
Wiced_ThreadX_Interface_INCLUDES         := 
WWD_NetX_Duo_Interface_INCLUDES         := 
Wiced_NetX_Interface_INCLUDES         := 
Supplicant_BESL_INCLUDES         := 
Lib_HTTP_Server_INCLUDES         := 
Lib_DNS_Redirect_Daemon_INCLUDES         := 
Lib_DNS_INCLUDES         := 
WWD_for_SDIO_ThreadX_INCLUDES         := 
Lib_Wiced_RO_FS_INCLUDES         := 
STM32F2xx_INCLUDES         := 
Lib_DHCP_Server_INCLUDES         := 
Lib_base64_INCLUDES         := 
common_GCC_INCLUDES         := 
STM32F2xx_Peripheral_Drivers_INCLUDES         := 
Ring_Buffer_INCLUDES         := 
STM32F2xx_Peripheral_Libraries_INCLUDES         := 
Platform_EMW3162_DEFINES          := 
ThreadX_DEFINES          := 
NetX_Duo_DEFINES          := 
WICED_DEFINES          := 
SPI_Flash_Library_EMW3162_DEFINES          := -DSFLASH_SUPPORT_SST_PARTS -DSFLASH_SUPPORT_MACRONIX_PARTS -DSFLASH_SUPPORT_EON_PARTS
WWD_ThreadX_Interface_DEFINES          := 
Wiced_ThreadX_Interface_DEFINES          := 
WWD_NetX_Duo_Interface_DEFINES          := 
Wiced_NetX_Interface_DEFINES          := 
Supplicant_BESL_DEFINES          := 
Lib_HTTP_Server_DEFINES          := 
Lib_DNS_Redirect_Daemon_DEFINES          := 
Lib_DNS_DEFINES          := 
WWD_for_SDIO_ThreadX_DEFINES          := 
Lib_Wiced_RO_FS_DEFINES          := 
STM32F2xx_DEFINES          := 
Lib_DHCP_Server_DEFINES          := 
Lib_base64_DEFINES          := 
common_GCC_DEFINES          := 
STM32F2xx_Peripheral_Drivers_DEFINES          := 
Ring_Buffer_DEFINES          := 
STM32F2xx_Peripheral_Libraries_DEFINES          := 
Platform_EMW3162_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
ThreadX_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
NetX_Duo_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
WICED_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
SPI_Flash_Library_EMW3162_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
WWD_ThreadX_Interface_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Wiced_ThreadX_Interface_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
WWD_NetX_Duo_Interface_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Wiced_NetX_Interface_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Supplicant_BESL_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_HTTP_Server_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_DNS_Redirect_Daemon_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_DNS_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
WWD_for_SDIO_ThreadX_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_Wiced_RO_FS_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_DHCP_Server_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Werror -Wstrict-prototypes  -W -Wshadow  -Wwrite-strings -pedantic -std=c99 -Wconversion -Wextra -Wdeclaration-after-statement -Wconversion -Waddress -Wlogical-op -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wdouble-promotion -Wswitch-enum -Wswitch-default -Wuninitialized -Wunknown-pragmas -Wfloat-equal  -Wundef  -Wshadow  -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_base64_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
common_GCC_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_Peripheral_Drivers_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Ring_Buffer_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_Peripheral_Libraries_CFLAGS           :=       -mthumb -mcpu=cortex-m3    -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Platform_EMW3162_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
ThreadX_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
NetX_Duo_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
WICED_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
SPI_Flash_Library_EMW3162_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
WWD_ThreadX_Interface_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Wiced_ThreadX_Interface_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
WWD_NetX_Duo_Interface_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Wiced_NetX_Interface_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Supplicant_BESL_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_HTTP_Server_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_DNS_Redirect_Daemon_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_DNS_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
WWD_for_SDIO_ThreadX_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_Wiced_RO_FS_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_DHCP_Server_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Lib_base64_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
common_GCC_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_Peripheral_Drivers_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Ring_Buffer_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
STM32F2xx_Peripheral_Libraries_CXXFLAGS         :=       -mthumb -mcpu=cortex-m3  -mlittle-endian                -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common -fno-rtti -fno-exceptions -DNDEBUG -ggdb -O3 -DWICED_VERSION=\"3.1.0\" -DBUS=\"SDIO\" -Ibuild/EMW3162/resources/ -DPLATFORM=\"EMW3162\"
Platform_EMW3162_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
ThreadX_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
NetX_Duo_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
WICED_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
SPI_Flash_Library_EMW3162_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
WWD_ThreadX_Interface_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Wiced_ThreadX_Interface_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
WWD_NetX_Duo_Interface_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Wiced_NetX_Interface_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Supplicant_BESL_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Lib_HTTP_Server_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Lib_DNS_Redirect_Daemon_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Lib_DNS_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
WWD_for_SDIO_ThreadX_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Lib_Wiced_RO_FS_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
STM32F2xx_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Lib_DHCP_Server_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Lib_base64_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
common_GCC_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
STM32F2xx_Peripheral_Drivers_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Ring_Buffer_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
STM32F2xx_Peripheral_Libraries_ASMFLAGS         :=       -mcpu=cortex-m3 -mfpu=softvfp                  -ggdb
Platform_EMW3162_RESOURCES        := 
ThreadX_RESOURCES        := 
NetX_Duo_RESOURCES        := 
WICED_RESOURCES        := ./resources/images/brcmlogo.png ./resources/images/brcmlogo_line.png ./resources/images/favicon.ico ./resources/images/scan_icon.png ./resources/images/wps_icon.png ./resources/images/64_0bars.png ./resources/images/64_1bars.png ./resources/images/64_2bars.png ./resources/images/64_3bars.png ./resources/images/64_4bars.png ./resources/images/64_5bars.png ./resources/images/tick.png ./resources/images/cross.png ./resources/images/lock.png ./resources/images/progress.gif ./resources/scripts/general_ajax_script.js ./resources/scripts/wpad.dat ./resources/config/device_settings.html ./resources/config/scan_page_outer.html ./resources/config/redirect.html ./resources/styles/buttons.css 
SPI_Flash_Library_EMW3162_RESOURCES        := 
WWD_ThreadX_Interface_RESOURCES        := 
Wiced_ThreadX_Interface_RESOURCES        := 
WWD_NetX_Duo_Interface_RESOURCES        := 
Wiced_NetX_Interface_RESOURCES        := 
Supplicant_BESL_RESOURCES        := 
Lib_HTTP_Server_RESOURCES        := 
Lib_DNS_Redirect_Daemon_RESOURCES        := 
Lib_DNS_RESOURCES        := 
WWD_for_SDIO_ThreadX_RESOURCES        := ./resources/firmware/43362/43362A2.bin
Lib_Wiced_RO_FS_RESOURCES        := 
STM32F2xx_RESOURCES        := 
Lib_DHCP_Server_RESOURCES        := 
Lib_base64_RESOURCES        := 
common_GCC_RESOURCES        := 
STM32F2xx_Peripheral_Drivers_RESOURCES        := 
Ring_Buffer_RESOURCES        := 
STM32F2xx_Peripheral_Libraries_RESOURCES        := 
Platform_EMW3162_MAKEFILE         := ./platforms/EMW3162/EMW3162.mk
ThreadX_MAKEFILE         := ./WICED/RTOS/ThreadX/ThreadX.mk
NetX_Duo_MAKEFILE         := ./WICED/network/NetX_Duo/NetX_Duo.mk
WICED_MAKEFILE         := ././WICED/WICED.mk
SPI_Flash_Library_EMW3162_MAKEFILE         := ./libraries/drivers/spi_flash/spi_flash.mk
WWD_ThreadX_Interface_MAKEFILE         := ././WICED/RTOS/ThreadX/WWD/WWD.mk
Wiced_ThreadX_Interface_MAKEFILE         := ././WICED/RTOS/ThreadX/WICED/WICED.mk
WWD_NetX_Duo_Interface_MAKEFILE         := ././WICED/network/NetX_Duo/WWD/WWD.mk
Wiced_NetX_Interface_MAKEFILE         := ././WICED/network/NetX_Duo/WICED/WICED.mk
Supplicant_BESL_MAKEFILE         := ././WICED/security/BESL/BESL.mk
Lib_HTTP_Server_MAKEFILE         := ./libraries/daemons/HTTP_server/HTTP_server.mk
Lib_DNS_Redirect_Daemon_MAKEFILE         := ./libraries/daemons/DNS_redirect/DNS_redirect.mk
Lib_DNS_MAKEFILE         := ./libraries/protocols/DNS/DNS.mk
WWD_for_SDIO_ThreadX_MAKEFILE         := ././WICED/WWD/WWD.mk
Lib_Wiced_RO_FS_MAKEFILE         := ./libraries/filesystems/wicedfs/wicedfs.mk
STM32F2xx_MAKEFILE         := ././WICED/platform/MCU/STM32F2xx/STM32F2xx.mk
Lib_DHCP_Server_MAKEFILE         := ./libraries/daemons/DHCP_server/DHCP_server.mk
Lib_base64_MAKEFILE         := ./libraries/utilities/base64/base64.mk
common_GCC_MAKEFILE         := ./WICED/platform/GCC/GCC.mk
STM32F2xx_Peripheral_Drivers_MAKEFILE         := ./WICED/platform/MCU/STM32F2xx/peripherals/peripherals.mk
Ring_Buffer_MAKEFILE         := ./libraries/utilities/ring_buffer/ring_buffer.mk
STM32F2xx_Peripheral_Libraries_MAKEFILE         := ./WICED/platform/MCU/STM32F2xx/peripherals/libraries/libraries.mk
Platform_EMW3162_PREBUILT_LIBRARY := 
ThreadX_PREBUILT_LIBRARY := ./WICED/RTOS/ThreadX/ThreadX.ARM_CM3.release.a
NetX_Duo_PREBUILT_LIBRARY := ./WICED/network/NetX_Duo/NetX_Duo.ARM_CM3.release.a
WICED_PREBUILT_LIBRARY := 
SPI_Flash_Library_EMW3162_PREBUILT_LIBRARY := 
WWD_ThreadX_Interface_PREBUILT_LIBRARY := 
Wiced_ThreadX_Interface_PREBUILT_LIBRARY := 
WWD_NetX_Duo_Interface_PREBUILT_LIBRARY := 
Wiced_NetX_Interface_PREBUILT_LIBRARY := 
Supplicant_BESL_PREBUILT_LIBRARY := ././WICED/security/BESL/BESL.ARM_CM3.release.a
Lib_HTTP_Server_PREBUILT_LIBRARY := 
Lib_DNS_Redirect_Daemon_PREBUILT_LIBRARY := 
Lib_DNS_PREBUILT_LIBRARY := 
WWD_for_SDIO_ThreadX_PREBUILT_LIBRARY := 
Lib_Wiced_RO_FS_PREBUILT_LIBRARY := 
STM32F2xx_PREBUILT_LIBRARY := 
Lib_DHCP_Server_PREBUILT_LIBRARY := 
Lib_base64_PREBUILT_LIBRARY := 
common_GCC_PREBUILT_LIBRARY := 
STM32F2xx_Peripheral_Drivers_PREBUILT_LIBRARY := 
Ring_Buffer_PREBUILT_LIBRARY := 
STM32F2xx_Peripheral_Libraries_PREBUILT_LIBRARY := 
WICED_SDK_UNIT_TEST_SOURCES   :=                              ./libraries/filesystems/wicedfs/unit/wicedfs_unit_images.c ./libraries/filesystems/wicedfs/unit/wicedfs_unit.cpp              
APP_WWD_ONLY              := 
USES_BOOTLOADER_OTA       := 1
NODCT                     := 
ALL_RESOURCES             :=                       ./resources/config/device_settings.html ./resources/config/redirect.html ./resources/config/scan_page_outer.html ./resources/firmware/43362/43362A2.bin ./resources/images/64_0bars.png ./resources/images/64_1bars.png ./resources/images/64_2bars.png ./resources/images/64_3bars.png ./resources/images/64_4bars.png ./resources/images/64_5bars.png ./resources/images/brcmlogo.png ./resources/images/brcmlogo_line.png ./resources/images/cross.png ./resources/images/favicon.ico ./resources/images/lock.png ./resources/images/progress.gif ./resources/images/scan_icon.png ./resources/images/tick.png ./resources/images/wps_icon.png ./resources/scripts/general_ajax_script.js ./resources/scripts/wpad.dat ./resources/styles/buttons.css
INTERNAL_MEMORY_RESOURCES :=                       ./resources/config/device_settings.html ./resources/config/redirect.html ./resources/config/scan_page_outer.html ./resources/firmware/43362/43362A2.bin ./resources/images/64_0bars.png ./resources/images/64_1bars.png ./resources/images/64_2bars.png ./resources/images/64_3bars.png ./resources/images/64_4bars.png ./resources/images/64_5bars.png ./resources/images/brcmlogo.png ./resources/images/brcmlogo_line.png ./resources/images/cross.png ./resources/images/favicon.ico ./resources/images/lock.png ./resources/images/progress.gif ./resources/images/scan_icon.png ./resources/images/tick.png ./resources/images/wps_icon.png ./resources/scripts/general_ajax_script.js ./resources/scripts/wpad.dat ./resources/styles/buttons.css
PLATFORM_TARGETS_MAKEFILE := ./tools/makefiles//standard_platform_targets.mk
