// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Fri Dec 27 01:25:19 2024
// Host        : lappy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/EclypseZ7/vivado24port/uart2_2019_1/uart2_2019_1.gen/sources_1/bd/design_2/ip/design_2_c_counter_binary_0_0/design_2_c_counter_binary_0_0_sim_netlist.v
// Design      : design_2_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_2_c_counter_binary_0_0,c_counter_binary_v12_0_19,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_19,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module design_2_c_counter_binary_0_0
   (CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 16}" *) output [15:0]Q;

  wire CLK;
  wire [15:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  design_2_c_counter_binary_0_0_c_counter_binary_v12_0_19 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
P2zhX82uyBEVdF5BF2rjoPUFIfjipNZhYEpATLKcgiS9EGXt6qBbOMX2jVOCy0XDwb5TVkE1nG7X
XhCGxKErRU9jPoY7WV0pdI1wIayHDc8Rs74bj3N0mzWMplnVCaSPbBpIC4LYfqpVTVio67s5iy3E
w6sva82hbE3cZ5p/rRc=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ATCqDjeJlE3rd1lUTRMTvM13wZLySdeY6qhbV5igkPcemUzykIjBbnJsu6APb1ENNlZoK/EbAyI9
qN25AMJVtn283z16KSVpxvftA/Tl0lUlk9wO55eVk5wKgvB1cSVywiEOogV7vDrt3hiX35a7Svds
AV9xqvsQsA2wV5gXrBdHbfVk5TrReH9zaojTNW8dt8mGUB8+yv1X/gfGVT6v6NabkmJviHj8hTNq
FZ4N5hZKo50t+Imqbe2o6y27+dlrdck69OyARANqpqF01fu72w0QZAXYJ90ATJRH7ABM8M/5UFse
AEFeVYp2M818KdaSVTFsSByUaYJXCdkuxJUM9g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
bRU/WKwbjvfClA011r3CVZ1YUizTPsik1AOc+TikBCWuqg1UqofZgbFuqULMNnL7MXEAzuP+FXgr
VqVrQpu/CGGtKAfHwc3t//w4acyK5GTpXOAI1wgkigzOEm4yg4vKgPNXC610E4aKK/j4dyuUaDR1
zB3hAaf2q33Sz5IQmPU=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UgFJO2X6yZZkXNbvv3vUKymwKnlqFgpA384zFnWoT6HXDt6Iq088pkqIqpin5DhL9xB5RsuqnKGH
1cx2mxvmAsdXtgJcifR+VLXpF/l1p5GswXHVa4EQ6SpNznBhHxXh/Z9Ppb8M8EQqocBwed2dOc74
dmBWx9KElaVqaqF+H801o3N9wlIvJOZpHMW5CxuAyPwCfPAbDwyafCK4aBeFM+ZP8YarLD35U5vZ
yL6YRHcKJPlLPF3red34Gw4W7ZstV3K2TPyMWkr2qc9QYj2Nf5ftVZYbLPxBYVTro7Nl4lCUIPES
ONu8dF9MdgfLI7lT8lq/l1iUAez7879SWhtp9Q==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OoYBKlg7sap/0EsIV1swjKUenTJcWreOpMa9MzKYwYAEYCCz7DjDVq3RT5kxtS2wTNfmLZaVB7+V
uu2GdOTjOmSwdY+FFt1h2XrOK1cMm13IZY5/pVznUrUKKHHf2GDT40ita0dwLiINXv4HdgC5bVhM
hiksIRqpsQ0LG7i/2cWLxEgYFJA859AGtE1Upcm+6jxP2EenOxQZu0UcDGCOlP6CXggaDD2i7Yw/
0RihXovM0AoqZA/zgFW+PCpMoOAAj62HZgpnF2hDwVgnLZ3WbYh345T8hrtoAqb3t4WxmEjDCp2R
KPYZYBvaMaBaiHE5iBvQjrpmfI8dJWe4J40jYw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Gx4eTayjueg5J6NG9oGeMhEPuV5NeFJH2DVuyrKF9JKQx8buMiHh8wVPYUoOwMilvyPOIXUcaBQ9
FpU4pPlYa1vZpL5ngIpVugCvQfAtzCuNESRWvRmPubvd01w8PHV+Q2LaWQeFcoLTzFMTFN03aPM7
5TZfp+L/ooPM84memH86HsypSrgkza6VSz0/Z5Ns5oJ8nV3MLuoNQOLd8IMxuOqKGSLzb1ZQdrLu
iFCyMbQwcldt68vGW2EkN98CUyQK8qXwgMJVMuCaP9/oILpn1rBbN2eEh/tmpgtPeoSvA0cUldNF
IcGb+KNtMVKLWHv0efcrV5ldY6MEfo4g4qBbIA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VFXYmS0ReAB+6/UTbJULVtr1PCaPeCYPVAdUlGeIdUeW9/+rumdhhwgNy2VoKVQC2S8vLxoX2B9l
jgRTQcufyHScGKTHNl3RWvyypLEIoJcoasZWqHzS0ydGSUwa5HoDqsm+gTKcN8Lea4jRdUehj9eR
l7Gx/X2DwwAiIlLjg+4EMv7Irp43V7CNXGFNAfsC1np22kZo7+UqOLYq9zlFKzLw0a6zw4zKDPJi
44kLvxg5Z74zzhtrEENnmXju1z+tlpjS+Qm5AM3C5o3FPYq+hsvO4JH7uDBYjZxw++NDivipcqj2
R7zMiRKY45jyIxh8orFhpXM8HHcVfl7ZnzIXEQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
dOa3TgVfay2fU+u/a/KY/hvZhMg1HC8R8B0CPA+YkM9Sh4VIBOmEl0slV3txZIIjIVmwQqUyQFPR
c9L3JWfFo5uo7SHI/NYzEw5kVOhP9C64NJfcAWneItu6ZpFBpsCQoOA13wA9LRKxOl6QXt4qhQeJ
btAg9fTKOapaMMuzEfTwJY9of0XC5QiXH0vtBSIsNkgldU/qdMeCckChCdbv0YDeJ96FpJEeEo2A
Z0Tjo7OVc0akihtesCKsdWotZLDWBCy/WC3/0jVxCfLD8WPFJZch41aZ382qdLlx/+be6K9JCpBQ
Zcrz/qJep1crHZewcLRZubaOPXx3IVElwjS4xkQbMPjoU2iSo9sCLGK+tj7D0rKUcjijLHHZ7LyM
ZaqVzGGBFYaPkwOWkJneOrMGDhv6ToIuNZvp9CR7oTPOOujHtoM+WzKK0KYToAdZuC3wMbxHQpM+
FAOSJ85yT4fOkvO051b247di0eZ2+bcVc4x1/G5rY7mjl5T4uoWiRK8f

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZckpUFeVVx9iLDnjGxdD/gZkKrAvyHBZklEmeoQIleh9f6KZXrh23OJR3urQB0LqWf7FGxDR05oT
nGlPYV0u9NJ/f8Iw5mJlq9ll0GmDLqJKUrv73p286GQmWMf5vnV/NejEqQtGxgTqjGjePbhx/a7W
p0JDEhrOFhBR3oaSLrGIFV4TJNWcy9+KwpNXpqudxr/77gX0WTvdox9kM8x9lUMVpSxtaQTyLJxy
v+mraCjTm92jcPvWO1wG3miaHlrg4ZVsvfSkHMz3c6ZgQMHm/vmrRILcxDEjG8XF7Q8PqIFXxBP8
iVQaTS4/i5ThaA3fitsBdX9SBjhH3/j9vb+qAQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sMq7mC29pD/8oTEvyIFQnG4QbCbHnJa0f/5p35ZaRrQlBXntpBsE2KeOjpPSle/BxexnCoyRhE5z
R8eqlJqd0mdDRLFPcafFa4Yogwl5gpS7tNTA1L2oQU7VTd8hTFm1JcFYOc5WCWaaGH6zCBtODfbZ
MRz4C3OpfQO06AaMhw2kLwwb6BLavcxqXUPk7eHPpZzx9t7TiiCVp/anVnXXee9RTqXEjNNnTMJg
H9bUbdN2of38ywrNWhixjSD1fcoSxTN3MI1jc0e8azTDkk58AFOQjkw6g5twk6WXHJw5N4n/3n9n
+19olFZFgOpFry/mkncJUL7rLTclI7ksIId1iQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YcaJzOMzgMwFRwFA53PoKcbgXwEj3na64lw8rbkPIEr1iki1eHcr/DTK8IzFAhMgViOyQ1laYJS3
7Jg7Ot7tTfaQXJBT1yEhRofeI2udj29HEVHyYvhLPIjmNhLRbxls35EmRG6NAWYm+7IoPIri0ymQ
g/83PIyew58zRsKE2yP84d8u5LaiFmjGN97a5/wHwkpuIoHueT/ZCBRT/6BeV9pIb4vN8hM261mU
eOVSjWajLoCUbVcmKnhc2UV684b9ifyKGrXJQ7htRlnkjG1JRuLUr2RNOlTqgp0nEbAsmtUrbbcs
wJQSVrUy/jCYbQn9YY9MNDE/b8U/DNhtoPWVCQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2416)
`pragma protect data_block
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
ltradLcVs7E6UEk85h5bBgSeTsebxQ==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
j+cisgNr51kboBzSEDMqVtItc+GjGUiMNF0E04YxNeYXTtpqczXoHl7p3pBX3lPxGHPUBdZ6oYbA
uFzQSoAOvv3ANxN24NJ35g39Gushnh3bAhkIaggJwqirNk8uvbFei0Q37GZcy7DTONZHx9iSsnwg
43qcv84+v1Oqg1QlkK0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LvmfIuwVQiUSvu/SWE90Ii3gBrSlLLUK62Pe9Uo5lexkMeDgQfulU0pV4/6bexfxf29XSUIZb3c9
av2fcRcp1ZeyqEnW0ei/HP4UoYfgCSzAUmuehTopxqUP3M4kX2/ETc0gdNuIi6qDHquW7YY9QQGa
g5MTm81zI19+yvQdowrY7g+W1mLrHRcb8Ho+qe0uZMYO9K9DLpwNlhtSf0qufVmJGM+5COEyqb1U
lL+nfwveqOc0IWRRpPS42kC7OR6BTARi5c6dKCQl/a9fojTU0hW9itdcCGK5DL1CuzhnLB3Cw1Lc
UIHvmiN+LslcbwXadjp0wvd8yuh6HziY0Vfxsw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sxpYAYC9AO3d/Qq5Dz0dcOejYw99+MiH0W395D6tyIroWG9T14T6E7ryw+s/by4tx97NytW6qUN3
NXZVsmgnxSKTeXfcn+ZXRsWNPcQGtCaIdh8TbBiHtUeZecWXJ0/iGORapfLQxNbHmGtiSkN1eYCn
C7QZMw6qZPNfuNyivRg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E/GNyTiOpevKZa3+bbpJb0kDvoBk/eMnN/JT+ul7JFDogMwn8CpOobzq4ORZE40PqtaeX8shZ2Io
cJi8jjFyYeWd2nZtLZo0heKqX3v/pdf8QoQbxat3X7qE+EWjBbCn/ZFGg9zTrFFxwaHk42COVzlL
0j+PRabCWynZ5ILjyTP47frcmCN/iRKt0d+pvi/GA4UjFDtb6+9p1niifgkhCn1MkMBg8U/Y5knN
CVQ7z+g5SrUo/3bEiUXLkpBhMSliuE96gVp/dhIEh9H7jm8yTGyk0JzdtVTLaZLa+Lip0djJZLpb
UppZLdmVomSIk5FAqXrXZx6cyoWBJHtDlyJZkA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hg0hZUmrq09eMOjEntvd+gf7Zd2U4BwDY1Jz7gQri0LZtchGB8Z8SRY7YjUyWlUFux+gzbhxtgxE
uXob+ZiD1GlC8r4A2zRmOzuSIMz5UnEhy5TMjR+8A23FUgB5H14Nk+8/ui0Zs/CqU3Odf3BBWOAg
zxnOh70mcUhtPTAIZ+EcN+1Ujtdp78bNTd2IQJcFIhDRt35kHTIgOpo8oDPU8cUgKH6HYVq0sF+B
1yu+k9PCMZikA3k51SJhEW/Qc39FpYPT9CKN0WwelzSM6CD2GrcLMAt1oh2PsLi9Pfz1zzfj+mED
XS3V2CvLYBAA5I2Zn5G1DKrCLW1s3QCGdjLFcQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZihOD8xT0OXV+vYQgVKC2OgNYw1KaLnWHAc+JKheEAvf+yg1M7C7urUi93p572HyJs7Y4xmmO7jH
ND7Tv3yag5/ovBwWsoZpyr5RiGqozyxd59WCmh1IY/4VIOP7O8XrKDP4OGGR4Yrc69eGX7icFD/q
q1Yri9lFsLwghmgnG5/5LI0ZMQuooogdTmG+J2E0ZDBWfT/UmG0W92Ul8I3gfcKlKOiouwG5y4Jp
nBDOfD0ITqlCH9MMIsDa+elFeLXvv2KVvemlQ6QmFkF7trsIsF7QEhsAEKVsCYQTNVAGTL0GQsfh
sg3wRbAMH9DIJaQxk+17Z2Yacz0Veyzzwk9ehw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HY3h60x+HFg/eOgHTI4UVm9DtPW6wqUKca7u8NGVkEwgcMgpHEWwLglcdrxdQNjcwm8OHot4ETKF
WKbgVoX+iDWvtyepO4qxoxeWXH2F1fmkO5TcCS5lfsbj510UC680iv6lj8Cyu8iiRTaXR/o4FoM0
fC0fK1I3vPhOTQ5CR3OgRKAFDdX+d/qZ444LSpBM+tvjaaKR1BRRMkaGxO58SlkZRhBySU0nhAQy
dLhrkimMDrmmj/sej98ps6eMFspr8+5pUYJg+vWp++Sm0zHT5N6L1+n+oCGTjgEAgNvxvIgPv6O6
O614qs4bb0unrlrWFTLtb8eoiQe9RHpwGopwlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
UwlS0UvncccxxkW4NnEPYSb0LG5K+diX5o0hrXyga8q/gD9ab0W8hccMe2HgIOrJ0coq4cXubRll
ZpfwAORkvZtLjLAkjJkvmwum68290Kk65/t/Zns9LY543if5KVhDzDg632T/2/g+S4iACupycWXY
cZ6s39/F2p//kX1YHKh6qPf3qkoP25aHoXQhlWkBAIGe3uIyPYPXstbeMaMeWMmKTh0rnBbtpr8y
0Qg1S5j9DIzW9sNl57338zbHnQbUbJzw5eAHPIYReJLbGLoFizMzbCeVUf9qQcME/zhozlHMqIYN
Mafo4cDvvsMIs8ppl+EWkfmPwMyBiDor8XdnJwhL6PXvmC52OK25D9SarDCqe+sqUKRPLYOzZm9s
mRp4pTSLWqKlA4Kmt9Om1GAjesqP6fBmfP1NGnjIrnslWz4gi45DlpUHMRKmIlfMjMLoDcxkJyie
bdt0EiJv3tUHW+hzM1osET2y5r7UP2tXX1I0KcbPrsM8mAjAbCi8yC8b

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
X0dvE3L7dLQCMLonwloQgw5itpWmwVthmLjXvNCwkkUnrWRnIFGWcVV+7J059QS+MH4TlngLY35K
jozGLlOeR74+bBTejoxLYWg2EOfziRkOnWV2uSeOTEyEL+LD9sSATD6G+de3w3tolkltsugp6Asm
4+ouB1syLSHEJDe3i6xdrhgn2gjStQgaIBrGx67K6P9M/ZpIE3tJpGwQpXAQW6mcrqXnyP8s9OOR
lKGNPgaQFWDxxHZY806A4MaHpWk9o7ni2o+CNUO1IEpPDpNcX5kMGjPY2d5U2F21JssOrE9gdyeA
WYmROE1TZ0h61Y5QNSuC42zh2bxl5RnU9Yw9kA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oIVzpSluI7daBxkOk2gHCozBGlbxG53WoEhOzUaurQiUeJP9/arWOJWk+fvz3PNZhGKqhMT34Elf
4CE16vrKhBto+aiBjmbTGqgpcZuAov0ThKrdb5D2RErj9L03MzOMQdBEb2OGyWHIaVcOR12TL/Pc
ppZorRLXpXsMO6OiQvQgS6gBpPLmoJ/4mFQU2y7Gq4fQ1w0mBb5WD4aOFS27kco9sWZg134eJyHh
g3WophY4AK3S6VNrjwfZ8V2EHcWlysmTyQhS/i6nISRdlQIyBBenPXI1qC3X2elRwJJ1rDBw4tSk
FPpZVv+Pg6wD1lxgePFMJlGymPGte/sHafK1og==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
flfR64NYycLIyauxCLn1wC38i1K4/yOEiIIS/pzPw5b4T8AQasCEhfXccXWd7XYD8tVTgjkiZlil
BY/FskgSGdAPW60ru4A65EEa7ULY+aPS1CSMAW6nANPgjVXgGu5AsFKiDjSfY+ibvvFHUmJ8Zmez
wEdjdaf1uPn8gwW70f2+rXV6O5zQnCdBG+tQ5cUZMYqSxcdKZEcd7uFDN1+GqykP0vqNVRZMAmZE
umrRSJg1a1YyLdwwKiD+UbAJWJ0KQNS+4RQTCOHtz8/EK1t1YnoCf5KBTTe57whtj0S+rfOK5HaB
upEqngWyR+h+SKSvfYHRQkIHJPKSCB9buGG6MQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10400)
`pragma protect data_block
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
9RbCJ+8bYxr2fzl0HEcOJbUB8fBKRO9N5/Q=
`pragma protect end_protected
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
