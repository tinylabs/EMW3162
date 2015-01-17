
BINARY = bin/out.elf
BINARY_FINAL = bin/out.bin
BINARY_STRIPPED = bin/out.stripped.elf

SRCS=apsta.c audioboard.c
BUILDDIR=build
BSP=./bsp

ARM=$(BSP)/arm/bin/Linux64/
CC=$(ARM)arm-none-eabi-gcc
AR=$(ARM)arm-none-eabi-ar
STRIP=$(ARM)arm-none-eabi-strip	
OBJCOPY=$(ARM)arm-none-eabi-objcopy

INCLUDES=-I$(BSP)/include -I$(BSP)/include/periph  -I$(BSP)/include/WWD -I$(BSP)/include/WWD/network -I$(BSP)/include/platform -I$(BSP)/include/libraries -I$(BSP)/include/WWD/internal  -I$(BSP)/include/WWD/internal/chips -I$(BSP)/include/RTOS/FreeRTOS -I$(BSP)/include/platform/ARM_CM3 -I$(BSP)/include/RTOS/FreeRTOS/ARM_CM3 -I$(BSP)/include/MXCHIP3162 -I$(BSP)/include/network/lwip -I$(BSP)/include/network/lwip/ipv4 -I$(BSP)/include/security/BESL/include

DEFINES=-DPLATFORM=\"MXCHIP3162\"
CCFLAGS=$(DEFINES) -isystem $(ARM)/../../include -isystem $(ARM)/../../lib/include -isystem $(ARM)/../../lib/include-fixed -c  -MD -mthumb -mcpu=cortex-m3    -mlittle-endian   -Wall -fsigned-char -ffunction-sections -fdata-sections -fno-common $(INCLUDES) -DNDEBUG -ggdb -O3 
LIBRARYLIST=./bsp/link.opts

LDFLAGS=-L$(BSP)/ld/  -T$(BSP)/ld/app_with_bootloader.ld
CCLINKFLAGS=-Wl,--gc-sections -Wl,-O3 -mthumb -mcpu=cortex-m3 -Wl,-A,thumb -mlittle-endian -nostartfiles -Wl,--defsym,__STACKSIZE__=800 $(LDFLAGS) -Wl,--start-group  bsp/lib/*.o bsp/lib/*.a 

HTMLS=index.html 
PNGS=test.png
OBJECTS := $(addprefix $(BUILDDIR)/,$(SRCS:%.c=%.o))
RESOURCES := $(addprefix $(BUILDDIR)/resources/,$(HTMLS:%.html=%.html.o))
RESOURCES += $(addprefix $(BUILDDIR)/resources/,$(PNGS:%.png=%.png.o))
RESOURCES_HTML_C := $(addprefix $(BUILDDIR)/resources/,$(HTMLS:%.html=%.html.c))
RESOURCES_PNG_C += $(addprefix $(BUILDDIR)/resources/,$(PNGS:%.png=%.png.c))
RESOURCE_A :=bsp/lib/resources.a ### DO NOT RENAME THIS, OVERWRITES THE RESOURCES NEEDED FOR BOOTLOADER
RESOURCE_H :=bsp/include/resources.h ### DO NOT RENAME THIS, OVERWRITES THE RESOURCES NEEDED FOR BOOTLOADER

all: $(BINARY_FINAL)

clean:
	rm -rf ./bin
	rm -rf ./build
	
$(BINARY_FINAL): $(BINARY_STRIPPED)
	$(OBJCOPY) -O binary -R .eh_frame -R .init -R .fini -R .comment -R .ARM.attributes $< $@


$(BINARY_STRIPPED): $(BINARY)
	$(STRIP) -o $@ $(STRIPFLAGS) $<

$(BINARY): $(RESOURCE_H) $(OBJECTS) 
	@mkdir -p bin
	$(CC) $(CCLINKFLAGS)  $(OBJECTS) -Wl,--end-group  -o $(BINARY) 
	cp $(BSP)/bin/waf_bootloader-NoOS-NoNS-EMW3162-SDIO.stripped.elf ./bin/bootloader.stripped.elf
	cp $(BSP)/bin/waf_bootloader-NoOS-NoNS-EMW3162-SDIO.elf ./bin/bootloader.elf
	cp $(BSP)/bin/waf_bootloader-NoOS-NoNS-EMW3162-SDIO.bin ./bin/bootloader.bin
	cp $(BSP)/bin/DCT.stripped.elf ./bin/DCT.stripped.elf
	cp $(BSP)/bin/DCT.elf ./bin/DCT.elf
	cp $(BSP)/bin/DCT.bin ./bin/DCT.bin


####### Normal .c build #########
$(BUILDDIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CCFLAGS)  -o $@ $<

create_name = $(subst /,_, $(subst .,_,$(1)))

####### libresource.a build #########
$(RESOURCE_H): $(RESOURCE_A)
	@mkdir -p $(@D)
	rm $@
	perl $(BSP)/tools/text_to_c/resources_header.pl $(RESOURCES_HTML_C) $(RESOURCES_PNG_C) >> $@

$(RESOURCE_A): $(RESOURCES)
	$(AR) -rcs $@ $(RESOURCES)

$(BUILDDIR)/resources/%.png.c: %.png
	@mkdir -p $(@D)
	 perl $(BSP)/tools/text_to_c/bin_to_resource_c.pl MEM $(call create_name, $@) $< > $@
	
$(BUILDDIR)/resources/%.png.o: $(RESOURCES_PNG_C)
	$(CC) $(CCFLAGS) -o $@ $<
	
	
$(BUILDDIR)/resources/%.html.c: %.html
	@mkdir -p $(@D)
	 perl $(BSP)/tools/text_to_c/text_to_resource_c.pl MEM $(call create_name, $@) $< > $@

$(BUILDDIR)/resources/%.html.o: $(RESOURCES_HTML_C)
	$(CC) $(CCFLAGS) -o $@ $<
	


download: $(BINARY_FINAL)
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/bootloader.stripped.elf"  -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/DCT.stripped.elf" -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/out.stripped.elf" -c shutdown


download_bin: $(BINARY_FINAL)
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/bootloader.bin 0x8000000"  -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/DCT.bin 0x8004000" -c shutdown
	sleep 1
	sudo openocd -f ./bus.cfg -c "init" -c "halt" -c "flash write_image erase ./bin/out.bin 0x8008000" -c shutdown
