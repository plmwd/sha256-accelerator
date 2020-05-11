vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/microblaze_v11_0_2
vlib riviera/lmb_v10_v3_0_10
vlib riviera/lmb_bram_if_cntlr_v4_0_17
vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_20
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_data_fifo_v2_1_19
vlib riviera/axi_crossbar_v2_1_21
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/axi_intc_v4_1_14
vlib riviera/xlconcat_v2_1_3
vlib riviera/mdm_v3_2_17
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/lib_pkg_v1_0_2
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/axi_uartlite_v2_0_24
vlib riviera/axi_timer_v2_0_22
vlib riviera/axi_protocol_converter_v2_1_20

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap microblaze_v11_0_2 riviera/microblaze_v11_0_2
vmap lmb_v10_v3_0_10 riviera/lmb_v10_v3_0_10
vmap lmb_bram_if_cntlr_v4_0_17 riviera/lmb_bram_if_cntlr_v4_0_17
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_20 riviera/axi_register_slice_v2_1_20
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 riviera/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 riviera/axi_crossbar_v2_1_21
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_14 riviera/axi_intc_v4_1_14
vmap xlconcat_v2_1_3 riviera/xlconcat_v2_1_3
vmap mdm_v3_2_17 riviera/mdm_v3_2_17
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_24 riviera/axi_uartlite_v2_0_24
vmap axi_timer_v2_0_22 riviera/axi_timer_v2_0_22
vmap axi_protocol_converter_v2_1_20 riviera/axi_protocol_converter_v2_1_20

vlog -work xpm  -sv2k12 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/axi_sha256_v1_0_S_AXI.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/compressor.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/hasher.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/padder.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/reg_delay.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/rom.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/scheduler.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/sha256_update.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/sha256_update_no_padder.v" \
"../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl/axi_sha256_v1_0.v" \
"../../../bd/cpu/ip/cpu_axi_sha256_0_1/sim/cpu_axi_sha256_0_1.v" \

vcom -work microblaze_v11_0_2 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_microblaze_0_0/sim/cpu_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_10 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_dlmb_v10_0/sim/cpu_dlmb_v10_0.vhd" \
"../../../bd/cpu/ip/cpu_ilmb_v10_0/sim/cpu_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_17 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_dlmb_bram_if_cntlr_0/sim/cpu_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/cpu/ip/cpu_ilmb_bram_if_cntlr_0/sim/cpu_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../bd/cpu/ip/cpu_lmb_bram_0/sim/cpu_lmb_bram_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_lmb_v10_0/sim/cpu_lmb_v10_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../bd/cpu/ip/cpu_xbar_0/sim/cpu_xbar_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_14 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/f78a/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_microblaze_0_axi_intc_0/sim/cpu_microblaze_0_axi_intc_0.vhd" \

vlog -work xlconcat_v2_1_3  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../bd/cpu/ip/cpu_microblaze_0_xlconcat_0/sim/cpu_microblaze_0_xlconcat_0.v" \

vcom -work mdm_v3_2_17 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_mdm_1_0/sim/cpu_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../bd/cpu/ip/cpu_clk_wiz_1_0/cpu_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/cpu/ip/cpu_clk_wiz_1_0/cpu_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_rst_clk_wiz_1_100M_0/sim/cpu_rst_clk_wiz_1_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../bd/cpu/sim/cpu.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_axi_uartlite_0_0/sim/cpu_axi_uartlite_0_0.vhd" \

vcom -work axi_timer_v2_0_22 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/a141/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cpu/ip/cpu_axi_timer_0_0/sim/cpu_axi_timer_0_0.vhd" \

vlog -work axi_protocol_converter_v2_1_20  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" \
"../../../bd/cpu/ip/cpu_auto_pc_0/sim/cpu_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

