// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri May 29 13:44:49 2020
// Host        : DESKTOP-E4CP06Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/904pa/Documents/Git/sha256/bd/test_setup/ip/test_setup_dlmb_bram_if_cntlr_1/test_setup_dlmb_bram_if_cntlr_1_sim_netlist.v
// Design      : test_setup_dlmb_bram_if_cntlr_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "test_setup_dlmb_bram_if_cntlr_1,lmb_bram_if_cntlr,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "lmb_bram_if_cntlr,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module test_setup_dlmb_bram_if_cntlr_1
   (LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB1_ABus,
    LMB1_WriteDBus,
    LMB1_AddrStrobe,
    LMB1_ReadStrobe,
    LMB1_WriteStrobe,
    LMB1_BE,
    Sl1_DBus,
    Sl1_Ready,
    Sl1_Wait,
    Sl1_UE,
    Sl1_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_Addr_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Dout_A,
    BRAM_Din_A);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.LMB_Clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.LMB_Clk, ASSOCIATED_BUSIF SLMB:SLMB1:SLMB2:SLMB3, ASSOCIATED_RESET LMB_Rst, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *) input LMB_Clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST.LMB_Rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST.LMB_Rst, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT, INSERT_VIP 0" *) input LMB_Rst;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB ABUS" *) (* x_interface_parameter = "XIL_INTERFACENAME SLMB, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD" *) input [0:31]LMB_ABus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB WRITEDBUS" *) input [0:31]LMB_WriteDBus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB ADDRSTROBE" *) input LMB_AddrStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB READSTROBE" *) input LMB_ReadStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB WRITESTROBE" *) input LMB_WriteStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB BE" *) input [0:3]LMB_BE;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB READDBUS" *) output [0:31]Sl_DBus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB READY" *) output Sl_Ready;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB WAIT" *) output Sl_Wait;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB UE" *) output Sl_UE;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB CE" *) output Sl_CE;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 ABUS" *) (* x_interface_parameter = "XIL_INTERFACENAME SLMB1, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD" *) input [0:31]LMB1_ABus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 WRITEDBUS" *) input [0:31]LMB1_WriteDBus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 ADDRSTROBE" *) input LMB1_AddrStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 READSTROBE" *) input LMB1_ReadStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 WRITESTROBE" *) input LMB1_WriteStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 BE" *) input [0:3]LMB1_BE;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 READDBUS" *) output [0:31]Sl1_DBus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 READY" *) output Sl1_Ready;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 WAIT" *) output Sl1_Wait;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 UE" *) output Sl1_UE;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB1 CE" *) output Sl1_CE;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT RST" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORT, MEM_SIZE 8192, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1" *) output BRAM_Rst_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT CLK" *) output BRAM_Clk_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT ADDR" *) output [0:31]BRAM_Addr_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT EN" *) output BRAM_EN_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT WE" *) output [0:3]BRAM_WEN_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT DIN" *) output [0:31]BRAM_Dout_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT DOUT" *) input [0:31]BRAM_Din_A;

  wire [0:31]BRAM_Addr_A;
  wire BRAM_Clk_A;
  wire [0:31]BRAM_Din_A;
  wire [0:31]BRAM_Dout_A;
  wire BRAM_EN_A;
  wire BRAM_Rst_A;
  wire [0:3]BRAM_WEN_A;
  wire [0:31]LMB1_ABus;
  wire LMB1_AddrStrobe;
  wire [0:3]LMB1_BE;
  wire LMB1_ReadStrobe;
  wire [0:31]LMB1_WriteDBus;
  wire LMB1_WriteStrobe;
  wire [0:31]LMB_ABus;
  wire LMB_AddrStrobe;
  wire [0:3]LMB_BE;
  wire LMB_Clk;
  wire LMB_ReadStrobe;
  wire LMB_Rst;
  wire [0:31]LMB_WriteDBus;
  wire LMB_WriteStrobe;
  wire Sl1_CE;
  wire [0:31]Sl1_DBus;
  wire Sl1_Ready;
  wire Sl1_UE;
  wire Sl1_Wait;
  wire Sl_CE;
  wire [0:31]Sl_DBus;
  wire Sl_Ready;
  wire Sl_UE;
  wire Sl_Wait;
  wire NLW_U0_CE_UNCONNECTED;
  wire NLW_U0_Interrupt_UNCONNECTED;
  wire NLW_U0_S_AXI_CTRL_ARREADY_UNCONNECTED;
  wire NLW_U0_S_AXI_CTRL_AWREADY_UNCONNECTED;
  wire NLW_U0_S_AXI_CTRL_BVALID_UNCONNECTED;
  wire NLW_U0_S_AXI_CTRL_RVALID_UNCONNECTED;
  wire NLW_U0_S_AXI_CTRL_WREADY_UNCONNECTED;
  wire NLW_U0_Sl2_CE_UNCONNECTED;
  wire NLW_U0_Sl2_Ready_UNCONNECTED;
  wire NLW_U0_Sl2_UE_UNCONNECTED;
  wire NLW_U0_Sl2_Wait_UNCONNECTED;
  wire NLW_U0_Sl3_CE_UNCONNECTED;
  wire NLW_U0_Sl3_Ready_UNCONNECTED;
  wire NLW_U0_Sl3_UE_UNCONNECTED;
  wire NLW_U0_Sl3_Wait_UNCONNECTED;
  wire NLW_U0_UE_UNCONNECTED;
  wire [1:0]NLW_U0_S_AXI_CTRL_BRESP_UNCONNECTED;
  wire [31:0]NLW_U0_S_AXI_CTRL_RDATA_UNCONNECTED;
  wire [1:0]NLW_U0_S_AXI_CTRL_RRESP_UNCONNECTED;
  wire [0:31]NLW_U0_Sl2_DBus_UNCONNECTED;
  wire [0:31]NLW_U0_Sl3_DBus_UNCONNECTED;

  (* C_BASEADDR = "64'b0000000000000000000000000000000000000000000000000000000000000000" *) 
  (* C_BRAM_AWIDTH = "32" *) 
  (* C_CE_COUNTER_WIDTH = "0" *) 
  (* C_CE_FAILING_REGISTERS = "0" *) 
  (* C_ECC = "0" *) 
  (* C_ECC_ONOFF_REGISTER = "0" *) 
  (* C_ECC_ONOFF_RESET_VALUE = "1" *) 
  (* C_ECC_STATUS_REGISTERS = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FAULT_INJECT = "0" *) 
  (* C_HIGHADDR = "64'b0000000000000000000000000000000000000000000000000001111111111111" *) 
  (* C_INTERCONNECT = "0" *) 
  (* C_LMB_AWIDTH = "32" *) 
  (* C_LMB_DWIDTH = "32" *) 
  (* C_LMB_PROTOCOL = "0" *) 
  (* C_MASK = "64'b0000000000000000000000000000000000000000001000000000000000000000" *) 
  (* C_MASK1 = "64'b0000000000000000000000000000000000000000001000000000000000000000" *) 
  (* C_MASK2 = "64'b0000000000000000000000000000000000000000100000000000000000000000" *) 
  (* C_MASK3 = "64'b0000000000000000000000000000000000000000100000000000000000000000" *) 
  (* C_NUM_LMB = "2" *) 
  (* C_S_AXI_CTRL_ADDR_WIDTH = "32" *) 
  (* C_S_AXI_CTRL_BASEADDR = "32'b11111111111111111111111111111111" *) 
  (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) 
  (* C_S_AXI_CTRL_HIGHADDR = "32'b00000000000000000000000000000000" *) 
  (* C_UE_FAILING_REGISTERS = "0" *) 
  (* C_WRITE_ACCESS = "2" *) 
  test_setup_dlmb_bram_if_cntlr_1_lmb_bram_if_cntlr U0
       (.BRAM_Addr_A(BRAM_Addr_A),
        .BRAM_Clk_A(BRAM_Clk_A),
        .BRAM_Din_A(BRAM_Din_A),
        .BRAM_Dout_A(BRAM_Dout_A),
        .BRAM_EN_A(BRAM_EN_A),
        .BRAM_Rst_A(BRAM_Rst_A),
        .BRAM_WEN_A(BRAM_WEN_A),
        .CE(NLW_U0_CE_UNCONNECTED),
        .Interrupt(NLW_U0_Interrupt_UNCONNECTED),
        .LMB1_ABus(LMB1_ABus),
        .LMB1_AddrStrobe(LMB1_AddrStrobe),
        .LMB1_BE(LMB1_BE),
        .LMB1_ReadStrobe(LMB1_ReadStrobe),
        .LMB1_WriteDBus(LMB1_WriteDBus),
        .LMB1_WriteStrobe(LMB1_WriteStrobe),
        .LMB2_ABus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LMB2_AddrStrobe(1'b0),
        .LMB2_BE({1'b0,1'b0,1'b0,1'b0}),
        .LMB2_ReadStrobe(1'b0),
        .LMB2_WriteDBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LMB2_WriteStrobe(1'b0),
        .LMB3_ABus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LMB3_AddrStrobe(1'b0),
        .LMB3_BE({1'b0,1'b0,1'b0,1'b0}),
        .LMB3_ReadStrobe(1'b0),
        .LMB3_WriteDBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LMB3_WriteStrobe(1'b0),
        .LMB_ABus(LMB_ABus),
        .LMB_AddrStrobe(LMB_AddrStrobe),
        .LMB_BE(LMB_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(LMB_ReadStrobe),
        .LMB_Rst(LMB_Rst),
        .LMB_WriteDBus(LMB_WriteDBus),
        .LMB_WriteStrobe(LMB_WriteStrobe),
        .S_AXI_CTRL_ACLK(1'b0),
        .S_AXI_CTRL_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_CTRL_ARESETN(1'b0),
        .S_AXI_CTRL_ARREADY(NLW_U0_S_AXI_CTRL_ARREADY_UNCONNECTED),
        .S_AXI_CTRL_ARVALID(1'b0),
        .S_AXI_CTRL_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_CTRL_AWREADY(NLW_U0_S_AXI_CTRL_AWREADY_UNCONNECTED),
        .S_AXI_CTRL_AWVALID(1'b0),
        .S_AXI_CTRL_BREADY(1'b0),
        .S_AXI_CTRL_BRESP(NLW_U0_S_AXI_CTRL_BRESP_UNCONNECTED[1:0]),
        .S_AXI_CTRL_BVALID(NLW_U0_S_AXI_CTRL_BVALID_UNCONNECTED),
        .S_AXI_CTRL_RDATA(NLW_U0_S_AXI_CTRL_RDATA_UNCONNECTED[31:0]),
        .S_AXI_CTRL_RREADY(1'b0),
        .S_AXI_CTRL_RRESP(NLW_U0_S_AXI_CTRL_RRESP_UNCONNECTED[1:0]),
        .S_AXI_CTRL_RVALID(NLW_U0_S_AXI_CTRL_RVALID_UNCONNECTED),
        .S_AXI_CTRL_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_CTRL_WREADY(NLW_U0_S_AXI_CTRL_WREADY_UNCONNECTED),
        .S_AXI_CTRL_WSTRB({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_CTRL_WVALID(1'b0),
        .Sl1_CE(Sl1_CE),
        .Sl1_DBus(Sl1_DBus),
        .Sl1_Ready(Sl1_Ready),
        .Sl1_UE(Sl1_UE),
        .Sl1_Wait(Sl1_Wait),
        .Sl2_CE(NLW_U0_Sl2_CE_UNCONNECTED),
        .Sl2_DBus(NLW_U0_Sl2_DBus_UNCONNECTED[0:31]),
        .Sl2_Ready(NLW_U0_Sl2_Ready_UNCONNECTED),
        .Sl2_UE(NLW_U0_Sl2_UE_UNCONNECTED),
        .Sl2_Wait(NLW_U0_Sl2_Wait_UNCONNECTED),
        .Sl3_CE(NLW_U0_Sl3_CE_UNCONNECTED),
        .Sl3_DBus(NLW_U0_Sl3_DBus_UNCONNECTED[0:31]),
        .Sl3_Ready(NLW_U0_Sl3_Ready_UNCONNECTED),
        .Sl3_UE(NLW_U0_Sl3_UE_UNCONNECTED),
        .Sl3_Wait(NLW_U0_Sl3_Wait_UNCONNECTED),
        .Sl_CE(Sl_CE),
        .Sl_DBus(Sl_DBus),
        .Sl_Ready(Sl_Ready),
        .Sl_UE(Sl_UE),
        .Sl_Wait(Sl_Wait),
        .UE(NLW_U0_UE_UNCONNECTED));
endmodule

(* C_BASEADDR = "64'b0000000000000000000000000000000000000000000000000000000000000000" *) (* C_BRAM_AWIDTH = "32" *) (* C_CE_COUNTER_WIDTH = "0" *) 
(* C_CE_FAILING_REGISTERS = "0" *) (* C_ECC = "0" *) (* C_ECC_ONOFF_REGISTER = "0" *) 
(* C_ECC_ONOFF_RESET_VALUE = "1" *) (* C_ECC_STATUS_REGISTERS = "0" *) (* C_FAMILY = "artix7" *) 
(* C_FAULT_INJECT = "0" *) (* C_HIGHADDR = "64'b0000000000000000000000000000000000000000000000000001111111111111" *) (* C_INTERCONNECT = "0" *) 
(* C_LMB_AWIDTH = "32" *) (* C_LMB_DWIDTH = "32" *) (* C_LMB_PROTOCOL = "0" *) 
(* C_MASK = "64'b0000000000000000000000000000000000000000001000000000000000000000" *) (* C_MASK1 = "64'b0000000000000000000000000000000000000000001000000000000000000000" *) (* C_MASK2 = "64'b0000000000000000000000000000000000000000100000000000000000000000" *) 
(* C_MASK3 = "64'b0000000000000000000000000000000000000000100000000000000000000000" *) (* C_NUM_LMB = "2" *) (* C_S_AXI_CTRL_ADDR_WIDTH = "32" *) 
(* C_S_AXI_CTRL_BASEADDR = "32'b11111111111111111111111111111111" *) (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) (* C_S_AXI_CTRL_HIGHADDR = "32'b00000000000000000000000000000000" *) 
(* C_UE_FAILING_REGISTERS = "0" *) (* C_WRITE_ACCESS = "2" *) (* ORIG_REF_NAME = "lmb_bram_if_cntlr" *) 
module test_setup_dlmb_bram_if_cntlr_1_lmb_bram_if_cntlr
   (LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB1_ABus,
    LMB1_WriteDBus,
    LMB1_AddrStrobe,
    LMB1_ReadStrobe,
    LMB1_WriteStrobe,
    LMB1_BE,
    Sl1_DBus,
    Sl1_Ready,
    Sl1_Wait,
    Sl1_UE,
    Sl1_CE,
    LMB2_ABus,
    LMB2_WriteDBus,
    LMB2_AddrStrobe,
    LMB2_ReadStrobe,
    LMB2_WriteStrobe,
    LMB2_BE,
    Sl2_DBus,
    Sl2_Ready,
    Sl2_Wait,
    Sl2_UE,
    Sl2_CE,
    LMB3_ABus,
    LMB3_WriteDBus,
    LMB3_AddrStrobe,
    LMB3_ReadStrobe,
    LMB3_WriteStrobe,
    LMB3_BE,
    Sl3_DBus,
    Sl3_Ready,
    Sl3_Wait,
    Sl3_UE,
    Sl3_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_Addr_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Dout_A,
    BRAM_Din_A,
    S_AXI_CTRL_ACLK,
    S_AXI_CTRL_ARESETN,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WSTRB,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    UE,
    CE,
    Interrupt);
  input LMB_Clk;
  input LMB_Rst;
  input [0:31]LMB_ABus;
  input [0:31]LMB_WriteDBus;
  input LMB_AddrStrobe;
  input LMB_ReadStrobe;
  input LMB_WriteStrobe;
  input [0:3]LMB_BE;
  output [0:31]Sl_DBus;
  output Sl_Ready;
  output Sl_Wait;
  output Sl_UE;
  output Sl_CE;
  input [0:31]LMB1_ABus;
  input [0:31]LMB1_WriteDBus;
  input LMB1_AddrStrobe;
  input LMB1_ReadStrobe;
  input LMB1_WriteStrobe;
  input [0:3]LMB1_BE;
  output [0:31]Sl1_DBus;
  output Sl1_Ready;
  output Sl1_Wait;
  output Sl1_UE;
  output Sl1_CE;
  input [0:31]LMB2_ABus;
  input [0:31]LMB2_WriteDBus;
  input LMB2_AddrStrobe;
  input LMB2_ReadStrobe;
  input LMB2_WriteStrobe;
  input [0:3]LMB2_BE;
  output [0:31]Sl2_DBus;
  output Sl2_Ready;
  output Sl2_Wait;
  output Sl2_UE;
  output Sl2_CE;
  input [0:31]LMB3_ABus;
  input [0:31]LMB3_WriteDBus;
  input LMB3_AddrStrobe;
  input LMB3_ReadStrobe;
  input LMB3_WriteStrobe;
  input [0:3]LMB3_BE;
  output [0:31]Sl3_DBus;
  output Sl3_Ready;
  output Sl3_Wait;
  output Sl3_UE;
  output Sl3_CE;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output [0:31]BRAM_Addr_A;
  output BRAM_EN_A;
  output [0:3]BRAM_WEN_A;
  output [0:31]BRAM_Dout_A;
  input [0:31]BRAM_Din_A;
  input S_AXI_CTRL_ACLK;
  input S_AXI_CTRL_ARESETN;
  input [31:0]S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0]S_AXI_CTRL_WDATA;
  input [3:0]S_AXI_CTRL_WSTRB;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0]S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0]S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0]S_AXI_CTRL_RDATA;
  output [1:0]S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output UE;
  output CE;
  output Interrupt;

  wire \<const0> ;
  wire [0:31]BRAM_Addr_A;
  wire [0:31]BRAM_Din_A;
  wire [0:31]BRAM_Dout_A;
  wire BRAM_EN_A;
  wire [0:3]BRAM_WEN_A;
  wire [0:31]LMB1_ABus;
  wire LMB1_AddrStrobe;
  wire [0:3]LMB1_BE;
  wire [0:31]LMB1_WriteDBus;
  wire LMB1_WriteStrobe;
  wire [0:31]LMB_ABus;
  wire LMB_AddrStrobe;
  wire [0:3]LMB_BE;
  wire LMB_Clk;
  wire LMB_Rst;
  wire [0:31]LMB_WriteDBus;
  wire LMB_WriteStrobe;
  wire Sl1_Ready;
  wire Sl1_Wait;
  wire Sl_Rdy;
  wire Sl_Ready;
  wire lmb_as;
  wire lmb_select;

  assign BRAM_Clk_A = LMB_Clk;
  assign BRAM_Rst_A = \<const0> ;
  assign CE = \<const0> ;
  assign Interrupt = \<const0> ;
  assign S_AXI_CTRL_ARREADY = \<const0> ;
  assign S_AXI_CTRL_AWREADY = \<const0> ;
  assign S_AXI_CTRL_BRESP[1] = \<const0> ;
  assign S_AXI_CTRL_BRESP[0] = \<const0> ;
  assign S_AXI_CTRL_BVALID = \<const0> ;
  assign S_AXI_CTRL_RDATA[31] = \<const0> ;
  assign S_AXI_CTRL_RDATA[30] = \<const0> ;
  assign S_AXI_CTRL_RDATA[29] = \<const0> ;
  assign S_AXI_CTRL_RDATA[28] = \<const0> ;
  assign S_AXI_CTRL_RDATA[27] = \<const0> ;
  assign S_AXI_CTRL_RDATA[26] = \<const0> ;
  assign S_AXI_CTRL_RDATA[25] = \<const0> ;
  assign S_AXI_CTRL_RDATA[24] = \<const0> ;
  assign S_AXI_CTRL_RDATA[23] = \<const0> ;
  assign S_AXI_CTRL_RDATA[22] = \<const0> ;
  assign S_AXI_CTRL_RDATA[21] = \<const0> ;
  assign S_AXI_CTRL_RDATA[20] = \<const0> ;
  assign S_AXI_CTRL_RDATA[19] = \<const0> ;
  assign S_AXI_CTRL_RDATA[18] = \<const0> ;
  assign S_AXI_CTRL_RDATA[17] = \<const0> ;
  assign S_AXI_CTRL_RDATA[16] = \<const0> ;
  assign S_AXI_CTRL_RDATA[15] = \<const0> ;
  assign S_AXI_CTRL_RDATA[14] = \<const0> ;
  assign S_AXI_CTRL_RDATA[13] = \<const0> ;
  assign S_AXI_CTRL_RDATA[12] = \<const0> ;
  assign S_AXI_CTRL_RDATA[11] = \<const0> ;
  assign S_AXI_CTRL_RDATA[10] = \<const0> ;
  assign S_AXI_CTRL_RDATA[9] = \<const0> ;
  assign S_AXI_CTRL_RDATA[8] = \<const0> ;
  assign S_AXI_CTRL_RDATA[7] = \<const0> ;
  assign S_AXI_CTRL_RDATA[6] = \<const0> ;
  assign S_AXI_CTRL_RDATA[5] = \<const0> ;
  assign S_AXI_CTRL_RDATA[4] = \<const0> ;
  assign S_AXI_CTRL_RDATA[3] = \<const0> ;
  assign S_AXI_CTRL_RDATA[2] = \<const0> ;
  assign S_AXI_CTRL_RDATA[1] = \<const0> ;
  assign S_AXI_CTRL_RDATA[0] = \<const0> ;
  assign S_AXI_CTRL_RRESP[1] = \<const0> ;
  assign S_AXI_CTRL_RRESP[0] = \<const0> ;
  assign S_AXI_CTRL_RVALID = \<const0> ;
  assign S_AXI_CTRL_WREADY = \<const0> ;
  assign Sl1_CE = \<const0> ;
  assign Sl1_DBus[0:31] = BRAM_Din_A;
  assign Sl1_UE = \<const0> ;
  assign Sl2_CE = \<const0> ;
  assign Sl2_DBus[0] = \<const0> ;
  assign Sl2_DBus[1] = \<const0> ;
  assign Sl2_DBus[2] = \<const0> ;
  assign Sl2_DBus[3] = \<const0> ;
  assign Sl2_DBus[4] = \<const0> ;
  assign Sl2_DBus[5] = \<const0> ;
  assign Sl2_DBus[6] = \<const0> ;
  assign Sl2_DBus[7] = \<const0> ;
  assign Sl2_DBus[8] = \<const0> ;
  assign Sl2_DBus[9] = \<const0> ;
  assign Sl2_DBus[10] = \<const0> ;
  assign Sl2_DBus[11] = \<const0> ;
  assign Sl2_DBus[12] = \<const0> ;
  assign Sl2_DBus[13] = \<const0> ;
  assign Sl2_DBus[14] = \<const0> ;
  assign Sl2_DBus[15] = \<const0> ;
  assign Sl2_DBus[16] = \<const0> ;
  assign Sl2_DBus[17] = \<const0> ;
  assign Sl2_DBus[18] = \<const0> ;
  assign Sl2_DBus[19] = \<const0> ;
  assign Sl2_DBus[20] = \<const0> ;
  assign Sl2_DBus[21] = \<const0> ;
  assign Sl2_DBus[22] = \<const0> ;
  assign Sl2_DBus[23] = \<const0> ;
  assign Sl2_DBus[24] = \<const0> ;
  assign Sl2_DBus[25] = \<const0> ;
  assign Sl2_DBus[26] = \<const0> ;
  assign Sl2_DBus[27] = \<const0> ;
  assign Sl2_DBus[28] = \<const0> ;
  assign Sl2_DBus[29] = \<const0> ;
  assign Sl2_DBus[30] = \<const0> ;
  assign Sl2_DBus[31] = \<const0> ;
  assign Sl2_Ready = \<const0> ;
  assign Sl2_UE = \<const0> ;
  assign Sl2_Wait = \<const0> ;
  assign Sl3_CE = \<const0> ;
  assign Sl3_DBus[0] = \<const0> ;
  assign Sl3_DBus[1] = \<const0> ;
  assign Sl3_DBus[2] = \<const0> ;
  assign Sl3_DBus[3] = \<const0> ;
  assign Sl3_DBus[4] = \<const0> ;
  assign Sl3_DBus[5] = \<const0> ;
  assign Sl3_DBus[6] = \<const0> ;
  assign Sl3_DBus[7] = \<const0> ;
  assign Sl3_DBus[8] = \<const0> ;
  assign Sl3_DBus[9] = \<const0> ;
  assign Sl3_DBus[10] = \<const0> ;
  assign Sl3_DBus[11] = \<const0> ;
  assign Sl3_DBus[12] = \<const0> ;
  assign Sl3_DBus[13] = \<const0> ;
  assign Sl3_DBus[14] = \<const0> ;
  assign Sl3_DBus[15] = \<const0> ;
  assign Sl3_DBus[16] = \<const0> ;
  assign Sl3_DBus[17] = \<const0> ;
  assign Sl3_DBus[18] = \<const0> ;
  assign Sl3_DBus[19] = \<const0> ;
  assign Sl3_DBus[20] = \<const0> ;
  assign Sl3_DBus[21] = \<const0> ;
  assign Sl3_DBus[22] = \<const0> ;
  assign Sl3_DBus[23] = \<const0> ;
  assign Sl3_DBus[24] = \<const0> ;
  assign Sl3_DBus[25] = \<const0> ;
  assign Sl3_DBus[26] = \<const0> ;
  assign Sl3_DBus[27] = \<const0> ;
  assign Sl3_DBus[28] = \<const0> ;
  assign Sl3_DBus[29] = \<const0> ;
  assign Sl3_DBus[30] = \<const0> ;
  assign Sl3_DBus[31] = \<const0> ;
  assign Sl3_Ready = \<const0> ;
  assign Sl3_UE = \<const0> ;
  assign Sl3_Wait = \<const0> ;
  assign Sl_CE = \<const0> ;
  assign Sl_DBus[0:31] = BRAM_Din_A;
  assign Sl_UE = \<const0> ;
  assign Sl_Wait = \<const0> ;
  assign UE = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FDRE \No_ECC.Sl_Rdy_reg 
       (.C(LMB_Clk),
        .CE(1'b1),
        .D(lmb_select),
        .Q(Sl_Rdy),
        .R(LMB_Rst));
  FDRE \No_ECC.lmb_as_reg 
       (.C(LMB_Clk),
        .CE(1'b1),
        .D(BRAM_EN_A),
        .Q(lmb_as),
        .R(LMB_Rst));
  test_setup_dlmb_bram_if_cntlr_1_lmb_mux lmb_mux_I
       (.BRAM_Addr_A(BRAM_Addr_A),
        .BRAM_Dout_A(BRAM_Dout_A),
        .BRAM_EN_A(BRAM_EN_A),
        .BRAM_WEN_A(BRAM_WEN_A),
        .LMB1_ABus(LMB1_ABus),
        .LMB1_AddrStrobe(LMB1_AddrStrobe),
        .LMB1_BE(LMB1_BE),
        .LMB1_WriteDBus(LMB1_WriteDBus),
        .LMB1_WriteStrobe(LMB1_WriteStrobe),
        .LMB_ABus(LMB_ABus),
        .LMB_AddrStrobe(LMB_AddrStrobe),
        .LMB_BE(LMB_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_Rst(LMB_Rst),
        .LMB_WriteDBus(LMB_WriteDBus),
        .LMB_WriteStrobe(LMB_WriteStrobe),
        .Sl1_Ready(Sl1_Ready),
        .Sl1_Wait(Sl1_Wait),
        .Sl_Rdy(Sl_Rdy),
        .Sl_Ready(Sl_Ready),
        .lmb_as(lmb_as),
        .lmb_select(lmb_select));
endmodule

(* ORIG_REF_NAME = "lmb_mux" *) 
module test_setup_dlmb_bram_if_cntlr_1_lmb_mux
   (Sl_Ready,
    BRAM_EN_A,
    BRAM_Addr_A,
    BRAM_Dout_A,
    BRAM_WEN_A,
    lmb_select,
    Sl1_Ready,
    Sl1_Wait,
    LMB_Rst,
    LMB_Clk,
    LMB1_AddrStrobe,
    LMB1_WriteStrobe,
    Sl_Rdy,
    lmb_as,
    LMB1_ABus,
    LMB_AddrStrobe,
    LMB_ABus,
    LMB_WriteDBus,
    LMB1_WriteDBus,
    LMB_BE,
    LMB_WriteStrobe,
    LMB1_BE);
  output Sl_Ready;
  output BRAM_EN_A;
  output [0:31]BRAM_Addr_A;
  output [0:31]BRAM_Dout_A;
  output [0:3]BRAM_WEN_A;
  output lmb_select;
  output Sl1_Ready;
  output Sl1_Wait;
  input LMB_Rst;
  input LMB_Clk;
  input LMB1_AddrStrobe;
  input LMB1_WriteStrobe;
  input Sl_Rdy;
  input lmb_as;
  input [0:31]LMB1_ABus;
  input LMB_AddrStrobe;
  input [0:31]LMB_ABus;
  input [0:31]LMB_WriteDBus;
  input [0:31]LMB1_WriteDBus;
  input [0:3]LMB_BE;
  input LMB_WriteStrobe;
  input [0:3]LMB1_BE;

  wire [0:31]BRAM_Addr_A;
  wire [0:31]BRAM_Dout_A;
  wire BRAM_EN_A;
  wire [0:3]BRAM_WEN_A;
  wire [0:31]LMB1_ABus;
  wire LMB1_AddrStrobe;
  wire [0:3]LMB1_BE;
  wire [0:31]LMB1_WriteDBus;
  wire LMB1_WriteStrobe;
  wire [0:31]LMB_ABus;
  wire LMB_AddrStrobe;
  wire [0:3]LMB_BE;
  wire [0:3]\LMB_BE_vec_i[1] ;
  wire LMB_Clk;
  wire LMB_Rst;
  wire [0:31]LMB_WriteDBus;
  wire LMB_WriteStrobe;
  wire [1:1]LMB_WriteStrobe_vec_i__1;
  wire Sl1_Ready;
  wire Sl1_Wait;
  wire Sl_Rdy;
  wire Sl_Ready;
  wire lmb_as;
  wire lmb_select;
  wire \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ;
  wire [31:0]\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] ;
  wire \more_than_one_lmb.lmb_mux_generate[1].LMB_AddrStrobe_vec_Q_reg_n_0_[1] ;
  wire [3:0]\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] ;
  wire [31:0]\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] ;
  wire \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteStrobe_vec_Q_reg_n_0_[1] ;
  wire \more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1_n_0 ;
  wire \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ;
  wire ongoing_Q;
  wire ongoing_new;

  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[0]_INST_0 
       (.I0(LMB_ABus[0]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [31]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[0]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[0]));
  LUT5 #(
    .INIT(32'hAEAE00AE)) 
    \BRAM_Addr_A[0]_INST_0_i_1 
       (.I0(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I1(LMB1_AddrStrobe),
        .I2(LMB1_ABus[10]),
        .I3(LMB_AddrStrobe),
        .I4(LMB_ABus[10]),
        .O(ongoing_new));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[10]_INST_0 
       (.I0(LMB_ABus[10]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [21]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[10]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[10]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[11]_INST_0 
       (.I0(LMB_ABus[11]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [20]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[11]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[11]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[12]_INST_0 
       (.I0(LMB_ABus[12]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [19]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[12]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[12]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[13]_INST_0 
       (.I0(LMB_ABus[13]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [18]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[13]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[13]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[14]_INST_0 
       (.I0(LMB_ABus[14]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [17]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[14]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[14]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[15]_INST_0 
       (.I0(LMB_ABus[15]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [16]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[15]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[15]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[16]_INST_0 
       (.I0(LMB_ABus[16]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [15]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[16]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[16]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[17]_INST_0 
       (.I0(LMB_ABus[17]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [14]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[17]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[17]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[18]_INST_0 
       (.I0(LMB_ABus[18]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [13]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[18]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[18]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[19]_INST_0 
       (.I0(LMB_ABus[19]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [12]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[19]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[19]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[1]_INST_0 
       (.I0(LMB_ABus[1]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [30]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[1]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[1]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[20]_INST_0 
       (.I0(LMB_ABus[20]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [11]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[20]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[20]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[21]_INST_0 
       (.I0(LMB_ABus[21]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [10]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[21]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[21]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[22]_INST_0 
       (.I0(LMB_ABus[22]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [9]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[22]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[22]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[23]_INST_0 
       (.I0(LMB_ABus[23]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [8]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[23]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[23]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[24]_INST_0 
       (.I0(LMB_ABus[24]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [7]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[24]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[24]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[25]_INST_0 
       (.I0(LMB_ABus[25]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [6]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[25]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[25]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[26]_INST_0 
       (.I0(LMB_ABus[26]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [5]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[26]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[26]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[27]_INST_0 
       (.I0(LMB_ABus[27]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [4]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[27]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[27]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[28]_INST_0 
       (.I0(LMB_ABus[28]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [3]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[28]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[28]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[29]_INST_0 
       (.I0(LMB_ABus[29]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [2]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[29]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[29]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[2]_INST_0 
       (.I0(LMB_ABus[2]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [29]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[2]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[2]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[30]_INST_0 
       (.I0(LMB_ABus[30]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [1]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[30]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[30]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[31]_INST_0 
       (.I0(LMB_ABus[31]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [0]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[31]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[31]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[3]_INST_0 
       (.I0(LMB_ABus[3]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [28]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[3]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[3]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[4]_INST_0 
       (.I0(LMB_ABus[4]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [27]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[4]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[4]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[5]_INST_0 
       (.I0(LMB_ABus[5]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [26]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[5]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[5]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[6]_INST_0 
       (.I0(LMB_ABus[6]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [25]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[6]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[6]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[7]_INST_0 
       (.I0(LMB_ABus[7]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [24]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[7]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[7]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[8]_INST_0 
       (.I0(LMB_ABus[8]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [23]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[8]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[8]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Addr_A[9]_INST_0 
       (.I0(LMB_ABus[9]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [22]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_ABus[9]),
        .I4(ongoing_new),
        .O(BRAM_Addr_A[9]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[0]_INST_0 
       (.I0(LMB_WriteDBus[0]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [31]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[0]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[0]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[10]_INST_0 
       (.I0(LMB_WriteDBus[10]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [21]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[10]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[10]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[11]_INST_0 
       (.I0(LMB_WriteDBus[11]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [20]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[11]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[11]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[12]_INST_0 
       (.I0(LMB_WriteDBus[12]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [19]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[12]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[12]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[13]_INST_0 
       (.I0(LMB_WriteDBus[13]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [18]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[13]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[13]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[14]_INST_0 
       (.I0(LMB_WriteDBus[14]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [17]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[14]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[14]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[15]_INST_0 
       (.I0(LMB_WriteDBus[15]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [16]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[15]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[15]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[16]_INST_0 
       (.I0(LMB_WriteDBus[16]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [15]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[16]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[16]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[17]_INST_0 
       (.I0(LMB_WriteDBus[17]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [14]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[17]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[17]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[18]_INST_0 
       (.I0(LMB_WriteDBus[18]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [13]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[18]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[18]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[19]_INST_0 
       (.I0(LMB_WriteDBus[19]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [12]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[19]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[19]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[1]_INST_0 
       (.I0(LMB_WriteDBus[1]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [30]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[1]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[1]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[20]_INST_0 
       (.I0(LMB_WriteDBus[20]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [11]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[20]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[20]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[21]_INST_0 
       (.I0(LMB_WriteDBus[21]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [10]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[21]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[21]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[22]_INST_0 
       (.I0(LMB_WriteDBus[22]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [9]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[22]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[22]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[23]_INST_0 
       (.I0(LMB_WriteDBus[23]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [8]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[23]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[23]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[24]_INST_0 
       (.I0(LMB_WriteDBus[24]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [7]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[24]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[24]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[25]_INST_0 
       (.I0(LMB_WriteDBus[25]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [6]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[25]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[25]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[26]_INST_0 
       (.I0(LMB_WriteDBus[26]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [5]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[26]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[26]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[27]_INST_0 
       (.I0(LMB_WriteDBus[27]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [4]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[27]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[27]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[28]_INST_0 
       (.I0(LMB_WriteDBus[28]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [3]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[28]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[28]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[29]_INST_0 
       (.I0(LMB_WriteDBus[29]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [2]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[29]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[29]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[2]_INST_0 
       (.I0(LMB_WriteDBus[2]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [29]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[2]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[2]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[30]_INST_0 
       (.I0(LMB_WriteDBus[30]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [1]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[30]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[30]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[31]_INST_0 
       (.I0(LMB_WriteDBus[31]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [0]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[31]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[31]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[3]_INST_0 
       (.I0(LMB_WriteDBus[3]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [28]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[3]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[3]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[4]_INST_0 
       (.I0(LMB_WriteDBus[4]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [27]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[4]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[4]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[5]_INST_0 
       (.I0(LMB_WriteDBus[5]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [26]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[5]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[5]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[6]_INST_0 
       (.I0(LMB_WriteDBus[6]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [25]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[6]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[6]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[7]_INST_0 
       (.I0(LMB_WriteDBus[7]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [24]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[7]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[7]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[8]_INST_0 
       (.I0(LMB_WriteDBus[8]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [23]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[8]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[8]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \BRAM_Dout_A[9]_INST_0 
       (.I0(LMB_WriteDBus[9]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [22]),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_WriteDBus[9]),
        .I4(ongoing_new),
        .O(BRAM_Dout_A[9]));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    BRAM_EN_A_INST_0
       (.I0(LMB_AddrStrobe),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].LMB_AddrStrobe_vec_Q_reg_n_0_[1] ),
        .I2(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I3(LMB1_AddrStrobe),
        .I4(ongoing_new),
        .O(BRAM_EN_A));
  LUT6 #(
    .INIT(64'hF000880000008800)) 
    \BRAM_WEN_A[0]_INST_0 
       (.I0(LMB_BE[0]),
        .I1(LMB_WriteStrobe),
        .I2(LMB_WriteStrobe_vec_i__1),
        .I3(lmb_select),
        .I4(ongoing_new),
        .I5(\LMB_BE_vec_i[1] [0]),
        .O(BRAM_WEN_A[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \BRAM_WEN_A[0]_INST_0_i_1 
       (.I0(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteStrobe_vec_Q_reg_n_0_[1] ),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I2(LMB1_WriteStrobe),
        .O(LMB_WriteStrobe_vec_i__1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFF75)) 
    \BRAM_WEN_A[0]_INST_0_i_2 
       (.I0(LMB_ABus[10]),
        .I1(LMB1_ABus[10]),
        .I2(LMB1_AddrStrobe),
        .I3(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .O(lmb_select));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \BRAM_WEN_A[0]_INST_0_i_3 
       (.I0(\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] [3]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I2(LMB1_BE[0]),
        .O(\LMB_BE_vec_i[1] [0]));
  LUT6 #(
    .INIT(64'hF000880000008800)) 
    \BRAM_WEN_A[1]_INST_0 
       (.I0(LMB_BE[1]),
        .I1(LMB_WriteStrobe),
        .I2(LMB_WriteStrobe_vec_i__1),
        .I3(lmb_select),
        .I4(ongoing_new),
        .I5(\LMB_BE_vec_i[1] [1]),
        .O(BRAM_WEN_A[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \BRAM_WEN_A[1]_INST_0_i_1 
       (.I0(\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] [2]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I2(LMB1_BE[1]),
        .O(\LMB_BE_vec_i[1] [1]));
  LUT6 #(
    .INIT(64'hF000880000008800)) 
    \BRAM_WEN_A[2]_INST_0 
       (.I0(LMB_BE[2]),
        .I1(LMB_WriteStrobe),
        .I2(LMB_WriteStrobe_vec_i__1),
        .I3(lmb_select),
        .I4(ongoing_new),
        .I5(\LMB_BE_vec_i[1] [2]),
        .O(BRAM_WEN_A[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \BRAM_WEN_A[2]_INST_0_i_1 
       (.I0(\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] [1]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I2(LMB1_BE[2]),
        .O(\LMB_BE_vec_i[1] [2]));
  LUT6 #(
    .INIT(64'hF000880000008800)) 
    \BRAM_WEN_A[3]_INST_0 
       (.I0(LMB_BE[3]),
        .I1(LMB_WriteStrobe),
        .I2(LMB_WriteStrobe_vec_i__1),
        .I3(lmb_select),
        .I4(ongoing_new),
        .I5(\LMB_BE_vec_i[1] [3]),
        .O(BRAM_WEN_A[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \BRAM_WEN_A[3]_INST_0_i_1 
       (.I0(\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] [0]),
        .I1(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I2(LMB1_BE[3]),
        .O(\LMB_BE_vec_i[1] [3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    Sl1_Ready_INST_0
       (.I0(ongoing_Q),
        .I1(Sl_Rdy),
        .I2(lmb_as),
        .O(Sl1_Ready));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    Sl1_Wait_INST_0
       (.I0(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I1(ongoing_Q),
        .O(Sl1_Wait));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h08)) 
    Sl_Ready_INST_0
       (.I0(Sl_Rdy),
        .I1(lmb_as),
        .I2(ongoing_Q),
        .O(Sl_Ready));
  LUT4 #(
    .INIT(16'h0400)) 
    \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1 
       (.I0(LMB_ABus[10]),
        .I1(LMB_AddrStrobe),
        .I2(LMB1_ABus[10]),
        .I3(LMB1_AddrStrobe),
        .O(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][0] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[0]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [31]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][10] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[10]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [21]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][11] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[11]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [20]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][12] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[12]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [19]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][13] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[13]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [18]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][14] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[14]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [17]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][15] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[15]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [16]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][16] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[16]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [15]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][17] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[17]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [14]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][18] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[18]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [13]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][19] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[19]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [12]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][1] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[1]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [30]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][20] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[20]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [11]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][21] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[21]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [10]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][22] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[22]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [9]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][23] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[23]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [8]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][24] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[24]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [7]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][25] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[25]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [6]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][26] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[26]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [5]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][27] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[27]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [4]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][28] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[28]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [3]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][29] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[29]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [2]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][2] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[2]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [29]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][30] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[30]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [1]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][31] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[31]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [0]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][3] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[3]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [28]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][4] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[4]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [27]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][5] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[5]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [26]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][6] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[6]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [25]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][7] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[7]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [24]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][8] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[8]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [23]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][9] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_ABus[9]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1] [22]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_AddrStrobe_vec_Q_reg[1] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_AddrStrobe),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_AddrStrobe_vec_Q_reg_n_0_[1] ),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1][0] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_BE[0]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] [3]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1][1] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_BE[1]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] [2]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1][2] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_BE[2]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] [1]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1][3] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_BE[3]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1] [0]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][0] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[0]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [31]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][10] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[10]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [21]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][11] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[11]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [20]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][12] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[12]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [19]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][13] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[13]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [18]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][14] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[14]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [17]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][15] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[15]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [16]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][16] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[16]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [15]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][17] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[17]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [14]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][18] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[18]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [13]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][19] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[19]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [12]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][1] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[1]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [30]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][20] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[20]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [11]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][21] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[21]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [10]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][22] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[22]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [9]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][23] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[23]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [8]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][24] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[24]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [7]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][25] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[25]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [6]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][26] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[26]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [5]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][27] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[27]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [4]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][28] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[28]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [3]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][29] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[29]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [2]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][2] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[2]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [29]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][30] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[30]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [1]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][31] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[31]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [0]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][3] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[3]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [28]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][4] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[4]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [27]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][5] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[5]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [26]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][6] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[6]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [25]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][7] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[7]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [24]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][8] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[8]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [23]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][9] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteDBus[9]),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1] [22]),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteStrobe_vec_Q_reg[1] 
       (.C(LMB_Clk),
        .CE(\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0 ),
        .D(LMB1_WriteStrobe),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteStrobe_vec_Q_reg_n_0_[1] ),
        .R(LMB_Rst));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000AE00)) 
    \more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1 
       (.I0(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .I1(LMB1_AddrStrobe),
        .I2(LMB1_ABus[10]),
        .I3(LMB_AddrStrobe),
        .I4(LMB_ABus[10]),
        .O(\more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1_n_0 ));
  FDRE \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg[1] 
       (.C(LMB_Clk),
        .CE(1'b1),
        .D(\more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1_n_0 ),
        .Q(\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1] ),
        .R(LMB_Rst));
  FDRE \more_than_one_lmb.ongoing_Q_reg[0] 
       (.C(LMB_Clk),
        .CE(1'b1),
        .D(ongoing_new),
        .Q(ongoing_Q),
        .R(LMB_Rst));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
