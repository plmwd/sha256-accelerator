# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "C_S_SHA256_BIG_ENDIAN"
  set C_S_SHA256_BIG_ENDIAN_HASH [ipgui::add_param $IPINST -name "C_S_SHA256_BIG_ENDIAN_HASH"]
  set_property tooltip {Big endian message registers} ${C_S_SHA256_BIG_ENDIAN_HASH}
  set C_S_SHA256_GEN_PADDER [ipgui::add_param $IPINST -name "C_S_SHA256_GEN_PADDER"]
  set_property tooltip {Pads the message in hardware, rather than software, if true} ${C_S_SHA256_GEN_PADDER}

}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_SHA256_BIG_ENDIAN { PARAM_VALUE.C_S_SHA256_BIG_ENDIAN } {
	# Procedure called to update C_S_SHA256_BIG_ENDIAN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_SHA256_BIG_ENDIAN { PARAM_VALUE.C_S_SHA256_BIG_ENDIAN } {
	# Procedure called to validate C_S_SHA256_BIG_ENDIAN
	return true
}

proc update_PARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH { PARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH } {
	# Procedure called to update C_S_SHA256_BIG_ENDIAN_HASH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH { PARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH } {
	# Procedure called to validate C_S_SHA256_BIG_ENDIAN_HASH
	return true
}

proc update_PARAM_VALUE.C_S_SHA256_GEN_PADDER { PARAM_VALUE.C_S_SHA256_GEN_PADDER } {
	# Procedure called to update C_S_SHA256_GEN_PADDER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_SHA256_GEN_PADDER { PARAM_VALUE.C_S_SHA256_GEN_PADDER } {
	# Procedure called to validate C_S_SHA256_GEN_PADDER
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S_SHA256_BIG_ENDIAN { MODELPARAM_VALUE.C_S_SHA256_BIG_ENDIAN PARAM_VALUE.C_S_SHA256_BIG_ENDIAN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_SHA256_BIG_ENDIAN}] ${MODELPARAM_VALUE.C_S_SHA256_BIG_ENDIAN}
}

proc update_MODELPARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH { MODELPARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH PARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH}] ${MODELPARAM_VALUE.C_S_SHA256_BIG_ENDIAN_HASH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_SHA256_GEN_PADDER { MODELPARAM_VALUE.C_S_SHA256_GEN_PADDER PARAM_VALUE.C_S_SHA256_GEN_PADDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_SHA256_GEN_PADDER}] ${MODELPARAM_VALUE.C_S_SHA256_GEN_PADDER}
}

