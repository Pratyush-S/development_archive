connect -url tcp:127.0.0.1:3121
source X:/FPGA/EZ7/uart2_2019_1/uart2_2019_1.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {jtag_cable_name =~ "Digilent Eclypse Z7 210393AD769EA" && level==0} -index 1
fpga -file X:/FPGA/EZ7/uart2_2019_1/uart2_2019_1.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Eclypse Z7 210393AD769EA"} -index 0
loadhw -hw X:/FPGA/EZ7/uart2_2019_1/uart2_2019_1.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Eclypse Z7 210393AD769EA"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Eclypse Z7 210393AD769EA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Eclypse Z7 210393AD769EA"} -index 0
dow X:/FPGA/EZ7/uart2_2019_1/uart2_2019_1.sdk/app/Debug/app.elf
configparams force-mem-access 0
bpadd -addr &main
