create_clock -name clk_50MHz -period 20.00 [get_ports clk_50MHz] 

set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports clk_50MHz]

set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports { dac_LRCK }]; #IO_L21N_T3_DQS_A18_15 Sch=ja[2]

set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports { dac_SCLK }]; #IO_L21P_T3_DQS_15 Sch=ja[3]

set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { dac_SDIN }]; #IO_L18N_T2_A23_15 Sch=ja[4]

set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports { dac_MCLK }]; #IO_L20N_T3_A19_15 Sch=ja[1]

set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { bt_square }]; #IO_L4N_T0_D05_14 Sch=btnu

set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { sw0 }];
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { sw1 }];
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports { sw2 }];
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports { sw3 }];
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { sw4 }];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports { sw5 }];
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { sw6 }];
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports { sw7 }];