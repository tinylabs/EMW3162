set remotetimeout 20
shell ./tools/common/Linux64/dash -c "trap \"\" 2;"./tools/OpenOCD/Linux64/openocd-all-brcm-libftdi" -f ./tools/OpenOCD/BCM9WCD1EVAL1.cfg -f ./tools/OpenOCD/stm32f2x.cfg -f ./tools/OpenOCD/stm32f2x_gdb_jtag.cfg -l build/openocd_log.txt &"
