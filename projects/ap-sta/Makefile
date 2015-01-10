
BINARY = bin/out.elf
BINARY_FINAL = bin/out.bin
BINARY_STRIPPED = bin/out.stripped.elf

SRCS=apsta.c
BUILDDIR=build
BSP=./bsp

ARM=$(BSP)/arm/bin/Linux64/
CC=$(ARM)arm-none-eabi-gcc
STRIP=$(ARM)arm-none-eabi-strip	
OBJCOPY=$(ARM)arm-none-eabi-objcopy



INCLUDES=-I$(BSP)/include -I$(BSP)/include/periph  -I$(BSP)/include/WWD -I$(BSP)/include/WWD/network -I$(BSP)/include/platform -I$(BSP)/include/libraries -I$(BSP)/include/WWD/internal  -I$(BSP)/include/WWD/internal/chips -I$(BSP)/include/RTOS/FreeRTOS -I$(BSP)/include/platform/ARM_CM3 -I$(BSP)/include/RTOS/FreeRTOS/ARM_CM3 -I$(BSP)/include/MXCHIP3162 -I$(BSP)/include/network/lwip -I$(BSP)/include/network/lwip/ipv4 -I$(BSP)/include/security/BESL/include

DEFINES=-DPLATFORM=\"MXCHIP3162\"
CCFLAGS=$(DEFINES) -isystem $(ARM)/../../include -isystem $(ARM)/../../lib/include -isystem $(ARM)/../../lib/include-fixed -c  -MD -mthumb -mcpu=cortex-m3    -mlittle-endian   -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common $(INCLUDES) -DNDEBUG -ggdb -O3 
LIBRARYLIST=./bsp/link.opts

LDFLAGS=-L$(BSP)/ld/  -T$(BSP)/ld/app_with_bootloader.ld
CCLINKFLAGS=-Wl,--gc-sections -Wl,-O3 -mthumb -mcpu=cortex-m3 -Wl,-A,thumb -mlittle-endian -nostartfiles -Wl,--defsym,__STACKSIZE__=800 $(LDFLAGS) -Wl,--start-group  bsp/lib/*.o bsp/lib/*.a 


OBJECTS := $(addprefix $(BUILDDIR)/,$(SRCS:%.c=%.o))

all: $(BINARY_FINAL)

clean:
	rm -rf ./bin
	rm -rf ./build
	
$(BINARY_FINAL): $(BINARY_STRIPPED)
	$(OBJCOPY) -O binary -R .eh_frame -R .init -R .fini -R .comment -R .ARM.attributes $< $@


$(BINARY_STRIPPED): $(BINARY)
	$(STRIP) -o $@ $(STRIPFLAGS) $<

$(BINARY): $(OBJECTS)
	@mkdir -p bin
	$(CC) $(CCLINKFLAGS)  $(OBJECTS) -Wl,--end-group  -o $(BINARY) 
	cp $(BSP)/bin/waf_bootloader-NoOS-NoNS-EMW3162-SDIO.stripped.elf ./bin/bootloader.stripped.elf
	cp $(BSP)/bin/waf_bootloader-NoOS-NoNS-EMW3162-SDIO.elf ./bin/bootloader.elf
	cp $(BSP)/bin/waf_bootloader-NoOS-NoNS-EMW3162-SDIO.bin ./bin/bootloader.bin
	cp $(BSP)/bin/DCT.stripped.elf ./bin/DCT.stripped.elf
	cp $(BSP)/bin/DCT.elf ./bin/DCT.elf
	cp $(BSP)/bin/DCT.bin ./bin/DCT.bin
	
$(BUILDDIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CCFLAGS)  -o $@ $<

download:
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/bootloader.stripped.elf"  -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/DCT.stripped.elf" -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/out.stripped.elf" -c shutdown


download_bin:
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/bootloader.bin 0x8000000"  -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/DCT.bin 0x8004000" -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/out.bin 0x8008000" -c shutdown
