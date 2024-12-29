--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Fri Dec 27 01:23:23 2024
--Host        : lappy running 64-bit major release  (build 9200)
--Command     : generate_target design_2_wrapper.bd
--Design      : design_2_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_2_wrapper is
  port (
    sys_clock : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end design_2_wrapper;

architecture STRUCTURE of design_2_wrapper is
  component design_2 is
  port (
    sys_clock : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_2;
begin
design_2_i: component design_2
     port map (
      sys_clock(0) => sys_clock(0)
    );
end STRUCTURE;
