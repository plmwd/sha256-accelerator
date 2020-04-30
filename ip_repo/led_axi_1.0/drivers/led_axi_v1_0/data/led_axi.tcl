

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "led_axi" "NUM_INSTANCES" "DEVICE_ID"  "C_LED_IO_AXI_BASEADDR" "C_LED_IO_AXI_HIGHADDR"
}
