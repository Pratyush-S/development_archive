# 125MHz Clock from Ethernet PHY
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { sys_clock }]; #IO_L12P_T1_MRCC Sch=sysclk
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { sys_clock }];

# Syzygy Port A
set_property IOSTANDARD DIFF_SSTL18_I [get_ports -filter { name =~ adcClkIn* }]
set_property -dict { PACKAGE_PIN N20  } [get_ports { adcClkIn_n_0 }]; #IO_L14N_T2_SRCC Sch=syzygy_a_c2p_clk_n
set_property -dict { PACKAGE_PIN N19  } [get_ports { adcClkIn_p_0 }]; #IO_L14P_T2_SRCC Sch=syzygy_a_c2p_clk_p
set_property SLEW SLOW [get_ports -filter { name =~ adcClkIn* }]

set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS18 } [get_ports { sCh1CouplingL_0 }]; #IO_L21N_T3_DQS Sch=syzygy_a_d_n[0]
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS18 } [get_ports { sCh1CouplingH_0 }]; #IO_L21P_T3_DQS Sch=syzygy_a_d_p[0]
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS18 } [get_ports { sCh2CouplingL_0 }]; #IO_L22N_T3 Sch=syzygy_a_d_n[1]
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS18 } [get_ports { sCh2CouplingH_0 }]; #IO_L22P_T3 Sch=syzygy_a_d_p[1]
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS18 } [get_ports { sCh2GainL_0 }]; #IO_L20N_T3 Sch=syzygy_a_d_n[3]
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS18 } [get_ports { sCh2GainH_0 }]; #IO_L20P_T3 Sch=syzygy_a_d_p[3]
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS18 } [get_ports { sCh1GainL_0 }]; #IO_L19N_T3_VREF Sch=syzygy_a_d_n[5]
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS18 } [get_ports { sCh1GainH_0 }]; #IO_L19P_T3 Sch=syzygy_a_d_p[5]
set_property -dict { PACKAGE_PIN K21   IOSTANDARD LVCMOS18 } [get_ports { sRelayComL_0 }]; #IO_L9N_T1_DQS Sch=syzygy_a_d_n[7]
set_property -dict { PACKAGE_PIN J20   IOSTANDARD LVCMOS18 } [get_ports { sRelayComH_0 }]; #IO_L9P_T1_DQS Sch=syzygy_a_d_p[7]

set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS18 } [get_ports { sADC_Sclk_0 }]; #IO_L23N_T3 Sch=syzygy_a_d_n[2]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS18 } [get_ports { sADC_SDIO_0 }]; #IO_L23P_T3 Sch=syzygy_a_d_p[2]
set_property -dict { PACKAGE_PIN M21   IOSTANDARD LVCMOS18 } [get_ports { sADC_CS_0 }]; #IO_L15P_T2_DQS Sch=syzygy_a_s[26]

set_property -dict { PACKAGE_PIN M22  } [get_ports { adcSync_0 }]; #IO_L15N_T2_DQS Sch=syzygy_a_s[27]
set_property IOSTANDARD LVCMOS18 [get_ports -filter { name =~ adcSync* }]
set_property DRIVE 4 [get_ports -filter { name =~ adcSync* }]
set_property SLEW SLOW [get_ports -filter { name =~ adcSync* }]

set_property -dict { PACKAGE_PIN M19  } [get_ports { DcoClk_0 }]; #IO_L13P_T2_MRCC Sch=syzygy_a_p2c_clk_p
set_property IOSTANDARD LVCMOS18 [get_ports -filter { name =~ DcoClk* }]

set_property -dict { PACKAGE_PIN N22   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[0] }]; #IO_L16P_T2 Sch=syzygy_a_s[24]
set_property -dict { PACKAGE_PIN L21   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[1] }]; #IO_L10P_T1 Sch=syzygy_a_s[22]
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[2] }]; #IO_L24N_T3 Sch=syzygy_a_d_n[4]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[3] }]; #IO_L7P_T1 Sch=syzygy_a_d_p[6]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[4] }]; #IO_L7N_T1 Sch=syzygy_a_d_n[6]
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[5] }]; #IO_L12N_T1_MRCC Sch=syzygy_a_s[16]
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[6] }]; #IO_L12P_T1_MRCC Sch=syzygy_a_s[18]
set_property -dict { PACKAGE_PIN L22   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[7] }]; #IO_L10N_T1 Sch=syzygy_a_s[20]
set_property -dict { PACKAGE_PIN K20   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[8] }]; #IO_L11N_T1_SRCC Sch=syzygy_a_s[17]
set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[9] }]; #IO_L24P_T3 Sch=syzygy_a_d_p[4]
set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[10] }]; #IO_L11P_T1_SRCC Sch=syzygy_a_s[19]
set_property -dict { PACKAGE_PIN J22   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[11] }]; #IO_L8N_T1 Sch=syzygy_a_s[21]
set_property -dict { PACKAGE_PIN J21   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[12] }]; #IO_L8P_T1 Sch=syzygy_a_s[23]
set_property -dict { PACKAGE_PIN P22   IOSTANDARD LVCMOS18 } [get_ports { dADC_Data_0[13] }]; #IO_L16N_T2 Sch=syzygy_a_s[25]

#set_property -dict { PACKAGE_PIN M20  } [get_ports { syzygy_a_p2c_clk_n }]; #IO_L13N_T2_MRCC Sch=syzygy_a_p2c_clk_n

create_clock -period 10.000 -name DcoClk_0 -waveform {0.000 5.000} [get_ports DcoClk_0]
create_generated_clock -name adcClkIn_p_0 -source [get_pins design_1_i/ZmodADC1410_Controll_0/U0/InstADC_ClkODDR/C] -divide_by 1 [get_ports adcClkIn_p_0]

set_input_delay -clock [get_clocks DcoClk_0] -clock_fall -min -add_delay 3.240 [get_ports {dADC_Data_0[*]}]
set_input_delay -clock [get_clocks DcoClk_0] -clock_fall -max -add_delay 5.440 [get_ports {dADC_Data_0[*]}]
set_input_delay -clock [get_clocks DcoClk_0] -min -add_delay 3.240 [get_ports {dADC_Data_0[*]}]
set_input_delay -clock [get_clocks DcoClk_0] -max -add_delay 5.440 [get_ports {dADC_Data_0[*]}]

# Syzygy Port B
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[0] }]; #IO_L11P_T1_SRCC Sch=syzygy_b_s[19]
set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[1] }]; #IO_L12P_T1_MRCC Sch=syzygy_b_s[18]
set_property -dict { PACKAGE_PIN AB22  IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[2] }]; #IO_L7N_T1 Sch=syzygy_b_d_n[6]
set_property -dict { PACKAGE_PIN AB20  IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[3] }]; #IO_L10N_T1 Sch=syzygy_b_s[20]
set_property -dict { PACKAGE_PIN AA18  IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[4] }]; #IO_L12N_T1_MRCC Sch=syzygy_b_s[16]
set_property -dict { PACKAGE_PIN AA19  IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[5] }]; #IO_L11N_T1_SRCC Sch=syzygy_b_s[17]
set_property -dict { PACKAGE_PIN Y21   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[6] }]; #IO_L9N_T1_DQS Sch=syzygy_b_d_n[7]
set_property -dict { PACKAGE_PIN Y20   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[7] }]; #IO_L9P_T1_DQS Sch=syzygy_b_d_p[7]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[8] }]; #IO_L19N_T3_VREF Sch=syzygy_b_d_n[5]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[9] }]; #IO_L19P_T3 Sch=syzygy_b_d_p[5]
set_property -dict { PACKAGE_PIN AB15  IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[10] }]; #IO_L24N_T3 Sch=syzygy_b_d_n[3]
set_property -dict { PACKAGE_PIN AB14  IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[11] }]; #IO_L24P_T3 Sch=syzygy_b_d_p[3]
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[12] }]; #IO_L20N_T3 Sch=syzygy_b_d_n[1]
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Data_0[13] }]; #IO_L20P_T3 Sch=syzygy_b_d_p[1]

set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Clkin_0 }]; #IO_L14P_T2_SRCC Sch=syzygy_b_c2p_clk_p
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS18 } [get_ports { sDAC_ClkIO_0 }]; #IO_L13P_T2_MRCC Sch=syzygy_b_p2c_clk_p

set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS18 } [get_ports { sDAC_SDIO_0 }]; #IO_L22P_T3 Sch=syzygy_b_d_p[4]
set_property DRIVE 4 [get_ports sDAC_SDIO_0]
set_property -dict { PACKAGE_PIN AA14  IOSTANDARD LVCMOS18 } [get_ports { sDAC_CS_0 }]; #IO_L22N_T3 Sch=syzygy_b_d_n[4]
set_property DRIVE 4 [get_ports sDAC_CS_0]
set_property -dict { PACKAGE_PIN AA13  IOSTANDARD LVCMOS18 } [get_ports { sDAC_SCLK_0 }]; #IO_L23N_T3 Sch=syzygy_b_d_n[2]
set_property DRIVE 4 [get_ports sDAC_SCLK_0]

set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS18 } [get_ports { sDAC_SetFS1_0 }]; #IO_L21P_T3_DQS Sch=syzygy_b_d_p[0]
set_property -dict { PACKAGE_PIN Y15   IOSTANDARD LVCMOS18 } [get_ports { sDAC_SetFS2_0 }]; #IO_L21N_T3_DQS Sch=syzygy_b_d_n[0]
set_property -dict { PACKAGE_PIN Y13   IOSTANDARD LVCMOS18 } [get_ports { sDAC_Reset_0 }]; #IO_L23P_T3 Sch=syzygy_b_d_p[2]
set_property -dict { PACKAGE_PIN AA22  IOSTANDARD LVCMOS18 } [get_ports { sDAC_EnOut_0 }]; #IO_L7P_T1 Sch=syzygy_b_d_p[6]

create_generated_clock -name sDAC_Clkin_0 -source [get_pins design_1_i/ZmodDAC1411_Controll_0/U0/InstDAC_ClkinODDR/C] -divide_by 1 [get_ports sDAC_Clkin_0]
create_generated_clock -name sDAC_ClkIO_0 -source [get_pins design_1_i/ZmodDAC1411_Controll_0/U0/InstDAC_ClkIO_ODDR/C] -divide_by 1 [get_ports sDAC_ClkIO_0]

set_output_delay -clock [get_clocks sDAC_Clkin_0] -clock_fall -min -add_delay -0.100 [get_ports {sDAC_Data_0[*]}] 
set_output_delay -clock [get_clocks sDAC_Clkin_0] -clock_fall -max -add_delay 0.250 [get_ports {sDAC_Data_0[*]}]  
set_output_delay -clock [get_clocks sDAC_Clkin_0] -min -add_delay -0.100 [get_ports {sDAC_Data_0[*]}]           
set_output_delay -clock [get_clocks sDAC_Clkin_0] -max -add_delay 0.150 [get_ports {sDAC_Data_0[*]}]


set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets design_1_i/Pl_to_BRAM_0/trigger_out]
