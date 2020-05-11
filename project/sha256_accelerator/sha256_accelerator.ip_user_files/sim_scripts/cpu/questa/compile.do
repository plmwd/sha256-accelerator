vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/microblaze_v11_0_2
vlib questa_lib/msim/lmb_v10_v3_0_10
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_17
vlib questa_lib/msim/blk_mem_gen_v8_4_4
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_20
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/axi_data_fifo_v2_1_19
vlib questa_lib/msim/axi_crossbar_v2_1_21
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/axi_intc_v4_1_14
vlib questa_lib/msim/xlconcat_v2_1_3
vlib questa_lib/msim/mdm_v3_2_17
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_uartlite_v2_0_24
vlib questa_lib/msim/axi_timer_v2_0_22

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap microblaze_v11_0_2 questa_lib/msim/microblaze_v11_0_2
vmap lmb_v10_v3_0_10 questa_lib/msim/lmb_v10_v3_0_10
vmap lmb_bram_if_cntlr_v4_0_17 questa_lib/msim/lmb_bram_if_cntlr_v4_0_17
vmap blk_mem_gen_v8_4_4 questa_lib/msim/blk_mem_gen_v8_4_4
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_20 questa_lib/msim/axi_register_slice_v2_1_20
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 questa_lib/msim/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 questa_lib/msim/axi_crossbar_v2_1_21
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_14 questa_lib/msim/axi_intc_v4_1_14
vmap xlconcat_v2_1_3 questa_lib/msim/xlconcat_v2_1_3
vmap mdm_v3_2_17 questa_lib/msim/mdm_v3_2_17
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_24 questa_lib/msim/axi_uartlite_v2_0_24
vmap axi_timer_v2_0_22 questa_lib/msim/axi_timer_v2_0_22

vlog -work xpm -64 -sv "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"c:/Users/904pa/Documents/Git/sha256/project/sha256_accelerator/sha256_accelerator.srcs/sources_1/bd/cpu/ip/cpu_axi_sha256_0_1/cpu_axi_sha256_0_1_sim_netlist.v" \

vcom -work microblaze_v11_0_2 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_microblaze_0_0/sim/cpu_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_10 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_dlmb_v10_0/sim/cpu_dlmb_v10_0.vhd" \
"../../../bd/cpu/ip/cpu_ilmb_v10_0/sim/cpu_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_17 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_dlmb_bram_if_cntlr_0/sim/cpu_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/cpu/ip/cpu_ilmb_bram_if_cntlr_0/sim/cpu_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../bd/cpu/ip/cpu_lmb_bram_0/sim/cpu_lmb_bram_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_lmb_v10_0/sim/cpu_lmb_v10_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../bd/cpu/ip/cpu_xbar_0/sim/cpu_xbar_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_14 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/f78a/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_microblaze_0_axi_intc_0/sim/cpu_microblaze_0_axi_intc_0.vhd" \

vlog -work xlconcat_v2_1_3 -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../bd/cpu/ip/cpu_microblaze_0_xlconcat_0/sim/cpu_microblaze_0_xlconcat_0.v" \

vcom -work mdm_v3_2_17 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_mdm_1_0/sim/cpu_mdm_1_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../bd/cpu/ip/cpu_clk_wiz_1_0/cpu_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/cpu/ip/cpu_clk_wiz_1_0/cpu_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_rst_clk_wiz_1_100M_0/sim/cpu_rst_clk_wiz_1_100M_0.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_axi_uartlite_0_0/sim/cpu_axi_uartlite_0_0.vhd" \

vcom -work axi_timer_v2_0_22 -64 -93 \
"../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/a141/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cpu/ip/cpu_axi_timer_0_0/sim/cpu_axi_timer_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/ec67/hdl" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/cpu/ipshared/4fba" "+incdir+../../../../sha256_accelerator.srcs/sources_1/bd/src/hdl" \
"../../../bd/cpu/ip/cpu_auto_pc_0/cpu_auto_pc_0_sim_netlist.v" \

vlog -work xil_defaultlib \
"glbl.v"

