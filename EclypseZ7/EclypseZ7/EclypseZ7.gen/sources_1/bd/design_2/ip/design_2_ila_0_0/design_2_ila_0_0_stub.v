// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Fri Dec 27 00:47:44 2024
// Host        : lappy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/EclypseZ7/vivado24port/uart2_2019_1/uart2_2019_1.gen/sources_1/bd/design_2/ip/design_2_ila_0_0/design_2_ila_0_0_stub.v
// Design      : design_2_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2024.1" *)
module design_2_ila_0_0(clk, probe0)
/* synthesis syn_black_box black_box_pad_pin="probe0[15:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input [15:0]probe0;
endmodule
