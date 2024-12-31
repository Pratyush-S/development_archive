-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Fri Dec 27 01:25:19 2024
-- Host        : lappy running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/EclypseZ7/vivado24port/uart2_2019_1/uart2_2019_1.gen/sources_1/bd/design_2/ip/design_2_c_counter_binary_0_0/design_2_c_counter_binary_0_0_stub.vhdl
-- Design      : design_2_c_counter_binary_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_2_c_counter_binary_0_0 is
  Port ( 
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end design_2_c_counter_binary_0_0;

architecture stub of design_2_c_counter_binary_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,Q[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_counter_binary_v12_0_19,Vivado 2024.1";
begin
end;
