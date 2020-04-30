-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed Apr 29 19:38:35 2020
-- Host        : DESKTOP-E4CP06Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/904pa/Documents/Git/sha256/project/sha256.srcs/sources_1/bd/test/ip/test_led_axi_0_0/test_led_axi_0_0_stub.vhdl
-- Design      : test_led_axi_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_led_axi_0_0 is
  Port ( 
    led_io : out STD_LOGIC_VECTOR ( 15 downto 0 );
    led_io_axi_aclk : in STD_LOGIC;
    led_io_axi_aresetn : in STD_LOGIC;
    led_io_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    led_io_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    led_io_axi_awvalid : in STD_LOGIC;
    led_io_axi_awready : out STD_LOGIC;
    led_io_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    led_io_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    led_io_axi_wvalid : in STD_LOGIC;
    led_io_axi_wready : out STD_LOGIC;
    led_io_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    led_io_axi_bvalid : out STD_LOGIC;
    led_io_axi_bready : in STD_LOGIC;
    led_io_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    led_io_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    led_io_axi_arvalid : in STD_LOGIC;
    led_io_axi_arready : out STD_LOGIC;
    led_io_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    led_io_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    led_io_axi_rvalid : out STD_LOGIC;
    led_io_axi_rready : in STD_LOGIC
  );

end test_led_axi_0_0;

architecture stub of test_led_axi_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "led_io[15:0],led_io_axi_aclk,led_io_axi_aresetn,led_io_axi_awaddr[3:0],led_io_axi_awprot[2:0],led_io_axi_awvalid,led_io_axi_awready,led_io_axi_wdata[31:0],led_io_axi_wstrb[3:0],led_io_axi_wvalid,led_io_axi_wready,led_io_axi_bresp[1:0],led_io_axi_bvalid,led_io_axi_bready,led_io_axi_araddr[3:0],led_io_axi_arprot[2:0],led_io_axi_arvalid,led_io_axi_arready,led_io_axi_rdata[31:0],led_io_axi_rresp[1:0],led_io_axi_rvalid,led_io_axi_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "led_axi_v1_0,Vivado 2019.2";
begin
end;
