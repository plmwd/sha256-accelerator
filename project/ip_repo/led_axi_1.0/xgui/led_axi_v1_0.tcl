# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "C_LED_IO_AXI_BASEADDR"
  ipgui::add_param $IPINST -name "C_LED_IO_AXI_HIGHADDR"

}

proc update_PARAM_VALUE.C_LED_IO_AXI_BASEADDR { PARAM_VALUE.C_LED_IO_AXI_BASEADDR } {
	# Procedure called to update C_LED_IO_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LED_IO_AXI_BASEADDR { PARAM_VALUE.C_LED_IO_AXI_BASEADDR } {
	# Procedure called to validate C_LED_IO_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_LED_IO_AXI_HIGHADDR { PARAM_VALUE.C_LED_IO_AXI_HIGHADDR } {
	# Procedure called to update C_LED_IO_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LED_IO_AXI_HIGHADDR { PARAM_VALUE.C_LED_IO_AXI_HIGHADDR } {
	# Procedure called to validate C_LED_IO_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_LED_IO_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_LED_IO_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_LED_IO_AXI_DATA_WIDTH". Setting updated value from the model parameter.
set_property value 32 ${MODELPARAM_VALUE.C_LED_IO_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_LED_IO_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_LED_IO_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_LED_IO_AXI_ADDR_WIDTH". Setting updated value from the model parameter.
set_property value 4 ${MODELPARAM_VALUE.C_LED_IO_AXI_ADDR_WIDTH}
}

