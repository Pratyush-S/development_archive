--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Sun Mar 23 22:00:49 2025
--Host        : lappy running 64-bit major release  (build 9200)
--Command     : generate_target FPGA_SPI.bd
--Design      : FPGA_SPI
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FPGA_SPI is
  port (
    bit_out : out STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of FPGA_SPI : entity is "FPGA_SPI,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=FPGA_SPI,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=None}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of FPGA_SPI : entity is "FPGA_SPI.hwdef";
end FPGA_SPI;

architecture STRUCTURE of FPGA_SPI is
  component FPGA_SPI_VHDL_SPI_MASTER_0_0 is
  port (
    clk : in STD_LOGIC;
    bit_out : out STD_LOGIC
  );
  end component FPGA_SPI_VHDL_SPI_MASTER_0_0;
  signal VHDL_SPI_MASTER_0_bit_out : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN FPGA_SPI_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  bit_out <= VHDL_SPI_MASTER_0_bit_out;
  clk_1 <= clk;
VHDL_SPI_MASTER_0: component FPGA_SPI_VHDL_SPI_MASTER_0_0
     port map (
      bit_out => VHDL_SPI_MASTER_0_bit_out,
      clk => clk_1
    );
end STRUCTURE;
