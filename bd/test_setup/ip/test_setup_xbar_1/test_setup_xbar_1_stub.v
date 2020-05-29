// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri May 29 13:45:56 2020
// Host        : DESKTOP-E4CP06Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/904pa/Documents/Git/sha256/bd/test_setup/ip/test_setup_xbar_1/test_setup_xbar_1_stub.v
// Design      : test_setup_xbar_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_crossbar_v2_1_21_axi_crossbar,Vivado 2019.2" *)
module test_setup_xbar_1(aclk, aresetn, s_axi_awaddr, s_axi_awprot, 
  s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, s_axi_wready, 
  s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arprot, s_axi_arvalid, 
  s_axi_arready, s_axi_rdata, s_axi_rresp, s_axi_rvalid, s_axi_rready, m_axi_awaddr, 
  m_axi_awprot, m_axi_awvalid, m_axi_awready, m_axi_wdata, m_axi_wstrb, m_axi_wvalid, 
  m_axi_wready, m_axi_bresp, m_axi_bvalid, m_axi_bready, m_axi_araddr, m_axi_arprot, 
  m_axi_arvalid, m_axi_arready, m_axi_rdata, m_axi_rresp, m_axi_rvalid, m_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axi_awaddr[127:0],s_axi_awprot[11:0],s_axi_awvalid[3:0],s_axi_awready[3:0],s_axi_wdata[127:0],s_axi_wstrb[15:0],s_axi_wvalid[3:0],s_axi_wready[3:0],s_axi_bresp[7:0],s_axi_bvalid[3:0],s_axi_bready[3:0],s_axi_araddr[127:0],s_axi_arprot[11:0],s_axi_arvalid[3:0],s_axi_arready[3:0],s_axi_rdata[127:0],s_axi_rresp[7:0],s_axi_rvalid[3:0],s_axi_rready[3:0],m_axi_awaddr[95:0],m_axi_awprot[8:0],m_axi_awvalid[2:0],m_axi_awready[2:0],m_axi_wdata[95:0],m_axi_wstrb[11:0],m_axi_wvalid[2:0],m_axi_wready[2:0],m_axi_bresp[5:0],m_axi_bvalid[2:0],m_axi_bready[2:0],m_axi_araddr[95:0],m_axi_arprot[8:0],m_axi_arvalid[2:0],m_axi_arready[2:0],m_axi_rdata[95:0],m_axi_rresp[5:0],m_axi_rvalid[2:0],m_axi_rready[2:0]" */;
  input aclk;
  input aresetn;
  input [127:0]s_axi_awaddr;
  input [11:0]s_axi_awprot;
  input [3:0]s_axi_awvalid;
  output [3:0]s_axi_awready;
  input [127:0]s_axi_wdata;
  input [15:0]s_axi_wstrb;
  input [3:0]s_axi_wvalid;
  output [3:0]s_axi_wready;
  output [7:0]s_axi_bresp;
  output [3:0]s_axi_bvalid;
  input [3:0]s_axi_bready;
  input [127:0]s_axi_araddr;
  input [11:0]s_axi_arprot;
  input [3:0]s_axi_arvalid;
  output [3:0]s_axi_arready;
  output [127:0]s_axi_rdata;
  output [7:0]s_axi_rresp;
  output [3:0]s_axi_rvalid;
  input [3:0]s_axi_rready;
  output [95:0]m_axi_awaddr;
  output [8:0]m_axi_awprot;
  output [2:0]m_axi_awvalid;
  input [2:0]m_axi_awready;
  output [95:0]m_axi_wdata;
  output [11:0]m_axi_wstrb;
  output [2:0]m_axi_wvalid;
  input [2:0]m_axi_wready;
  input [5:0]m_axi_bresp;
  input [2:0]m_axi_bvalid;
  output [2:0]m_axi_bready;
  output [95:0]m_axi_araddr;
  output [8:0]m_axi_arprot;
  output [2:0]m_axi_arvalid;
  input [2:0]m_axi_arready;
  input [95:0]m_axi_rdata;
  input [5:0]m_axi_rresp;
  input [2:0]m_axi_rvalid;
  output [2:0]m_axi_rready;
endmodule
