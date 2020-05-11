-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Sun May 10 23:36:01 2020
-- Host        : DESKTOP-E4CP06Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cpu_dlmb_bram_if_cntlr_0_sim_netlist.vhdl
-- Design      : cpu_dlmb_bram_if_cntlr_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_mux is
  port (
    Sl_Ready : out STD_LOGIC;
    BRAM_EN_A : out STD_LOGIC;
    BRAM_Addr_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_Dout_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_WEN_A : out STD_LOGIC_VECTOR ( 0 to 3 );
    lmb_select : out STD_LOGIC;
    Sl1_Ready : out STD_LOGIC;
    Sl1_Wait : out STD_LOGIC;
    LMB_Rst : in STD_LOGIC;
    LMB_Clk : in STD_LOGIC;
    LMB1_AddrStrobe : in STD_LOGIC;
    LMB1_WriteStrobe : in STD_LOGIC;
    Sl_Rdy : in STD_LOGIC;
    lmb_as : in STD_LOGIC;
    LMB1_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_AddrStrobe : in STD_LOGIC;
    LMB_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB1_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    LMB_WriteStrobe : in STD_LOGIC;
    LMB1_BE : in STD_LOGIC_VECTOR ( 0 to 3 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_mux;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_mux is
  signal \LMB_BE_vec_i[1]\ : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \LMB_WriteStrobe_vec_i__1\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^lmb_select\ : STD_LOGIC;
  signal \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\ : STD_LOGIC;
  signal \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \more_than_one_lmb.lmb_mux_generate[1].LMB_AddrStrobe_vec_Q_reg_n_0_[1]\ : STD_LOGIC;
  signal \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteStrobe_vec_Q_reg_n_0_[1]\ : STD_LOGIC;
  signal \more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1_n_0\ : STD_LOGIC;
  signal \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\ : STD_LOGIC;
  signal ongoing_Q : STD_LOGIC;
  signal ongoing_new : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BRAM_WEN_A[0]_INST_0_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \BRAM_WEN_A[0]_INST_0_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \BRAM_WEN_A[0]_INST_0_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \BRAM_WEN_A[1]_INST_0_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \BRAM_WEN_A[2]_INST_0_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \BRAM_WEN_A[3]_INST_0_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of Sl1_Ready_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of Sl1_Wait_INST_0 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of Sl_Ready_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1\ : label is "soft_lutpair0";
begin
  lmb_select <= \^lmb_select\;
\BRAM_Addr_A[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(0),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(31),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(0),
      I4 => ongoing_new,
      O => BRAM_Addr_A(0)
    );
\BRAM_Addr_A[0]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAE00AE"
    )
        port map (
      I0 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I1 => LMB1_AddrStrobe,
      I2 => LMB1_ABus(1),
      I3 => LMB_AddrStrobe,
      I4 => LMB_ABus(1),
      O => ongoing_new
    );
\BRAM_Addr_A[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(10),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(21),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(10),
      I4 => ongoing_new,
      O => BRAM_Addr_A(10)
    );
\BRAM_Addr_A[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(11),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(20),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(11),
      I4 => ongoing_new,
      O => BRAM_Addr_A(11)
    );
\BRAM_Addr_A[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(12),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(19),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(12),
      I4 => ongoing_new,
      O => BRAM_Addr_A(12)
    );
\BRAM_Addr_A[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(13),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(18),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(13),
      I4 => ongoing_new,
      O => BRAM_Addr_A(13)
    );
\BRAM_Addr_A[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(14),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(17),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(14),
      I4 => ongoing_new,
      O => BRAM_Addr_A(14)
    );
\BRAM_Addr_A[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(15),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(16),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(15),
      I4 => ongoing_new,
      O => BRAM_Addr_A(15)
    );
\BRAM_Addr_A[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(16),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(15),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(16),
      I4 => ongoing_new,
      O => BRAM_Addr_A(16)
    );
\BRAM_Addr_A[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(17),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(14),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(17),
      I4 => ongoing_new,
      O => BRAM_Addr_A(17)
    );
\BRAM_Addr_A[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(18),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(13),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(18),
      I4 => ongoing_new,
      O => BRAM_Addr_A(18)
    );
\BRAM_Addr_A[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(19),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(12),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(19),
      I4 => ongoing_new,
      O => BRAM_Addr_A(19)
    );
\BRAM_Addr_A[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(1),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(30),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(1),
      I4 => ongoing_new,
      O => BRAM_Addr_A(1)
    );
\BRAM_Addr_A[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(20),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(11),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(20),
      I4 => ongoing_new,
      O => BRAM_Addr_A(20)
    );
\BRAM_Addr_A[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(21),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(10),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(21),
      I4 => ongoing_new,
      O => BRAM_Addr_A(21)
    );
\BRAM_Addr_A[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(22),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(9),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(22),
      I4 => ongoing_new,
      O => BRAM_Addr_A(22)
    );
\BRAM_Addr_A[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(23),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(8),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(23),
      I4 => ongoing_new,
      O => BRAM_Addr_A(23)
    );
\BRAM_Addr_A[24]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(24),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(7),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(24),
      I4 => ongoing_new,
      O => BRAM_Addr_A(24)
    );
\BRAM_Addr_A[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(25),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(6),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(25),
      I4 => ongoing_new,
      O => BRAM_Addr_A(25)
    );
\BRAM_Addr_A[26]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(26),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(5),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(26),
      I4 => ongoing_new,
      O => BRAM_Addr_A(26)
    );
\BRAM_Addr_A[27]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(27),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(4),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(27),
      I4 => ongoing_new,
      O => BRAM_Addr_A(27)
    );
\BRAM_Addr_A[28]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(28),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(3),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(28),
      I4 => ongoing_new,
      O => BRAM_Addr_A(28)
    );
\BRAM_Addr_A[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(29),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(2),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(29),
      I4 => ongoing_new,
      O => BRAM_Addr_A(29)
    );
\BRAM_Addr_A[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(2),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(29),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(2),
      I4 => ongoing_new,
      O => BRAM_Addr_A(2)
    );
\BRAM_Addr_A[30]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(30),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(1),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(30),
      I4 => ongoing_new,
      O => BRAM_Addr_A(30)
    );
\BRAM_Addr_A[31]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(31),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(0),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(31),
      I4 => ongoing_new,
      O => BRAM_Addr_A(31)
    );
\BRAM_Addr_A[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(3),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(28),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(3),
      I4 => ongoing_new,
      O => BRAM_Addr_A(3)
    );
\BRAM_Addr_A[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(4),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(27),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(4),
      I4 => ongoing_new,
      O => BRAM_Addr_A(4)
    );
\BRAM_Addr_A[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(5),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(26),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(5),
      I4 => ongoing_new,
      O => BRAM_Addr_A(5)
    );
\BRAM_Addr_A[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(6),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(25),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(6),
      I4 => ongoing_new,
      O => BRAM_Addr_A(6)
    );
\BRAM_Addr_A[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(7),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(24),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(7),
      I4 => ongoing_new,
      O => BRAM_Addr_A(7)
    );
\BRAM_Addr_A[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(8),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(23),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(8),
      I4 => ongoing_new,
      O => BRAM_Addr_A(8)
    );
\BRAM_Addr_A[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_ABus(9),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(22),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_ABus(9),
      I4 => ongoing_new,
      O => BRAM_Addr_A(9)
    );
\BRAM_Dout_A[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(0),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(31),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(0),
      I4 => ongoing_new,
      O => BRAM_Dout_A(0)
    );
\BRAM_Dout_A[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(10),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(21),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(10),
      I4 => ongoing_new,
      O => BRAM_Dout_A(10)
    );
\BRAM_Dout_A[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(11),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(20),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(11),
      I4 => ongoing_new,
      O => BRAM_Dout_A(11)
    );
\BRAM_Dout_A[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(12),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(19),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(12),
      I4 => ongoing_new,
      O => BRAM_Dout_A(12)
    );
\BRAM_Dout_A[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(13),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(18),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(13),
      I4 => ongoing_new,
      O => BRAM_Dout_A(13)
    );
\BRAM_Dout_A[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(14),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(17),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(14),
      I4 => ongoing_new,
      O => BRAM_Dout_A(14)
    );
\BRAM_Dout_A[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(15),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(16),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(15),
      I4 => ongoing_new,
      O => BRAM_Dout_A(15)
    );
\BRAM_Dout_A[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(16),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(15),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(16),
      I4 => ongoing_new,
      O => BRAM_Dout_A(16)
    );
\BRAM_Dout_A[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(17),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(14),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(17),
      I4 => ongoing_new,
      O => BRAM_Dout_A(17)
    );
\BRAM_Dout_A[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(18),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(13),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(18),
      I4 => ongoing_new,
      O => BRAM_Dout_A(18)
    );
\BRAM_Dout_A[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(19),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(12),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(19),
      I4 => ongoing_new,
      O => BRAM_Dout_A(19)
    );
\BRAM_Dout_A[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(1),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(30),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(1),
      I4 => ongoing_new,
      O => BRAM_Dout_A(1)
    );
\BRAM_Dout_A[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(20),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(11),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(20),
      I4 => ongoing_new,
      O => BRAM_Dout_A(20)
    );
\BRAM_Dout_A[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(21),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(10),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(21),
      I4 => ongoing_new,
      O => BRAM_Dout_A(21)
    );
\BRAM_Dout_A[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(22),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(9),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(22),
      I4 => ongoing_new,
      O => BRAM_Dout_A(22)
    );
\BRAM_Dout_A[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(23),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(8),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(23),
      I4 => ongoing_new,
      O => BRAM_Dout_A(23)
    );
\BRAM_Dout_A[24]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(24),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(7),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(24),
      I4 => ongoing_new,
      O => BRAM_Dout_A(24)
    );
\BRAM_Dout_A[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(25),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(6),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(25),
      I4 => ongoing_new,
      O => BRAM_Dout_A(25)
    );
\BRAM_Dout_A[26]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(26),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(5),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(26),
      I4 => ongoing_new,
      O => BRAM_Dout_A(26)
    );
\BRAM_Dout_A[27]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(27),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(4),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(27),
      I4 => ongoing_new,
      O => BRAM_Dout_A(27)
    );
\BRAM_Dout_A[28]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(28),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(3),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(28),
      I4 => ongoing_new,
      O => BRAM_Dout_A(28)
    );
\BRAM_Dout_A[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(29),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(2),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(29),
      I4 => ongoing_new,
      O => BRAM_Dout_A(29)
    );
\BRAM_Dout_A[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(2),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(29),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(2),
      I4 => ongoing_new,
      O => BRAM_Dout_A(2)
    );
\BRAM_Dout_A[30]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(30),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(1),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(30),
      I4 => ongoing_new,
      O => BRAM_Dout_A(30)
    );
\BRAM_Dout_A[31]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(31),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(0),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(31),
      I4 => ongoing_new,
      O => BRAM_Dout_A(31)
    );
\BRAM_Dout_A[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(3),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(28),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(3),
      I4 => ongoing_new,
      O => BRAM_Dout_A(3)
    );
\BRAM_Dout_A[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(4),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(27),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(4),
      I4 => ongoing_new,
      O => BRAM_Dout_A(4)
    );
\BRAM_Dout_A[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(5),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(26),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(5),
      I4 => ongoing_new,
      O => BRAM_Dout_A(5)
    );
\BRAM_Dout_A[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(6),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(25),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(6),
      I4 => ongoing_new,
      O => BRAM_Dout_A(6)
    );
\BRAM_Dout_A[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(7),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(24),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(7),
      I4 => ongoing_new,
      O => BRAM_Dout_A(7)
    );
\BRAM_Dout_A[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(8),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(23),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(8),
      I4 => ongoing_new,
      O => BRAM_Dout_A(8)
    );
\BRAM_Dout_A[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_WriteDBus(9),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(22),
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_WriteDBus(9),
      I4 => ongoing_new,
      O => BRAM_Dout_A(9)
    );
BRAM_EN_A_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => LMB_AddrStrobe,
      I1 => \more_than_one_lmb.lmb_mux_generate[1].LMB_AddrStrobe_vec_Q_reg_n_0_[1]\,
      I2 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I3 => LMB1_AddrStrobe,
      I4 => ongoing_new,
      O => BRAM_EN_A
    );
\BRAM_WEN_A[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F000880000008800"
    )
        port map (
      I0 => LMB_BE(0),
      I1 => LMB_WriteStrobe,
      I2 => \LMB_WriteStrobe_vec_i__1\(1),
      I3 => \^lmb_select\,
      I4 => ongoing_new,
      I5 => \LMB_BE_vec_i[1]\(0),
      O => BRAM_WEN_A(0)
    );
\BRAM_WEN_A[0]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteStrobe_vec_Q_reg_n_0_[1]\,
      I1 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I2 => LMB1_WriteStrobe,
      O => \LMB_WriteStrobe_vec_i__1\(1)
    );
\BRAM_WEN_A[0]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF75"
    )
        port map (
      I0 => LMB_ABus(1),
      I1 => LMB1_ABus(1),
      I2 => LMB1_AddrStrobe,
      I3 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      O => \^lmb_select\
    );
\BRAM_WEN_A[0]_INST_0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\(3),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I2 => LMB1_BE(0),
      O => \LMB_BE_vec_i[1]\(0)
    );
\BRAM_WEN_A[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F000880000008800"
    )
        port map (
      I0 => LMB_BE(1),
      I1 => LMB_WriteStrobe,
      I2 => \LMB_WriteStrobe_vec_i__1\(1),
      I3 => \^lmb_select\,
      I4 => ongoing_new,
      I5 => \LMB_BE_vec_i[1]\(1),
      O => BRAM_WEN_A(1)
    );
\BRAM_WEN_A[1]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\(2),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I2 => LMB1_BE(1),
      O => \LMB_BE_vec_i[1]\(1)
    );
\BRAM_WEN_A[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F000880000008800"
    )
        port map (
      I0 => LMB_BE(2),
      I1 => LMB_WriteStrobe,
      I2 => \LMB_WriteStrobe_vec_i__1\(1),
      I3 => \^lmb_select\,
      I4 => ongoing_new,
      I5 => \LMB_BE_vec_i[1]\(2),
      O => BRAM_WEN_A(2)
    );
\BRAM_WEN_A[2]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\(1),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I2 => LMB1_BE(2),
      O => \LMB_BE_vec_i[1]\(2)
    );
\BRAM_WEN_A[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F000880000008800"
    )
        port map (
      I0 => LMB_BE(3),
      I1 => LMB_WriteStrobe,
      I2 => \LMB_WriteStrobe_vec_i__1\(1),
      I3 => \^lmb_select\,
      I4 => ongoing_new,
      I5 => \LMB_BE_vec_i[1]\(3),
      O => BRAM_WEN_A(3)
    );
\BRAM_WEN_A[3]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\(0),
      I1 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I2 => LMB1_BE(3),
      O => \LMB_BE_vec_i[1]\(3)
    );
Sl1_Ready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ongoing_Q,
      I1 => Sl_Rdy,
      I2 => lmb_as,
      O => Sl1_Ready
    );
Sl1_Wait_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I1 => ongoing_Q,
      O => Sl1_Wait
    );
Sl_Ready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => Sl_Rdy,
      I1 => lmb_as,
      I2 => ongoing_Q,
      O => Sl_Ready
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => LMB_ABus(1),
      I1 => LMB_AddrStrobe,
      I2 => LMB1_ABus(1),
      I3 => LMB1_AddrStrobe,
      O => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(0),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(31),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(10),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(21),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(11),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(20),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][12]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(12),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(19),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][13]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(13),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(18),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][14]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(14),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(17),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][15]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(15),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(16),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][16]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(16),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(15),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][17]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(17),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(14),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][18]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(18),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(13),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][19]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(19),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(12),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(1),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(30),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][20]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(20),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(11),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][21]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(21),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(10),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][22]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(22),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(9),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][23]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(23),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(8),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][24]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(24),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(7),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][25]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(25),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(6),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][26]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(26),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(5),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][27]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(27),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(4),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][28]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(28),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(3),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][29]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(29),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(2),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(2),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(29),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][30]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(30),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(1),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][31]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(31),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(0),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(3),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(28),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(4),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(27),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(5),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(26),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(6),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(25),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(7),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(24),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(8),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(23),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_ABus(9),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q_reg[1]\(22),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_AddrStrobe_vec_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_AddrStrobe,
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_AddrStrobe_vec_Q_reg_n_0_[1]\,
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_BE(0),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\(3),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_BE(1),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\(2),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_BE(2),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\(1),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_BE(3),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_BE_vec_Q_reg[1]\(0),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(0),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(31),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(10),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(21),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(11),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(20),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][12]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(12),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(19),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][13]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(13),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(18),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][14]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(14),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(17),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][15]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(15),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(16),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][16]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(16),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(15),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][17]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(17),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(14),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][18]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(18),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(13),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][19]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(19),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(12),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(1),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(30),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][20]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(20),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(11),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][21]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(21),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(10),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][22]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(22),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(9),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][23]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(23),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(8),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][24]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(24),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(7),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][25]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(25),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(6),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][26]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(26),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(5),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][27]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(27),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(4),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][28]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(28),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(3),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][29]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(29),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(2),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(2),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(29),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][30]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(30),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(1),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][31]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(31),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(0),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(3),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(28),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(4),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(27),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(5),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(26),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(6),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(25),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(7),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(24),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(8),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(23),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteDBus(9),
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteDBus_vec_Q_reg[1]\(22),
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].LMB_WriteStrobe_vec_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => \more_than_one_lmb.lmb_mux_generate[1].LMB_ABus_vec_Q[1][0]_i_1_n_0\,
      D => LMB1_WriteStrobe,
      Q => \more_than_one_lmb.lmb_mux_generate[1].LMB_WriteStrobe_vec_Q_reg_n_0_[1]\,
      R => LMB_Rst
    );
\more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AE00"
    )
        port map (
      I0 => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      I1 => LMB1_AddrStrobe,
      I2 => LMB1_ABus(1),
      I3 => LMB_AddrStrobe,
      I4 => LMB_ABus(1),
      O => \more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1_n_0\
    );
\more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => '1',
      D => \more_than_one_lmb.lmb_mux_generate[1].wait_vec[1]_i_1_n_0\,
      Q => \more_than_one_lmb.lmb_mux_generate[1].wait_vec_reg_n_0_[1]\,
      R => LMB_Rst
    );
\more_than_one_lmb.ongoing_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => '1',
      D => ongoing_new,
      Q => ongoing_Q,
      R => LMB_Rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr is
  port (
    LMB_Clk : in STD_LOGIC;
    LMB_Rst : in STD_LOGIC;
    LMB_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_AddrStrobe : in STD_LOGIC;
    LMB_ReadStrobe : in STD_LOGIC;
    LMB_WriteStrobe : in STD_LOGIC;
    LMB_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl_Ready : out STD_LOGIC;
    Sl_Wait : out STD_LOGIC;
    Sl_UE : out STD_LOGIC;
    Sl_CE : out STD_LOGIC;
    LMB1_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB1_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB1_AddrStrobe : in STD_LOGIC;
    LMB1_ReadStrobe : in STD_LOGIC;
    LMB1_WriteStrobe : in STD_LOGIC;
    LMB1_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl1_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl1_Ready : out STD_LOGIC;
    Sl1_Wait : out STD_LOGIC;
    Sl1_UE : out STD_LOGIC;
    Sl1_CE : out STD_LOGIC;
    LMB2_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB2_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB2_AddrStrobe : in STD_LOGIC;
    LMB2_ReadStrobe : in STD_LOGIC;
    LMB2_WriteStrobe : in STD_LOGIC;
    LMB2_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl2_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl2_Ready : out STD_LOGIC;
    Sl2_Wait : out STD_LOGIC;
    Sl2_UE : out STD_LOGIC;
    Sl2_CE : out STD_LOGIC;
    LMB3_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB3_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB3_AddrStrobe : in STD_LOGIC;
    LMB3_ReadStrobe : in STD_LOGIC;
    LMB3_WriteStrobe : in STD_LOGIC;
    LMB3_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl3_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl3_Ready : out STD_LOGIC;
    Sl3_Wait : out STD_LOGIC;
    Sl3_UE : out STD_LOGIC;
    Sl3_CE : out STD_LOGIC;
    BRAM_Rst_A : out STD_LOGIC;
    BRAM_Clk_A : out STD_LOGIC;
    BRAM_Addr_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_EN_A : out STD_LOGIC;
    BRAM_WEN_A : out STD_LOGIC_VECTOR ( 0 to 3 );
    BRAM_Dout_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_Din_A : in STD_LOGIC_VECTOR ( 0 to 31 );
    S_AXI_CTRL_ACLK : in STD_LOGIC;
    S_AXI_CTRL_ARESETN : in STD_LOGIC;
    S_AXI_CTRL_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_CTRL_AWVALID : in STD_LOGIC;
    S_AXI_CTRL_AWREADY : out STD_LOGIC;
    S_AXI_CTRL_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_CTRL_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_CTRL_WVALID : in STD_LOGIC;
    S_AXI_CTRL_WREADY : out STD_LOGIC;
    S_AXI_CTRL_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_CTRL_BVALID : out STD_LOGIC;
    S_AXI_CTRL_BREADY : in STD_LOGIC;
    S_AXI_CTRL_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_CTRL_ARVALID : in STD_LOGIC;
    S_AXI_CTRL_ARREADY : out STD_LOGIC;
    S_AXI_CTRL_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_CTRL_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_CTRL_RVALID : out STD_LOGIC;
    S_AXI_CTRL_RREADY : in STD_LOGIC;
    UE : out STD_LOGIC;
    CE : out STD_LOGIC;
    Interrupt : out STD_LOGIC
  );
  attribute C_BASEADDR : string;
  attribute C_BASEADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "64'b0000000000000000000000000000000000000000000000000000000000000000";
  attribute C_BRAM_AWIDTH : integer;
  attribute C_BRAM_AWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 32;
  attribute C_CE_COUNTER_WIDTH : integer;
  attribute C_CE_COUNTER_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_CE_FAILING_REGISTERS : integer;
  attribute C_CE_FAILING_REGISTERS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_ECC : integer;
  attribute C_ECC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_ECC_ONOFF_REGISTER : integer;
  attribute C_ECC_ONOFF_REGISTER of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_ECC_ONOFF_RESET_VALUE : integer;
  attribute C_ECC_ONOFF_RESET_VALUE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 1;
  attribute C_ECC_STATUS_REGISTERS : integer;
  attribute C_ECC_STATUS_REGISTERS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "artix7";
  attribute C_FAULT_INJECT : integer;
  attribute C_FAULT_INJECT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_HIGHADDR : string;
  attribute C_HIGHADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "64'b0000000000000000000000000000000000000000000000011111111111111111";
  attribute C_INTERCONNECT : integer;
  attribute C_INTERCONNECT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_LMB_AWIDTH : integer;
  attribute C_LMB_AWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 32;
  attribute C_LMB_DWIDTH : integer;
  attribute C_LMB_DWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 32;
  attribute C_LMB_PROTOCOL : integer;
  attribute C_LMB_PROTOCOL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_MASK : string;
  attribute C_MASK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "64'b0000000000000000000000000000000001000000000000000000000000000000";
  attribute C_MASK1 : string;
  attribute C_MASK1 of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "64'b0000000000000000000000000000000001000000000000000000000000000000";
  attribute C_MASK2 : string;
  attribute C_MASK2 of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "64'b0000000000000000000000000000000000000000100000000000000000000000";
  attribute C_MASK3 : string;
  attribute C_MASK3 of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "64'b0000000000000000000000000000000000000000100000000000000000000000";
  attribute C_NUM_LMB : integer;
  attribute C_NUM_LMB of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 2;
  attribute C_S_AXI_CTRL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CTRL_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 32;
  attribute C_S_AXI_CTRL_BASEADDR : string;
  attribute C_S_AXI_CTRL_BASEADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "32'b11111111111111111111111111111111";
  attribute C_S_AXI_CTRL_DATA_WIDTH : integer;
  attribute C_S_AXI_CTRL_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 32;
  attribute C_S_AXI_CTRL_HIGHADDR : string;
  attribute C_S_AXI_CTRL_HIGHADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is "32'b00000000000000000000000000000000";
  attribute C_UE_FAILING_REGISTERS : integer;
  attribute C_UE_FAILING_REGISTERS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 0;
  attribute C_WRITE_ACCESS : integer;
  attribute C_WRITE_ACCESS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr : entity is 2;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr is
  signal \<const0>\ : STD_LOGIC;
  signal \^bram_din_a\ : STD_LOGIC_VECTOR ( 0 to 31 );
  signal \^bram_en_a\ : STD_LOGIC;
  signal \^lmb_clk\ : STD_LOGIC;
  signal Sl_Rdy : STD_LOGIC;
  signal lmb_as : STD_LOGIC;
  signal lmb_select : STD_LOGIC;
begin
  BRAM_Clk_A <= \^lmb_clk\;
  BRAM_EN_A <= \^bram_en_a\;
  BRAM_Rst_A <= \<const0>\;
  CE <= \<const0>\;
  Interrupt <= \<const0>\;
  S_AXI_CTRL_ARREADY <= \<const0>\;
  S_AXI_CTRL_AWREADY <= \<const0>\;
  S_AXI_CTRL_BRESP(1) <= \<const0>\;
  S_AXI_CTRL_BRESP(0) <= \<const0>\;
  S_AXI_CTRL_BVALID <= \<const0>\;
  S_AXI_CTRL_RDATA(31) <= \<const0>\;
  S_AXI_CTRL_RDATA(30) <= \<const0>\;
  S_AXI_CTRL_RDATA(29) <= \<const0>\;
  S_AXI_CTRL_RDATA(28) <= \<const0>\;
  S_AXI_CTRL_RDATA(27) <= \<const0>\;
  S_AXI_CTRL_RDATA(26) <= \<const0>\;
  S_AXI_CTRL_RDATA(25) <= \<const0>\;
  S_AXI_CTRL_RDATA(24) <= \<const0>\;
  S_AXI_CTRL_RDATA(23) <= \<const0>\;
  S_AXI_CTRL_RDATA(22) <= \<const0>\;
  S_AXI_CTRL_RDATA(21) <= \<const0>\;
  S_AXI_CTRL_RDATA(20) <= \<const0>\;
  S_AXI_CTRL_RDATA(19) <= \<const0>\;
  S_AXI_CTRL_RDATA(18) <= \<const0>\;
  S_AXI_CTRL_RDATA(17) <= \<const0>\;
  S_AXI_CTRL_RDATA(16) <= \<const0>\;
  S_AXI_CTRL_RDATA(15) <= \<const0>\;
  S_AXI_CTRL_RDATA(14) <= \<const0>\;
  S_AXI_CTRL_RDATA(13) <= \<const0>\;
  S_AXI_CTRL_RDATA(12) <= \<const0>\;
  S_AXI_CTRL_RDATA(11) <= \<const0>\;
  S_AXI_CTRL_RDATA(10) <= \<const0>\;
  S_AXI_CTRL_RDATA(9) <= \<const0>\;
  S_AXI_CTRL_RDATA(8) <= \<const0>\;
  S_AXI_CTRL_RDATA(7) <= \<const0>\;
  S_AXI_CTRL_RDATA(6) <= \<const0>\;
  S_AXI_CTRL_RDATA(5) <= \<const0>\;
  S_AXI_CTRL_RDATA(4) <= \<const0>\;
  S_AXI_CTRL_RDATA(3) <= \<const0>\;
  S_AXI_CTRL_RDATA(2) <= \<const0>\;
  S_AXI_CTRL_RDATA(1) <= \<const0>\;
  S_AXI_CTRL_RDATA(0) <= \<const0>\;
  S_AXI_CTRL_RRESP(1) <= \<const0>\;
  S_AXI_CTRL_RRESP(0) <= \<const0>\;
  S_AXI_CTRL_RVALID <= \<const0>\;
  S_AXI_CTRL_WREADY <= \<const0>\;
  Sl1_CE <= \<const0>\;
  Sl1_DBus(0 to 31) <= \^bram_din_a\(0 to 31);
  Sl1_UE <= \<const0>\;
  Sl2_CE <= \<const0>\;
  Sl2_DBus(0) <= \<const0>\;
  Sl2_DBus(1) <= \<const0>\;
  Sl2_DBus(2) <= \<const0>\;
  Sl2_DBus(3) <= \<const0>\;
  Sl2_DBus(4) <= \<const0>\;
  Sl2_DBus(5) <= \<const0>\;
  Sl2_DBus(6) <= \<const0>\;
  Sl2_DBus(7) <= \<const0>\;
  Sl2_DBus(8) <= \<const0>\;
  Sl2_DBus(9) <= \<const0>\;
  Sl2_DBus(10) <= \<const0>\;
  Sl2_DBus(11) <= \<const0>\;
  Sl2_DBus(12) <= \<const0>\;
  Sl2_DBus(13) <= \<const0>\;
  Sl2_DBus(14) <= \<const0>\;
  Sl2_DBus(15) <= \<const0>\;
  Sl2_DBus(16) <= \<const0>\;
  Sl2_DBus(17) <= \<const0>\;
  Sl2_DBus(18) <= \<const0>\;
  Sl2_DBus(19) <= \<const0>\;
  Sl2_DBus(20) <= \<const0>\;
  Sl2_DBus(21) <= \<const0>\;
  Sl2_DBus(22) <= \<const0>\;
  Sl2_DBus(23) <= \<const0>\;
  Sl2_DBus(24) <= \<const0>\;
  Sl2_DBus(25) <= \<const0>\;
  Sl2_DBus(26) <= \<const0>\;
  Sl2_DBus(27) <= \<const0>\;
  Sl2_DBus(28) <= \<const0>\;
  Sl2_DBus(29) <= \<const0>\;
  Sl2_DBus(30) <= \<const0>\;
  Sl2_DBus(31) <= \<const0>\;
  Sl2_Ready <= \<const0>\;
  Sl2_UE <= \<const0>\;
  Sl2_Wait <= \<const0>\;
  Sl3_CE <= \<const0>\;
  Sl3_DBus(0) <= \<const0>\;
  Sl3_DBus(1) <= \<const0>\;
  Sl3_DBus(2) <= \<const0>\;
  Sl3_DBus(3) <= \<const0>\;
  Sl3_DBus(4) <= \<const0>\;
  Sl3_DBus(5) <= \<const0>\;
  Sl3_DBus(6) <= \<const0>\;
  Sl3_DBus(7) <= \<const0>\;
  Sl3_DBus(8) <= \<const0>\;
  Sl3_DBus(9) <= \<const0>\;
  Sl3_DBus(10) <= \<const0>\;
  Sl3_DBus(11) <= \<const0>\;
  Sl3_DBus(12) <= \<const0>\;
  Sl3_DBus(13) <= \<const0>\;
  Sl3_DBus(14) <= \<const0>\;
  Sl3_DBus(15) <= \<const0>\;
  Sl3_DBus(16) <= \<const0>\;
  Sl3_DBus(17) <= \<const0>\;
  Sl3_DBus(18) <= \<const0>\;
  Sl3_DBus(19) <= \<const0>\;
  Sl3_DBus(20) <= \<const0>\;
  Sl3_DBus(21) <= \<const0>\;
  Sl3_DBus(22) <= \<const0>\;
  Sl3_DBus(23) <= \<const0>\;
  Sl3_DBus(24) <= \<const0>\;
  Sl3_DBus(25) <= \<const0>\;
  Sl3_DBus(26) <= \<const0>\;
  Sl3_DBus(27) <= \<const0>\;
  Sl3_DBus(28) <= \<const0>\;
  Sl3_DBus(29) <= \<const0>\;
  Sl3_DBus(30) <= \<const0>\;
  Sl3_DBus(31) <= \<const0>\;
  Sl3_Ready <= \<const0>\;
  Sl3_UE <= \<const0>\;
  Sl3_Wait <= \<const0>\;
  Sl_CE <= \<const0>\;
  Sl_DBus(0 to 31) <= \^bram_din_a\(0 to 31);
  Sl_UE <= \<const0>\;
  Sl_Wait <= \<const0>\;
  UE <= \<const0>\;
  \^bram_din_a\(0 to 31) <= BRAM_Din_A(0 to 31);
  \^lmb_clk\ <= LMB_Clk;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\No_ECC.Sl_Rdy_reg\: unisim.vcomponents.FDRE
     port map (
      C => \^lmb_clk\,
      CE => '1',
      D => lmb_select,
      Q => Sl_Rdy,
      R => LMB_Rst
    );
\No_ECC.lmb_as_reg\: unisim.vcomponents.FDRE
     port map (
      C => \^lmb_clk\,
      CE => '1',
      D => \^bram_en_a\,
      Q => lmb_as,
      R => LMB_Rst
    );
lmb_mux_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_mux
     port map (
      BRAM_Addr_A(0 to 31) => BRAM_Addr_A(0 to 31),
      BRAM_Dout_A(0 to 31) => BRAM_Dout_A(0 to 31),
      BRAM_EN_A => \^bram_en_a\,
      BRAM_WEN_A(0 to 3) => BRAM_WEN_A(0 to 3),
      LMB1_ABus(0 to 31) => LMB1_ABus(0 to 31),
      LMB1_AddrStrobe => LMB1_AddrStrobe,
      LMB1_BE(0 to 3) => LMB1_BE(0 to 3),
      LMB1_WriteDBus(0 to 31) => LMB1_WriteDBus(0 to 31),
      LMB1_WriteStrobe => LMB1_WriteStrobe,
      LMB_ABus(0 to 31) => LMB_ABus(0 to 31),
      LMB_AddrStrobe => LMB_AddrStrobe,
      LMB_BE(0 to 3) => LMB_BE(0 to 3),
      LMB_Clk => \^lmb_clk\,
      LMB_Rst => LMB_Rst,
      LMB_WriteDBus(0 to 31) => LMB_WriteDBus(0 to 31),
      LMB_WriteStrobe => LMB_WriteStrobe,
      Sl1_Ready => Sl1_Ready,
      Sl1_Wait => Sl1_Wait,
      Sl_Rdy => Sl_Rdy,
      Sl_Ready => Sl_Ready,
      lmb_as => lmb_as,
      lmb_select => lmb_select
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    LMB_Clk : in STD_LOGIC;
    LMB_Rst : in STD_LOGIC;
    LMB_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_AddrStrobe : in STD_LOGIC;
    LMB_ReadStrobe : in STD_LOGIC;
    LMB_WriteStrobe : in STD_LOGIC;
    LMB_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl_Ready : out STD_LOGIC;
    Sl_Wait : out STD_LOGIC;
    Sl_UE : out STD_LOGIC;
    Sl_CE : out STD_LOGIC;
    LMB1_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB1_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB1_AddrStrobe : in STD_LOGIC;
    LMB1_ReadStrobe : in STD_LOGIC;
    LMB1_WriteStrobe : in STD_LOGIC;
    LMB1_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl1_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl1_Ready : out STD_LOGIC;
    Sl1_Wait : out STD_LOGIC;
    Sl1_UE : out STD_LOGIC;
    Sl1_CE : out STD_LOGIC;
    BRAM_Rst_A : out STD_LOGIC;
    BRAM_Clk_A : out STD_LOGIC;
    BRAM_Addr_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_EN_A : out STD_LOGIC;
    BRAM_WEN_A : out STD_LOGIC_VECTOR ( 0 to 3 );
    BRAM_Dout_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_Din_A : in STD_LOGIC_VECTOR ( 0 to 31 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "cpu_dlmb_bram_if_cntlr_0,lmb_bram_if_cntlr,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "lmb_bram_if_cntlr,Vivado 2019.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal NLW_U0_CE_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_S_AXI_CTRL_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_S_AXI_CTRL_AWREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_S_AXI_CTRL_BVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_S_AXI_CTRL_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_S_AXI_CTRL_WREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Sl2_CE_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Sl2_Ready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Sl2_UE_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Sl2_Wait_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Sl3_CE_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Sl3_Ready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Sl3_UE_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_Sl3_Wait_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_UE_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_S_AXI_CTRL_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_S_AXI_CTRL_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_S_AXI_CTRL_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_Sl2_DBus_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 31 );
  signal NLW_U0_Sl3_DBus_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 31 );
  attribute C_BASEADDR : string;
  attribute C_BASEADDR of U0 : label is "64'b0000000000000000000000000000000000000000000000000000000000000000";
  attribute C_BRAM_AWIDTH : integer;
  attribute C_BRAM_AWIDTH of U0 : label is 32;
  attribute C_CE_COUNTER_WIDTH : integer;
  attribute C_CE_COUNTER_WIDTH of U0 : label is 0;
  attribute C_CE_FAILING_REGISTERS : integer;
  attribute C_CE_FAILING_REGISTERS of U0 : label is 0;
  attribute C_ECC : integer;
  attribute C_ECC of U0 : label is 0;
  attribute C_ECC_ONOFF_REGISTER : integer;
  attribute C_ECC_ONOFF_REGISTER of U0 : label is 0;
  attribute C_ECC_ONOFF_RESET_VALUE : integer;
  attribute C_ECC_ONOFF_RESET_VALUE of U0 : label is 1;
  attribute C_ECC_STATUS_REGISTERS : integer;
  attribute C_ECC_STATUS_REGISTERS of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_FAULT_INJECT : integer;
  attribute C_FAULT_INJECT of U0 : label is 0;
  attribute C_HIGHADDR : string;
  attribute C_HIGHADDR of U0 : label is "64'b0000000000000000000000000000000000000000000000011111111111111111";
  attribute C_INTERCONNECT : integer;
  attribute C_INTERCONNECT of U0 : label is 0;
  attribute C_LMB_AWIDTH : integer;
  attribute C_LMB_AWIDTH of U0 : label is 32;
  attribute C_LMB_DWIDTH : integer;
  attribute C_LMB_DWIDTH of U0 : label is 32;
  attribute C_LMB_PROTOCOL : integer;
  attribute C_LMB_PROTOCOL of U0 : label is 0;
  attribute C_MASK : string;
  attribute C_MASK of U0 : label is "64'b0000000000000000000000000000000001000000000000000000000000000000";
  attribute C_MASK1 : string;
  attribute C_MASK1 of U0 : label is "64'b0000000000000000000000000000000001000000000000000000000000000000";
  attribute C_MASK2 : string;
  attribute C_MASK2 of U0 : label is "64'b0000000000000000000000000000000000000000100000000000000000000000";
  attribute C_MASK3 : string;
  attribute C_MASK3 of U0 : label is "64'b0000000000000000000000000000000000000000100000000000000000000000";
  attribute C_NUM_LMB : integer;
  attribute C_NUM_LMB of U0 : label is 2;
  attribute C_S_AXI_CTRL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CTRL_ADDR_WIDTH of U0 : label is 32;
  attribute C_S_AXI_CTRL_BASEADDR : string;
  attribute C_S_AXI_CTRL_BASEADDR of U0 : label is "32'b11111111111111111111111111111111";
  attribute C_S_AXI_CTRL_DATA_WIDTH : integer;
  attribute C_S_AXI_CTRL_DATA_WIDTH of U0 : label is 32;
  attribute C_S_AXI_CTRL_HIGHADDR : string;
  attribute C_S_AXI_CTRL_HIGHADDR of U0 : label is "32'b00000000000000000000000000000000";
  attribute C_UE_FAILING_REGISTERS : integer;
  attribute C_UE_FAILING_REGISTERS of U0 : label is 0;
  attribute C_WRITE_ACCESS : integer;
  attribute C_WRITE_ACCESS of U0 : label is 2;
  attribute x_interface_info : string;
  attribute x_interface_info of BRAM_Clk_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT CLK";
  attribute x_interface_info of BRAM_EN_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT EN";
  attribute x_interface_info of BRAM_Rst_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT RST";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of BRAM_Rst_A : signal is "XIL_INTERFACENAME BRAM_PORT, MEM_SIZE 131072, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1";
  attribute x_interface_info of LMB1_AddrStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB1 ADDRSTROBE";
  attribute x_interface_info of LMB1_ReadStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB1 READSTROBE";
  attribute x_interface_info of LMB1_WriteStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB1 WRITESTROBE";
  attribute x_interface_info of LMB_AddrStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB ADDRSTROBE";
  attribute x_interface_info of LMB_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.LMB_Clk CLK";
  attribute x_interface_parameter of LMB_Clk : signal is "XIL_INTERFACENAME CLK.LMB_Clk, ASSOCIATED_BUSIF SLMB:SLMB1:SLMB2:SLMB3, ASSOCIATED_RESET LMB_Rst, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of LMB_ReadStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB READSTROBE";
  attribute x_interface_info of LMB_Rst : signal is "xilinx.com:signal:reset:1.0 RST.LMB_Rst RST";
  attribute x_interface_parameter of LMB_Rst : signal is "XIL_INTERFACENAME RST.LMB_Rst, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT, INSERT_VIP 0";
  attribute x_interface_info of LMB_WriteStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB WRITESTROBE";
  attribute x_interface_info of Sl1_CE : signal is "xilinx.com:interface:lmb:1.0 SLMB1 CE";
  attribute x_interface_info of Sl1_Ready : signal is "xilinx.com:interface:lmb:1.0 SLMB1 READY";
  attribute x_interface_info of Sl1_UE : signal is "xilinx.com:interface:lmb:1.0 SLMB1 UE";
  attribute x_interface_info of Sl1_Wait : signal is "xilinx.com:interface:lmb:1.0 SLMB1 WAIT";
  attribute x_interface_info of Sl_CE : signal is "xilinx.com:interface:lmb:1.0 SLMB CE";
  attribute x_interface_info of Sl_Ready : signal is "xilinx.com:interface:lmb:1.0 SLMB READY";
  attribute x_interface_info of Sl_UE : signal is "xilinx.com:interface:lmb:1.0 SLMB UE";
  attribute x_interface_info of Sl_Wait : signal is "xilinx.com:interface:lmb:1.0 SLMB WAIT";
  attribute x_interface_info of BRAM_Addr_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT ADDR";
  attribute x_interface_info of BRAM_Din_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT DOUT";
  attribute x_interface_info of BRAM_Dout_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT DIN";
  attribute x_interface_info of BRAM_WEN_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT WE";
  attribute x_interface_info of LMB1_ABus : signal is "xilinx.com:interface:lmb:1.0 SLMB1 ABUS";
  attribute x_interface_parameter of LMB1_ABus : signal is "XIL_INTERFACENAME SLMB1, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD";
  attribute x_interface_info of LMB1_BE : signal is "xilinx.com:interface:lmb:1.0 SLMB1 BE";
  attribute x_interface_info of LMB1_WriteDBus : signal is "xilinx.com:interface:lmb:1.0 SLMB1 WRITEDBUS";
  attribute x_interface_info of LMB_ABus : signal is "xilinx.com:interface:lmb:1.0 SLMB ABUS";
  attribute x_interface_parameter of LMB_ABus : signal is "XIL_INTERFACENAME SLMB, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD";
  attribute x_interface_info of LMB_BE : signal is "xilinx.com:interface:lmb:1.0 SLMB BE";
  attribute x_interface_info of LMB_WriteDBus : signal is "xilinx.com:interface:lmb:1.0 SLMB WRITEDBUS";
  attribute x_interface_info of Sl1_DBus : signal is "xilinx.com:interface:lmb:1.0 SLMB1 READDBUS";
  attribute x_interface_info of Sl_DBus : signal is "xilinx.com:interface:lmb:1.0 SLMB READDBUS";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr
     port map (
      BRAM_Addr_A(0 to 31) => BRAM_Addr_A(0 to 31),
      BRAM_Clk_A => BRAM_Clk_A,
      BRAM_Din_A(0 to 31) => BRAM_Din_A(0 to 31),
      BRAM_Dout_A(0 to 31) => BRAM_Dout_A(0 to 31),
      BRAM_EN_A => BRAM_EN_A,
      BRAM_Rst_A => BRAM_Rst_A,
      BRAM_WEN_A(0 to 3) => BRAM_WEN_A(0 to 3),
      CE => NLW_U0_CE_UNCONNECTED,
      Interrupt => NLW_U0_Interrupt_UNCONNECTED,
      LMB1_ABus(0 to 31) => LMB1_ABus(0 to 31),
      LMB1_AddrStrobe => LMB1_AddrStrobe,
      LMB1_BE(0 to 3) => LMB1_BE(0 to 3),
      LMB1_ReadStrobe => LMB1_ReadStrobe,
      LMB1_WriteDBus(0 to 31) => LMB1_WriteDBus(0 to 31),
      LMB1_WriteStrobe => LMB1_WriteStrobe,
      LMB2_ABus(0 to 31) => B"00000000000000000000000000000000",
      LMB2_AddrStrobe => '0',
      LMB2_BE(0 to 3) => B"0000",
      LMB2_ReadStrobe => '0',
      LMB2_WriteDBus(0 to 31) => B"00000000000000000000000000000000",
      LMB2_WriteStrobe => '0',
      LMB3_ABus(0 to 31) => B"00000000000000000000000000000000",
      LMB3_AddrStrobe => '0',
      LMB3_BE(0 to 3) => B"0000",
      LMB3_ReadStrobe => '0',
      LMB3_WriteDBus(0 to 31) => B"00000000000000000000000000000000",
      LMB3_WriteStrobe => '0',
      LMB_ABus(0 to 31) => LMB_ABus(0 to 31),
      LMB_AddrStrobe => LMB_AddrStrobe,
      LMB_BE(0 to 3) => LMB_BE(0 to 3),
      LMB_Clk => LMB_Clk,
      LMB_ReadStrobe => LMB_ReadStrobe,
      LMB_Rst => LMB_Rst,
      LMB_WriteDBus(0 to 31) => LMB_WriteDBus(0 to 31),
      LMB_WriteStrobe => LMB_WriteStrobe,
      S_AXI_CTRL_ACLK => '0',
      S_AXI_CTRL_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_CTRL_ARESETN => '0',
      S_AXI_CTRL_ARREADY => NLW_U0_S_AXI_CTRL_ARREADY_UNCONNECTED,
      S_AXI_CTRL_ARVALID => '0',
      S_AXI_CTRL_AWADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_CTRL_AWREADY => NLW_U0_S_AXI_CTRL_AWREADY_UNCONNECTED,
      S_AXI_CTRL_AWVALID => '0',
      S_AXI_CTRL_BREADY => '0',
      S_AXI_CTRL_BRESP(1 downto 0) => NLW_U0_S_AXI_CTRL_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_CTRL_BVALID => NLW_U0_S_AXI_CTRL_BVALID_UNCONNECTED,
      S_AXI_CTRL_RDATA(31 downto 0) => NLW_U0_S_AXI_CTRL_RDATA_UNCONNECTED(31 downto 0),
      S_AXI_CTRL_RREADY => '0',
      S_AXI_CTRL_RRESP(1 downto 0) => NLW_U0_S_AXI_CTRL_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_CTRL_RVALID => NLW_U0_S_AXI_CTRL_RVALID_UNCONNECTED,
      S_AXI_CTRL_WDATA(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_CTRL_WREADY => NLW_U0_S_AXI_CTRL_WREADY_UNCONNECTED,
      S_AXI_CTRL_WSTRB(3 downto 0) => B"0000",
      S_AXI_CTRL_WVALID => '0',
      Sl1_CE => Sl1_CE,
      Sl1_DBus(0 to 31) => Sl1_DBus(0 to 31),
      Sl1_Ready => Sl1_Ready,
      Sl1_UE => Sl1_UE,
      Sl1_Wait => Sl1_Wait,
      Sl2_CE => NLW_U0_Sl2_CE_UNCONNECTED,
      Sl2_DBus(0 to 31) => NLW_U0_Sl2_DBus_UNCONNECTED(0 to 31),
      Sl2_Ready => NLW_U0_Sl2_Ready_UNCONNECTED,
      Sl2_UE => NLW_U0_Sl2_UE_UNCONNECTED,
      Sl2_Wait => NLW_U0_Sl2_Wait_UNCONNECTED,
      Sl3_CE => NLW_U0_Sl3_CE_UNCONNECTED,
      Sl3_DBus(0 to 31) => NLW_U0_Sl3_DBus_UNCONNECTED(0 to 31),
      Sl3_Ready => NLW_U0_Sl3_Ready_UNCONNECTED,
      Sl3_UE => NLW_U0_Sl3_UE_UNCONNECTED,
      Sl3_Wait => NLW_U0_Sl3_Wait_UNCONNECTED,
      Sl_CE => Sl_CE,
      Sl_DBus(0 to 31) => Sl_DBus(0 to 31),
      Sl_Ready => Sl_Ready,
      Sl_UE => Sl_UE,
      Sl_Wait => Sl_Wait,
      UE => NLW_U0_UE_UNCONNECTED
    );
end STRUCTURE;
