-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Mon Dec 16 01:08:39 2024
-- Host        : lappy running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/EclypseZ7/EZ7/uart2_2019_1/uart2_2019_1.gen/sources_1/bd/design_1/ip/design_1_Data_generator_0_0/design_1_Data_generator_0_0_stub.vhdl
-- Design      : design_1_Data_generator_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_Data_generator_0_0 is
  Port ( 
    tready : in STD_LOGIC;
    clk_in : in STD_LOGIC;
    tvalid : out STD_LOGIC;
    data_o : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end design_1_Data_generator_0_0;

architecture stub of design_1_Data_generator_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "tready,clk_in,tvalid,data_o[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "Data_generator,Vivado 2024.1";
begin
end;
