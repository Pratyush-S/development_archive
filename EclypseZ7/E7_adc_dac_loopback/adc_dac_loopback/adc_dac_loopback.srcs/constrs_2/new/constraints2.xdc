# 125MHz Clock from Ethernet PHY
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { sys_clock }]; #IO_L12P_T1_MRCC Sch=sysclk
##create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { sys_clock }];
