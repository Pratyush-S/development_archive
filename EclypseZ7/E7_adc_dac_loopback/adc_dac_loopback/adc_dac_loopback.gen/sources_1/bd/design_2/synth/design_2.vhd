--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Fri Dec 27 01:23:23 2024
--Host        : lappy running 64-bit major release  (build 9200)
--Command     : generate_target design_2.bd
--Design      : design_2
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_2 is
  port (
    sys_clock : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_2 : entity is "design_2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_2,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_2 : entity is "design_2.hwdef";
end design_2;

architecture STRUCTURE of design_2 is
  component design_2_ila_0_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_2_ila_0_0;
  component design_2_c_counter_binary_0_0 is
  port (
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_2_c_counter_binary_0_0;
  component design_2_clk_wiz_0_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC
  );
  end component design_2_clk_wiz_0_0;
  signal c_counter_binary_0_Q : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal clk_in_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal util_ds_buf_0_BUFG_O : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_2_clk_in, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  clk_in_1(0) <= sys_clock(0);
c_counter_binary_0: component design_2_c_counter_binary_0_0
     port map (
      CLK => util_ds_buf_0_BUFG_O,
      Q(15 downto 0) => c_counter_binary_0_Q(15 downto 0)
    );
clk_wiz_0: component design_2_clk_wiz_0_0
     port map (
      clk_in1 => clk_in_1(0),
      clk_out1 => clk_wiz_0_clk_out1,
      clk_out2 => util_ds_buf_0_BUFG_O
    );
ila_0: component design_2_ila_0_0
     port map (
      clk => clk_wiz_0_clk_out1,
      probe0(15 downto 0) => c_counter_binary_0_Q(15 downto 0)
    );
end STRUCTURE;
