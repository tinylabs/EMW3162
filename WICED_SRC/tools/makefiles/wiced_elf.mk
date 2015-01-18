#
# Copyright 2014, Broadcom Corporation
# All Rights Reserved.
#
# This is UNPUBLISHED PROPRIETARY SOURCE CODE of Broadcom Corporation;
# the contents of this file may not be disclosed to third parties, copied
# or duplicated in any form, in whole or in part, without the prior
# written permission of Broadcom Corporation.
#

include $(MAKEFILES_PATH)/wiced_toolchain_common.mk

CONFIG_FILE := build/$(CLEANED_BUILD_STRING)/config.mk

include $(CONFIG_FILE)

# Include all toolchain makefiles - one of them will handle the architecture
include $(MAKEFILES_PATH)/wiced_toolchain_ARM_GNU.mk


.PHONY: display_map_summary build_done

##################################
# Filenames
##################################

LINK_OUTPUT_FILE          := $(OUTPUT_DIR)/binary/$(CLEANED_BUILD_STRING)$(LINK_OUTPUT_SUFFIX)
STRIPPED_LINK_OUTPUT_FILE :=$(LINK_OUTPUT_FILE:$(LINK_OUTPUT_SUFFIX)=.stripped$(LINK_OUTPUT_SUFFIX))
FINAL_OUTPUT_FILE         :=$(LINK_OUTPUT_FILE:$(LINK_OUTPUT_SUFFIX)=$(FINAL_OUTPUT_SUFFIX))
MAP_OUTPUT_FILE           :=$(LINK_OUTPUT_FILE:$(LINK_OUTPUT_SUFFIX)=.map)
MAP_CSV_OUTPUT_FILE       :=$(LINK_OUTPUT_FILE:$(LINK_OUTPUT_SUFFIX)=_map.csv)

LINK_DCT_FILE             := $(OUTPUT_DIR)/DCT$(LINK_OUTPUT_SUFFIX)
STRIPPED_LINK_DCT_FILE    :=$(LINK_DCT_FILE:$(LINK_OUTPUT_SUFFIX)=.stripped$(LINK_OUTPUT_SUFFIX))
FINAL_DCT_FILE            :=$(LINK_DCT_FILE:$(LINK_OUTPUT_SUFFIX)=$(FINAL_OUTPUT_SUFFIX))
MAP_DCT_FILE              :=$(LINK_DCT_FILE:$(LINK_OUTPUT_SUFFIX)=.map)

OPENOCD_LOG_FILE          ?= $(OUTPUT_DIR)/openocd_log.txt

LIBS_DIR                  := $(OUTPUT_DIR)/libraries
LINK_OPTS_FILE            := $(OUTPUT_DIR)/binary/link.opts
LINK_OPTS_LIB_FILE            := $(OUTPUT_DIR)/binary/link_lib.opts
LINK_OPTS_OBJ_FILE            := $(OUTPUT_DIR)/binary/link_obj.opts

LINT_OPTS_FILE            := $(OUTPUT_DIR)/binary/lint.opts


ifeq (,$(SUB_BUILD))
ifneq (,$(PLATFORM_TARGETS_MAKEFILE))
include $(PLATFORM_TARGETS_MAKEFILE)
endif
endif


include $(MAKEFILES_PATH)/wiced_resources.mk

##################################
# Macros
##################################

###############################################################################
# MACRO: GET_BARE_LOCATION
# Returns a the location of the given component relative to source-tree-root
# rather than from the cwd
# $(1) is component
GET_BARE_LOCATION =$(patsubst $(call ESCAPE_BACKSLASHES,$(SOURCE_ROOT))%,%,$(strip $($(call CONV_COMP,$(1))_LOCATION)))


###############################################################################
# MACRO: BUILD_C_RULE
# Creates a target for building C language files (*.c)
# $(1) is component, $(2) is the source file
define BUILD_C_RULE
-include $(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(2:.c=.d)
$(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(2:.c=.o): $(strip $($(1)_LOCATION))$(2) $(CONFIG_FILE) $$(dir $(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(2)).d $(RESOURCES_DEPENDENCY) $(LIBS_DIR)/$(1).c_opts | $(PLATFORM_PRE_BUILD_TARGETS)
	$$(if $($(1)_START_PRINT),,$(eval $(1)_START_PRINT:=1) $(QUIET)$(ECHO) Compiling $(1) )
	$(QUIET)$(CC) $(OPTIONS_IN_FILE_OPTION)$(LIBS_DIR)/$(1).c_opts -o $$@ $$< $(COMPILER_SPECIFIC_STDOUT_REDIRECT)
endef

###############################################################################
# MACRO: CHECK_HEADER_RULE
# Compiles a C language header file to ensure it is stand alone complete
# $(1) is component, $(2) is the source header file
define CHECK_HEADER_RULE
$(eval $(1)_CHECK_HEADER_LIST+=$(OUTPUT_DIR)/Modules/$(strip $($(1)_LOCATION))$(2:.h=.chk) )
.PHONY: $(OUTPUT_DIR)/Modules/$(strip $($(1)_LOCATION))$(2:.h=.chk)
$(OUTPUT_DIR)/Modules/$(strip $($(1)_LOCATION))$(2:.h=.chk): $(strip $($(1)_LOCATION))$(2) $(CONFIG_FILE) $$(dir $(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(2)).d
	$(QUIET)$(ECHO) Checking header  $(2)
	$(QUIET)$(CC) -c $(WICED_SDK_CFLAGS) $(filter-out -pedantic -Werror, $($(1)_CFLAGS) $(C_BUILD_OPTIONS) ) $($(1)_INCLUDES) $($(1)_DEFINES) $(WICED_SDK_INCLUDES) $(WICED_SDK_DEFINES) -o $$@ $$<
endef

###############################################################################
# MACRO: BUILD_CPP_RULE
# Creates a target for building C++ language files (*.cpp)
# $(1) is component name, $(2) is the source file
define BUILD_CPP_RULE
-include $(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(patsubst %.cc,%.d,$(2:.cpp=.d))
$(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(patsubst %.cc,%.o,$(2:.cpp=.o)): $(strip $($(1)_LOCATION))$(2) $(CONFIG_FILE) $$(dir $(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(2)).d $(RESOURCES_DEPENDENCY) $(LIBS_DIR)/$(1).cpp_opts | $(PLATFORM_PRE_BUILD_TARGETS)
	$$(if $($(1)_START_PRINT),,$(eval $(1)_START_PRINT:=1) $(ECHO) Compiling $(1))
	$(QUIET)$(CXX) $(OPTIONS_IN_FILE_OPTION)$(LIBS_DIR)/$(1).cpp_opts -o $$@ $$<  $(COMPILER_SPECIFIC_STDOUT_REDIRECT)
endef

###############################################################################
# MACRO: BUILD_S_RULE
# Creates a target for building Assembly language files (*.s & *.S)
# $(1) is component name, $(2) is the source file
define BUILD_S_RULE
$(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(strip $(patsubst %.S,%.o, $(2:.s=.o) )): $(strip $($(1)_LOCATION))$(2) $(CONFIG_FILE) $$(dir $(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))$(strip $(patsubst %.S, %.o, $(2)))).d $(RESOURCES_DEPENDENCY) | $(PLATFORM_PRE_BUILD_TARGETS)
	$$(if $($(1)_START_PRINT),,$(eval $(1)_START_PRINT:=1) $(ECHO) Compiling $(1))

	$(QUIET)$(AS) $($(1)_ASMFLAGS)  -o $$@ $$< $(WICED_SDK_INCLUDES) $(ASM_COMPILER_FLAGS) $(COMPILER_SPECIFIC_STDOUT_REDIRECT)
endef

###############################################################################
# MACRO: BUILD_COMPONENT_RULES
# Creates targets for building an entire component
# Target for the component static library is created in this macro
# Targets for source files are created by calling the macros defined above
# $(1) is component name
define BUILD_COMPONENT_RULES

$(eval LINK_LIBS +=$(if $($(1)_SOURCES),$(LIBS_DIR)/$(1).a))

# Make a list of the object files that will be used to build the static library
$(eval $(1)_LIB_OBJS := $(addprefix $(strip $(OUTPUT_DIR)/Modules/$(call GET_BARE_LOCATION,$(1))),  $(filter %.o, $($(1)_SOURCES:.cc=.o) $($(1)_SOURCES:.cpp=.o) $($(1)_SOURCES:.c=.o) $($(1)_SOURCES:.s=.o) $($(1)_SOURCES:.S=.o)))  $(patsubst %.c,%.o,$(call RESOURCE_FILENAME, $($(1)_RESOURCES))))

$(LIBS_DIR)/$(1).c_opts: $(CONFIG_FILE) | $(LIBS_DIR)
	$(QUIET)$$(call WRITE_FILE_CREATE, $$@, $(subst $(COMMA),$$(COMMA), $(COMPILER_SPECIFIC_COMP_ONLY_FLAG) $(COMPILER_SPECIFIC_DEPS_FLAG) $($(1)_CFLAGS) $($(1)_INCLUDES) $($(1)_DEFINES) $(WICED_SDK_INCLUDES) $(WICED_SDK_DEFINES)))

$(LIBS_DIR)/$(1).cpp_opts: $(CONFIG_FILE) | $(LIBS_DIR)
	 $(QUIET)$$(call WRITE_FILE_CREATE, $$@ ,$(COMPILER_SPECIFIC_COMP_ONLY_FLAG) $(COMPILER_SPECIFIC_DEPS_FLAG) $($(1)_CXXFLAGS)  $($(1)_INCLUDES) $($(1)_DEFINES) $(WICED_SDK_INCLUDES) $(WICED_SDK_DEFINES))

#$(LIBS_DIR)/$(1).as_opts: $(CONFIG_FILE) | $(LIBS_DIR)
#	$(QUIET)$$(call WRITE_FILE_CREATE, $$@ ,$($(1)_ASMFLAGS))

$(LIBS_DIR)/$(1).ar_opts: $(CONFIG_FILE) | $(LIBS_DIR)
	$(QUIET)$$(call WRITE_FILE_CREATE, $$@ ,$($(1)_LIB_OBJS))

# Allow checking of completeness of headers
$(foreach src, $(if $(findstring 1,$(CHECK_HEADERS)), $(filter %.h, $($(1)_CHECK_HEADERS)), ),$(eval $(call CHECK_HEADER_RULE,$(1),$(src))))

# Target for build-from-source
$(OUTPUT_DIR)/libraries/$(1).a: $$($(1)_LIB_OBJS) $($(1)_CHECK_HEADER_LIST) $(OUTPUT_DIR)/libraries/$(1).ar_opts
	$(QUIET)$(AR) $(WICED_SDK_ARFLAGS) $(COMPILER_SPECIFIC_ARFLAGS_CREATE) $$@ $(OPTIONS_IN_FILE_OPTION)$(OUTPUT_DIR)/libraries/$(1).ar_opts

# Create targets to built the component's source files into object files
$(foreach src, $(filter %.c, $($(1)_SOURCES)),$(eval $(call BUILD_C_RULE,$(1),$(src))))
$(foreach src, $(filter %.cpp, $($(1)_SOURCES)) $(filter %.cc, $($(1)_SOURCES)),$(eval $(call BUILD_CPP_RULE,$(1),$(src))))
$(foreach src, $(filter %.s %.S, $($(1)_SOURCES)),$(eval $(call BUILD_S_RULE,$(1),$(src))))


$(eval $(1)_LINT_FLAGS +=  $(filter -D% -I%, $($(1)_CFLAGS) $($(1)_INCLUDES) $($(1)_DEFINES) $(WICED_SDK_INCLUDES) $(WICED_SDK_DEFINES) ) )
$(eval LINT_FLAGS +=  $($(1)_LINT_FLAGS) )
$(eval LINT_FILES +=  $(addprefix $(strip $($(1)_LOCATION)), $(filter %.c, $($(1)_SOURCES))) )
endef

##################################
# Processing
##################################

# Create targets for resource files
# Create targets for resource files

ALL_RESOURCES  := \
                      ./resources/images/brcmlogo.png \
                      ./resources/images/brcmlogo_line.png \
                      ./resources/images/favicon.ico \
                      ./resources/images/wps_icon.png \
                      ./resources/images/64_0bars.png \
                      ./resources/images/64_1bars.png \
                      ./resources/images/64_2bars.png \
                      ./resources/images/64_3bars.png \
                      ./resources/images/64_4bars.png \
                      ./resources/images/64_5bars.png \
                      ./resources/images/tick.png \
                      ./resources/images/cross.png \
                      ./resources/images/lock.png \
                      ./resources/images/progress.gif \
                      ./resources/scripts/general_ajax_script.js \
                      ./resources/scripts/wpad.dat \
                      ./resources/config/device_settings.html \
                      ./resources/config/scan_page_outer.html \
                      ./resources/config/redirect.html \
                      ./resources/styles/buttons.css \
                      ./resources/firmware/43362/43362A2.bin \
                      ./resources/images/scan_icon.png 



$(eval $(if $(ALL_RESOURCES),$(call CREATE_ALL_RESOURCE_TARGETS,$(ALL_RESOURCES))))
LINK_LIBS += $(RESOURCES_LIBRARY)

# Create targets for components
$(foreach comp,$(COMPONENTS),$(eval $(call BUILD_COMPONENT_RULES,$(comp))))

LINK_LIBS += $(WICED_SDK_PREBUILT_LIBRARIES)
##################################
# Build rules
##################################

QUIET=


$(LIBS_DIR):
	$(QUIET)$(call MKDIR, $@)

# Directory dependency - causes mkdir to be called once for each directory.
%/.d:
	$(QUIET)$(call MKDIR, $(dir $@))
	$(QUIET)$(TOUCH) $(@)

# Bin file target - uses objcopy to convert the stripped elf into a binary file
$(FINAL_OUTPUT_FILE): $(STRIPPED_LINK_OUTPUT_FILE)
ifeq (waf_bootloader,$(findstring waf_bootloader,$(FINAL_OUTPUT_FILE)))
	$(QUIET)$(ECHO) Making $(FINAL_OUTPUT_FILE)
	$(QUIET)$(OBJCOPY) -O binary -R .eh_frame -R .init -R .fini -R .comment -R .ARM.attributes $< $@
	-$(CP) $@ ../WICED_BIN/bin/$(nodir $@)
else
# NORMALLY HERE IS ALSO THE MAIN BIN OUTPUT, but we only want the libraries
endif

# Stripped elf file target - Strips the full elf file and outputs to a new .stripped.elf file
$(STRIPPED_LINK_OUTPUT_FILE): $(LINK_OUTPUT_FILE)
ifeq (waf_bootloader,$(findstring waf_bootloader,$(STRIPPED_LINK_OUTPUT_FILE)))
	$(QUIET)$(ECHO) Making $(notdir $@)
	$(QUIET)$(STRIP) -o $@ $(STRIPFLAGS) $<
	-$(CP) $@ ../WICED_BIN/bin/$(nodir $@)
else
# NORMALLY HERE IS ALSO THE MAIN BIN OUTPUT, but we only want the libraries
endif

$(LINK_OPTS_LIB_FILE):
#$(COMPILER_SPECIFIC_LINK_MAP) $(MAP_OUTPUT_FILE) $(LINK_OPTS_FILE)
	$(call WRITE_FILE_CREATE, $@ , $(LINK_LIBS) )
	

$(LINK_OPTS_OBJ_FILE):
#$(COMPILER_SPECIFIC_LINK_MAP) $(MAP_OUTPUT_FILE) $(LINK_OPTS_FILE)
	$(call WRITE_FILE_CREATE, $@ ,  $(WICED_SDK_LINK_FILES) ) )
ifneq (waf_bootloader,$(findstring waf_bootloader,$(CLEANED_BUILD_STRING)))	
	$(QUIET)$(call WRITE_FILE_CREATE, ../WICED_BIN/link.opts ,$(WICED_SDK_LDFLAGS) $(call COMPILER_SPECIFIC_LINK_FILES) $(addprefix bsp/lib/, $(notdir $(WICED_SDK_LINK_FILES))) $(filter %.a,$^) $(addprefix bsp/lib/, $(notdir $(LINK_LIBS))) )
endif

$(LINK_OPTS_FILE):
#$(COMPILER_SPECIFIC_LINK_MAP) $(MAP_OUTPUT_FILE) $(LINK_OPTS_FILE)
	$(QUIET)$(call WRITE_FILE_CREATE, $@ ,$(WICED_SDK_LDFLAGS) $(WICED_SDK_LINK_SCRIPT_CMD) $(call COMPILER_SPECIFIC_LINK_MAP,$(MAP_OUTPUT_FILE))  $(call COMPILER_SPECIFIC_LINK_FILES, $(WICED_SDK_LINK_FILES) $(filter %.a,$^) $(LINK_LIBS)) )

$(LINT_OPTS_FILE): $(LINK_LIBS)
	$(QUIET)$(call WRITE_FILE_CREATE, $@ , )
	$(QUIET)$(foreach opt,$(sort $(subst \",",$(LINT_FLAGS))) $(sort $(LINT_FILES)),$(call WRITE_FILE_APPEND, $@ ,$(opt)))

runlint: $(LINT_OPTS_FILE)
	$(LINT_EXE) -f $(TOOLS_ROOT)/splint/opts.txt -f $(LINT_OPTS_FILE)

ifneq ($(origin LINT),default)
ifeq ($(LINT),1)
LINT_DEPENDENCY := runlint
endif
endif


# Linker output target - This links all component & resource libraries and objects into an output executable
# CXX is used for compatibility with C++
$(LINK_OUTPUT_FILE): $(LINK_LIBS) $(WICED_SDK_LINK_SCRIPT) $(LINK_OPTS_FILE) $(LINK_OPTS_LIB_FILE) $(LINK_OPTS_OBJ_FILE) $(LINT_DEPENDENCY)
	
ifneq (waf_bootloader,$(findstring waf_bootloader,$(CLEANED_BUILD_STRING)))
	$(ECHO) Exporting libraries to create $(notdir $@)
	$(foreach var,$(LINK_LIBS), $(CP) $(var) ../WICED_BIN/lib/$(notdir $(var));)
	$(foreach var,$(WICED_SDK_LINK_FILES), $(CP) $(var) ../WICED_BIN/lib/$(notdir $(var));)
	-/bin/ln -sf ../WICED_SRC/include ../WICED_BIN/include
	-/bin/ln -sf ../WICED_SRC//WICED/security ../WICED_BIN/include_security
	-/bin/ln -sf ../WICED_SRC/tools/ARM_GNU ../WICED_BIN/arm
	-/bin/ln -sf ../WICED_SRC/tools/ ../WICED_BIN/tools
	$(CP) -r ./WICED/platform/MCU/STM32F2xx/GCC/* ../WICED_BIN/ld/
	$(CP) -r ./WICED/platform/MCU/STM32F2xx/GCC/STM32F2x5/* ../WICED_BIN/ld
	$(CP) -r ./WICED/platform/MCU/STM32F2xx/GCC/STM32F2x5/* ../WICED_BIN/ld
else
	$(ECHO) Making $(notdir $@)
	$(QUIET)$(LINKER) -o  $@ $(OPTIONS_IN_FILE_OPTION)$(LINK_OPTS_FILE) $(COMPILER_SPECIFIC_STDOUT_REDIRECT)
	$(call COMPILER_SPECIFIC_MAPFILE_TO_CSV,$(MAP_OUTPUT_FILE),$(MAP_CSV_OUTPUT_FILE))
	-$(CP) $@ ../WICED_BIN/bin/$(nodir $@)
endif

display_map_summary: $(LINK_OUTPUT_FILE)
#	$(QUIET) $(call COMPILER_SPECIFIC_MAPFILE_DISPLAY_SUMMARY,$(MAP_OUTPUT_FILE))


# Device Config Table (DCT) binary file target - compiles, links, strips, and objdumps DCT source into a binary output file
$(LINK_DCT_FILE): $(OUTPUT_DIR)/generated_security_dct.h $(WICED_SDK_DCT_LINK_SCRIPT) $(SOURCE_ROOT)WICED/internal/dct.c $(WICED_SDK_APPLICATION_DCT) $(WICED_SDK_WIFI_CONFIG_DCT_H) $(CONFIG_FILE) | $(PLATFORM_PRE_BUILD_TARGETS)
	$(QUIET)$(ECHO) Making DCT image
	$(QUIET)$(CC) $(CPU_CFLAGS) $(COMPILER_SPECIFIC_COMP_ONLY_FLAG)  $(SOURCE_ROOT)WICED/internal/dct.c $(WICED_SDK_DEFINES) $(WICED_SDK_INCLUDES) $(COMPILER_SPECIFIC_DEBUG_CFLAGS)  $(call ADD_COMPILER_SPECIFIC_STANDARD_CFLAGS, ) -I$(OUTPUT_DIR) -I$(SOURCE_ROOT). -o $(OUTPUT_DIR)/internal_dct.o $(COMPILER_SPECIFIC_STDOUT_REDIRECT)
	$(if $(WICED_SDK_APPLICATION_DCT),$(QUIET)$(CC) $(CPU_CFLAGS) $(COMPILER_SPECIFIC_COMP_ONLY_FLAG)  $(WICED_SDK_APPLICATION_DCT) $(WICED_SDK_DEFINES) $(WICED_SDK_INCLUDES) $(COMPILER_SPECIFIC_DEBUG_CFLAGS)  $(call ADD_COMPILER_SPECIFIC_STANDARD_CFLAGS, ) -I$(OUTPUT_DIR) -I$(SOURCE_ROOT). -o $(OUTPUT_DIR)/app_dct.o)
	$(QUIET)$(LINKER) $(WICED_SDK_LDFLAGS) $(WICED_SDK_DCT_LINK_CMD) $(call COMPILER_SPECIFIC_LINK_MAP,$(MAP_DCT_FILE)) -o $@  $(OUTPUT_DIR)/internal_dct.o $(if $(WICED_SDK_APPLICATION_DCT),$(OUTPUT_DIR)/app_dct.o)  $(COMPILER_SPECIFIC_STDOUT_REDIRECT)
	

$(STRIPPED_LINK_DCT_FILE): $(LINK_DCT_FILE)
	$(QUIET)$(STRIP) -o $@ $(STRIPFLAGS) $<

$(FINAL_DCT_FILE): $(STRIPPED_LINK_DCT_FILE)
	$(QUIET)$(OBJCOPY) -O binary -R .eh_frame -R .init -R .fini -R .comment -R .ARM.attributes $< $@

# Certificates header target - Converts and concatenates text certificate files into a header file
$(OUTPUT_DIR)/generated_security_dct.h: $(WICED_SDK_CERTIFICATE) $(WICED_SDK_PRIVATE_KEY) | $(PLATFORM_PRE_BUILD_TARGETS)
	$(QUIET)$(ECHO) Creating security credentials
	$(QUIET)$(PERL) $(TOOLS_ROOT)/text_to_c/certs_to_h.pl CERTIFICATE_STRING $(WICED_SDK_CERTIFICATE) > $@
	$(QUIET)$(PERL) $(TOOLS_ROOT)/text_to_c/certs_to_h.pl PRIVATE_KEY_STRING $(WICED_SDK_PRIVATE_KEY) >> $@

# Main Target - Ensures the required parts get built
build_done: $(PLATFORM_PRE_BUILD_TARGETS) $(FINAL_OUTPUT_FILE) $(if $(filter 1,$(NODCT)),,$(FINAL_DCT_FILE)) display_map_summary

$(BUILD_STRING): build_done $(PLATFORM_POST_BUILD_TARGETS)

# Stack usage target - Currently not working outputs a CSV file showing function stack usage
$(OUTPUT_DIR)/stack_usage.csv: $(OUTPUT_DIR)/binary/$(CLEANED_BUILD_STRING)$(LINK_OUTPUT_SUFFIX)
	$(QUIET)$(ECHO) Extracting call tree
	$(QUIET)cd $(OUTPUT_DIR); find -name *.optimized | xargs cat > call_tree.txt
	$(QUIET)$(ECHO) Extracting individual stack usage
	$(QUIET)cd $(OUTPUT_DIR); find -name *.su | xargs cat > stack_usage.txt
	$(QUIET)$(ECHO) Processing stack data
	$(QUIET)cd $(OUTPUT_DIR); $(QUIET)$(PERL) $(TOOLS_ROOT)/stack_usage/stack_usage/stack_usage.pl > $@


