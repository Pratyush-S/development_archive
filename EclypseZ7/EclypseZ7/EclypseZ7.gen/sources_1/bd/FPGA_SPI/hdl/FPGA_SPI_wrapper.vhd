--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Sun Mar 23 22:00:49 2025
--Host        : lappy running 64-bit major release  (build 9200)
--Command     : generate_target FPGA_SPI_wrapper.bd
--Design      : FPGA_SPI_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FPGA_SPI_wrapper is
  port (
    bit_out : out STD_LOGIC;
    clk : in STD_LOGIC
  );
end FPGA_SPI_wrapper;

architecture STRUCTURE of FPGA_SPI_wrapper is
  component FPGA_SPI is
  port (
    clk : in STD_LOGIC;
    bit_out : out STD_LOGIC
  );
  end component FPGA_SPI;
begin
FPGA_SPI_i: component FPGA_SPI
     port map (
      bit_out => bit_out,
      clk => clk
    );
end STRUCTURE;
