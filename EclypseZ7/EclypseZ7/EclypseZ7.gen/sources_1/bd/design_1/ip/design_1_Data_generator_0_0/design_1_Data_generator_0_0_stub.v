// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Dec 16 01:08:39 2024
// Host        : lappy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/EclypseZ7/EZ7/uart2_2019_1/uart2_2019_1.gen/sources_1/bd/design_1/ip/design_1_Data_generator_0_0/design_1_Data_generator_0_0_stub.v
// Design      : design_1_Data_generator_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "Data_generator,Vivado 2024.1" *)
module design_1_Data_generator_0_0(tready, clk_in, tvalid, data_o)
/* synthesis syn_black_box black_box_pad_pin="tready,tvalid,data_o[31:0]" */
/* synthesis syn_force_seq_prim="clk_in" */;
  input tready;
  input clk_in /* synthesis syn_isclock = 1 */;
  output tvalid;
  output [31:0]data_o;
endmodule
