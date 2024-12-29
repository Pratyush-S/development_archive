// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Dec 16 01:08:39 2024
// Host        : lappy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/EclypseZ7/EZ7/uart2_2019_1/uart2_2019_1.gen/sources_1/bd/design_1/ip/design_1_Data_generator_0_0/design_1_Data_generator_0_0_sim_netlist.v
// Design      : design_1_Data_generator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_Data_generator_0_0,Data_generator,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "Data_generator,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module design_1_Data_generator_0_0
   (tready,
    clk_in,
    tvalid,
    data_o);
  (* x_interface_info = "xilinx.com:interface:axis:1.0 interface_axis TREADY" *) (* x_interface_parameter = "XIL_INTERFACENAME interface_axis, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input tready;
  input clk_in;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 interface_axis TVALID" *) output tvalid;
  output [31:0]data_o;

  wire \<const0> ;
  wire clk_in;
  wire [31:1]\^data_o ;
  wire tready;
  wire tvalid;

  assign data_o[31:1] = \^data_o [31:1];
  assign data_o[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_Data_generator_0_0_Data_generator U0
       (.clk_in(clk_in),
        .data_o(\^data_o ),
        .tready(tready),
        .tvalid(tvalid));
endmodule

(* ORIG_REF_NAME = "Data_generator" *) 
module design_1_Data_generator_0_0_Data_generator
   (data_o,
    tvalid,
    tready,
    clk_in);
  output [30:0]data_o;
  output tvalid;
  input tready;
  input clk_in;

  wire clk_in;
  wire counter;
  wire counter0_carry__0_i_1_n_0;
  wire counter0_carry__0_i_2_n_0;
  wire counter0_carry__0_i_3_n_0;
  wire counter0_carry__0_i_4_n_0;
  wire counter0_carry__0_i_5_n_0;
  wire counter0_carry__0_i_6_n_0;
  wire counter0_carry__0_i_7_n_0;
  wire counter0_carry__0_i_8_n_0;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire counter0_carry__1_i_1_n_0;
  wire counter0_carry__1_i_2_n_0;
  wire counter0_carry__1_i_3_n_0;
  wire counter0_carry__1_i_4_n_0;
  wire counter0_carry__1_i_5_n_0;
  wire counter0_carry__1_i_6_n_0;
  wire counter0_carry__1_i_7_n_0;
  wire counter0_carry__1_i_8_n_0;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry__2_i_1_n_0;
  wire counter0_carry__2_i_2_n_0;
  wire counter0_carry__2_i_3_n_0;
  wire counter0_carry__2_i_4_n_0;
  wire counter0_carry__2_i_5_n_0;
  wire counter0_carry__2_i_6_n_0;
  wire counter0_carry__2_n_1;
  wire counter0_carry__2_n_2;
  wire counter0_carry__2_n_3;
  wire counter0_carry_i_1_n_0;
  wire counter0_carry_i_2_n_0;
  wire counter0_carry_i_3_n_0;
  wire counter0_carry_i_4_n_0;
  wire counter0_carry_i_5_n_0;
  wire counter0_carry_i_6_n_0;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire \counter[4]_i_2_n_0 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_0 ;
  wire \counter_reg[24]_i_1_n_1 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_4 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[28]_i_1_n_0 ;
  wire \counter_reg[28]_i_1_n_1 ;
  wire \counter_reg[28]_i_1_n_2 ;
  wire \counter_reg[28]_i_1_n_3 ;
  wire \counter_reg[28]_i_1_n_4 ;
  wire \counter_reg[28]_i_1_n_5 ;
  wire \counter_reg[28]_i_1_n_6 ;
  wire \counter_reg[28]_i_1_n_7 ;
  wire \counter_reg[31]_i_2_n_2 ;
  wire \counter_reg[31]_i_2_n_3 ;
  wire \counter_reg[31]_i_2_n_5 ;
  wire \counter_reg[31]_i_2_n_6 ;
  wire \counter_reg[31]_i_2_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire [30:0]data_o;
  wire tready;
  wire tvalid;
  wire [3:0]NLW_counter0_carry_O_UNCONNECTED;
  wire [3:0]NLW_counter0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_counter0_carry__1_O_UNCONNECTED;
  wire [3:3]NLW_counter0_carry__2_CO_UNCONNECTED;
  wire [3:0]NLW_counter0_carry__2_O_UNCONNECTED;
  wire [3:2]\NLW_counter_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[31]_i_2_O_UNCONNECTED ;

  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(data_o[0]),
        .DI({1'b0,1'b0,counter0_carry_i_1_n_0,counter0_carry_i_2_n_0}),
        .O(NLW_counter0_carry_O_UNCONNECTED[3:0]),
        .S({counter0_carry_i_3_n_0,counter0_carry_i_4_n_0,counter0_carry_i_5_n_0,counter0_carry_i_6_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({counter0_carry__0_i_1_n_0,counter0_carry__0_i_2_n_0,counter0_carry__0_i_3_n_0,counter0_carry__0_i_4_n_0}),
        .O(NLW_counter0_carry__0_O_UNCONNECTED[3:0]),
        .S({counter0_carry__0_i_5_n_0,counter0_carry__0_i_6_n_0,counter0_carry__0_i_7_n_0,counter0_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__0_i_1
       (.I0(data_o[15]),
        .I1(data_o[16]),
        .O(counter0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__0_i_2
       (.I0(data_o[13]),
        .I1(data_o[14]),
        .O(counter0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__0_i_3
       (.I0(data_o[11]),
        .I1(data_o[12]),
        .O(counter0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__0_i_4
       (.I0(data_o[9]),
        .I1(data_o[10]),
        .O(counter0_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__0_i_5
       (.I0(data_o[15]),
        .I1(data_o[16]),
        .O(counter0_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__0_i_6
       (.I0(data_o[13]),
        .I1(data_o[14]),
        .O(counter0_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__0_i_7
       (.I0(data_o[11]),
        .I1(data_o[12]),
        .O(counter0_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__0_i_8
       (.I0(data_o[9]),
        .I1(data_o[10]),
        .O(counter0_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({counter0_carry__1_i_1_n_0,counter0_carry__1_i_2_n_0,counter0_carry__1_i_3_n_0,counter0_carry__1_i_4_n_0}),
        .O(NLW_counter0_carry__1_O_UNCONNECTED[3:0]),
        .S({counter0_carry__1_i_5_n_0,counter0_carry__1_i_6_n_0,counter0_carry__1_i_7_n_0,counter0_carry__1_i_8_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__1_i_1
       (.I0(data_o[23]),
        .I1(data_o[24]),
        .O(counter0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__1_i_2
       (.I0(data_o[21]),
        .I1(data_o[22]),
        .O(counter0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__1_i_3
       (.I0(data_o[19]),
        .I1(data_o[20]),
        .O(counter0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__1_i_4
       (.I0(data_o[17]),
        .I1(data_o[18]),
        .O(counter0_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__1_i_5
       (.I0(data_o[23]),
        .I1(data_o[24]),
        .O(counter0_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__1_i_6
       (.I0(data_o[21]),
        .I1(data_o[22]),
        .O(counter0_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__1_i_7
       (.I0(data_o[19]),
        .I1(data_o[20]),
        .O(counter0_carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__1_i_8
       (.I0(data_o[17]),
        .I1(data_o[18]),
        .O(counter0_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO({NLW_counter0_carry__2_CO_UNCONNECTED[3],counter0_carry__2_n_1,counter0_carry__2_n_2,counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,counter0_carry__2_i_1_n_0,counter0_carry__2_i_2_n_0,counter0_carry__2_i_3_n_0}),
        .O(NLW_counter0_carry__2_O_UNCONNECTED[3:0]),
        .S({1'b0,counter0_carry__2_i_4_n_0,counter0_carry__2_i_5_n_0,counter0_carry__2_i_6_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    counter0_carry__2_i_1
       (.I0(data_o[29]),
        .I1(data_o[30]),
        .O(counter0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__2_i_2
       (.I0(data_o[27]),
        .I1(data_o[28]),
        .O(counter0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__2_i_3
       (.I0(data_o[25]),
        .I1(data_o[26]),
        .O(counter0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__2_i_4
       (.I0(data_o[29]),
        .I1(data_o[30]),
        .O(counter0_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__2_i_5
       (.I0(data_o[27]),
        .I1(data_o[28]),
        .O(counter0_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__2_i_6
       (.I0(data_o[25]),
        .I1(data_o[26]),
        .O(counter0_carry__2_i_6_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    counter0_carry_i_1
       (.I0(data_o[3]),
        .I1(data_o[4]),
        .O(counter0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    counter0_carry_i_2
       (.I0(data_o[1]),
        .I1(data_o[2]),
        .O(counter0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    counter0_carry_i_3
       (.I0(data_o[7]),
        .I1(data_o[8]),
        .O(counter0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    counter0_carry_i_4
       (.I0(data_o[5]),
        .I1(data_o[6]),
        .O(counter0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    counter0_carry_i_5
       (.I0(data_o[4]),
        .I1(data_o[3]),
        .O(counter0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    counter0_carry_i_6
       (.I0(data_o[2]),
        .I1(data_o[1]),
        .O(counter0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \counter[31]_i_1 
       (.I0(tready),
        .I1(counter0_carry__2_n_1),
        .O(counter));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[4]_i_2 
       (.I0(data_o[0]),
        .O(\counter[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(data_o[9]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(data_o[10]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(data_o[11]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(data_o[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(data_o[12]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(data_o[13]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(data_o[14]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(data_o[15]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(data_o[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(data_o[16]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(data_o[17]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(data_o[18]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(data_o[0]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(data_o[19]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(data_o[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(data_o[20]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[22] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(data_o[21]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[23] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(data_o[22]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[24] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(data_o[23]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\counter_reg[24]_i_1_n_0 ,\counter_reg[24]_i_1_n_1 ,\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[24]_i_1_n_4 ,\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S(data_o[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[25] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[28]_i_1_n_7 ),
        .Q(data_o[24]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[26] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[28]_i_1_n_6 ),
        .Q(data_o[25]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[27] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[28]_i_1_n_5 ),
        .Q(data_o[26]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[28] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[28]_i_1_n_4 ),
        .Q(data_o[27]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[28]_i_1 
       (.CI(\counter_reg[24]_i_1_n_0 ),
        .CO({\counter_reg[28]_i_1_n_0 ,\counter_reg[28]_i_1_n_1 ,\counter_reg[28]_i_1_n_2 ,\counter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[28]_i_1_n_4 ,\counter_reg[28]_i_1_n_5 ,\counter_reg[28]_i_1_n_6 ,\counter_reg[28]_i_1_n_7 }),
        .S(data_o[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[29] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[31]_i_2_n_7 ),
        .Q(data_o[28]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(data_o[1]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[30] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[31]_i_2_n_6 ),
        .Q(data_o[29]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[31] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[31]_i_2_n_5 ),
        .Q(data_o[30]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[31]_i_2 
       (.CI(\counter_reg[28]_i_1_n_0 ),
        .CO({\NLW_counter_reg[31]_i_2_CO_UNCONNECTED [3:2],\counter_reg[31]_i_2_n_2 ,\counter_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[31]_i_2_O_UNCONNECTED [3],\counter_reg[31]_i_2_n_5 ,\counter_reg[31]_i_2_n_6 ,\counter_reg[31]_i_2_n_7 }),
        .S({1'b0,data_o[30:28]}));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(data_o[2]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(data_o[3]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S({data_o[3:1],\counter[4]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(data_o[4]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(data_o[5]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(data_o[6]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(data_o[7]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(data_o[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_in),
        .CE(tready),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(data_o[8]),
        .R(counter));
  FDRE tvalid_reg
       (.C(clk_in),
        .CE(1'b1),
        .D(tready),
        .Q(tvalid),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
