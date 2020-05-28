

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "axi_sha256" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_AXI_BASEADDR" "C_S00_AXI_HIGHADDR" "C_S_SHA256_BIG_ENDIAN" "C_S_SHA256_BIG_ENDIAN_HASH" "C_S_SHA256_GEN_PADDER"
}
