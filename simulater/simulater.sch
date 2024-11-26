EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:L L1
U 1 1 60C8EDAB
P 5300 3300
F 0 "L1" V 5490 3300 50  0000 C CNN
F 1 "10u" V 5399 3300 50  0000 C CNN
F 2 "" H 5300 3300 50  0001 C CNN
F 3 "~" H 5300 3300 50  0001 C CNN
	1    5300 3300
	0    -1   -1   0   
$EndComp
$Comp
L pspice:VSOURCE V1
U 1 1 60C90253
P 7850 3700
F 0 "V1" H 8078 3746 50  0000 L CNN
F 1 "VSOURCE" H 8078 3655 50  0000 L CNN
F 2 "" H 7850 3700 50  0001 C CNN
F 3 "~" H 7850 3700 50  0001 C CNN
F 4 "V" H 7850 3700 50  0001 C CNN "Spice_Primitive"
F 5 "dc 24 pulse(0 24 0 0 0 25u 50u)" H 7850 3700 50  0001 C CNN "Spice_Model"
F 6 "Y" H 7850 3700 50  0001 C CNN "Spice_Netlist_Enabled"
	1    7850 3700
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND01
U 1 1 60C90F7D
P 7650 4200
F 0 "#GND01" H 7650 4100 50  0001 C CNN
F 1 "0" H 7650 4289 50  0000 C CNN
F 2 "" H 7650 4200 50  0001 C CNN
F 3 "~" H 7650 4200 50  0001 C CNN
	1    7650 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 60C915CB
P 7850 4150
F 0 "#PWR01" H 7850 3900 50  0001 C CNN
F 1 "GND" H 7855 3977 50  0000 C CNN
F 2 "" H 7850 4150 50  0001 C CNN
F 3 "" H 7850 4150 50  0001 C CNN
	1    7850 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4150 7850 4100
Wire Wire Line
	7850 4100 7650 4100
Wire Wire Line
	7650 4100 7650 4200
Connection ~ 7850 4100
Wire Wire Line
	7850 4100 7850 4000
$Comp
L Device:R R1
U 1 1 60C96D3A
P 4850 3300
F 0 "R1" V 4643 3300 50  0000 C CNN
F 1 "1" V 4734 3300 50  0000 C CNN
F 2 "" V 4780 3300 50  0001 C CNN
F 3 "~" H 4850 3300 50  0001 C CNN
	1    4850 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 3300 5150 3300
$Comp
L Transistor_FET:BSC047N08NS3G Q2
U 1 1 60CAAA04
P 3800 3650
F 0 "Q2" H 4004 3696 50  0000 L CNN
F 1 "BSC047N08NS" H 4004 3605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TDSON-8-1" H 4000 3575 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BSC047N08NS3G-DS-v02_07-en.pdf?fileId=db3a30431add1d95011ae7e8dacf5611" V 3800 3650 50  0001 L CNN
F 4 "X" H 3800 3650 50  0001 C CNN "Spice_Primitive"
F 5 "BSC047N08NS3" H 3800 3650 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3800 3650 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "models/OptiMOS3/OptiMOS3_80V.lib" H 3800 3650 50  0001 C CNN "Spice_Lib_File"
	1    3800 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 60CD7263
P 3900 4000
F 0 "#PWR07" H 3900 3750 50  0001 C CNN
F 1 "GND" H 3905 3827 50  0000 C CNN
F 2 "" H 3900 4000 50  0001 C CNN
F 3 "" H 3900 4000 50  0001 C CNN
	1    3900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4000 3900 3900
$Comp
L pspice:VSOURCE V2
U 1 1 60CD8581
P 1250 3700
F 0 "V2" H 1478 3746 50  0000 L CNN
F 1 "VSOURCE" H 1478 3655 50  0000 L CNN
F 2 "" H 1250 3700 50  0001 C CNN
F 3 "~" H 1250 3700 50  0001 C CNN
F 4 "V" H 1250 3700 50  0001 C CNN "Spice_Primitive"
F 5 "dc 24" H 1250 3700 50  0001 C CNN "Spice_Model"
F 6 "Y" H 1250 3700 50  0001 C CNN "Spice_Netlist_Enabled"
	1    1250 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 60CDBA5E
P 1250 4200
F 0 "#PWR05" H 1250 3950 50  0001 C CNN
F 1 "GND" H 1255 4027 50  0000 C CNN
F 2 "" H 1250 4200 50  0001 C CNN
F 3 "" H 1250 4200 50  0001 C CNN
	1    1250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 4200 1250 4000
$Comp
L power:+24V #PWR04
U 1 1 60CE074F
P 1250 3150
F 0 "#PWR04" H 1250 3000 50  0001 C CNN
F 1 "+24V" H 1265 3323 50  0000 C CNN
F 2 "" H 1250 3150 50  0001 C CNN
F 3 "" H 1250 3150 50  0001 C CNN
	1    1250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3150 1250 3400
$Comp
L power:+24V #PWR06
U 1 1 60CE25A4
P 3900 2150
F 0 "#PWR06" H 3900 2000 50  0001 C CNN
F 1 "+24V" H 3915 2323 50  0000 C CNN
F 2 "" H 3900 2150 50  0001 C CNN
F 3 "" H 3900 2150 50  0001 C CNN
	1    3900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3450 3900 3300
$Comp
L Transistor_FET:BSC047N08NS3G Q3
U 1 1 60CA0D6F
P 6450 2850
F 0 "Q3" H 6654 2896 50  0000 L CNN
F 1 "BSC047N08NS" H 6654 2805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TDSON-8-1" H 6650 2775 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BSC047N08NS3G-DS-v02_07-en.pdf?fileId=db3a30431add1d95011ae7e8dacf5611" V 6450 2850 50  0001 L CNN
F 4 "X" H 6450 2850 50  0001 C CNN "Spice_Primitive"
F 5 "BSC047N08NS3" H 6450 2850 50  0001 C CNN "Spice_Model"
F 6 "Y" H 6450 2850 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "models/OptiMOS3/OptiMOS3_80V.lib" H 6450 2850 50  0001 C CNN "Spice_Lib_File"
	1    6450 2850
	-1   0    0    -1  
$EndComp
Connection ~ 3900 3300
Wire Wire Line
	3900 3050 3900 3300
$Comp
L power:GND #PWR03
U 1 1 60DEBC44
P 3600 3100
F 0 "#PWR03" H 3600 2850 50  0001 C CNN
F 1 "GND" H 3605 2927 50  0000 C CNN
F 2 "" H 3600 3100 50  0001 C CNN
F 3 "" H 3600 3100 50  0001 C CNN
	1    3600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3100 3600 2850
$Comp
L power:+24V #PWR08
U 1 1 60E35A77
P 6350 2100
F 0 "#PWR08" H 6350 1950 50  0001 C CNN
F 1 "+24V" H 6365 2273 50  0000 C CNN
F 2 "" H 6350 2100 50  0001 C CNN
F 3 "" H 6350 2100 50  0001 C CNN
	1    6350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3050 6350 3300
$Comp
L power:GND #PWR09
U 1 1 60E37D61
P 6350 4000
F 0 "#PWR09" H 6350 3750 50  0001 C CNN
F 1 "GND" H 6355 3827 50  0000 C CNN
F 2 "" H 6350 4000 50  0001 C CNN
F 3 "" H 6350 4000 50  0001 C CNN
	1    6350 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4000 6350 3950
Connection ~ 6350 3300
Wire Wire Line
	6350 3300 6350 3500
$Comp
L power:GND #PWR010
U 1 1 60E3BE65
P 6650 3900
F 0 "#PWR010" H 6650 3650 50  0001 C CNN
F 1 "GND" H 6655 3727 50  0000 C CNN
F 2 "" H 6650 3900 50  0001 C CNN
F 3 "" H 6650 3900 50  0001 C CNN
	1    6650 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3900 6650 3700
Wire Wire Line
	3900 2150 3900 2350
$Comp
L Device:C C1
U 1 1 60E59B43
P 2600 2750
F 0 "C1" H 2715 2796 50  0000 L CNN
F 1 "4.7u" H 2715 2705 50  0000 L CNN
F 2 "" H 2638 2600 50  0001 C CNN
F 3 "~" H 2600 2750 50  0001 C CNN
	1    2600 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 60E5C374
P 2600 3100
F 0 "#PWR02" H 2600 2850 50  0001 C CNN
F 1 "GND" H 2605 2927 50  0000 C CNN
F 2 "" H 2600 3100 50  0001 C CNN
F 3 "" H 2600 3100 50  0001 C CNN
	1    2600 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 60E5D978
P 8650 2350
F 0 "#PWR011" H 8650 2100 50  0001 C CNN
F 1 "GND" H 8655 2177 50  0000 C CNN
F 2 "" H 8650 2350 50  0001 C CNN
F 3 "" H 8650 2350 50  0001 C CNN
	1    8650 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2150 8650 2300
Wire Wire Line
	2600 3100 2600 2900
Wire Wire Line
	2600 2600 2600 2350
Wire Wire Line
	8650 1850 8650 1650
Connection ~ 3900 2350
Wire Wire Line
	3900 2350 3900 2650
Wire Wire Line
	8550 2200 9150 2200
Wire Wire Line
	3900 3300 4250 3300
Wire Wire Line
	2600 2350 3900 2350
Wire Wire Line
	3100 3650 3100 4650
Wire Wire Line
	9150 4000 9150 2200
Connection ~ 9150 2200
Wire Wire Line
	9150 2200 9750 2200
Wire Wire Line
	6350 2100 6350 2350
Wire Wire Line
	8650 1650 9100 1650
Wire Wire Line
	9100 1650 9100 2300
Wire Wire Line
	9100 2300 8650 2300
Connection ~ 8650 1650
Wire Wire Line
	8650 1650 8650 1600
Connection ~ 8650 2300
Wire Wire Line
	8650 2300 8650 2350
Wire Wire Line
	3900 3900 4250 3900
Wire Wire Line
	4250 3900 4250 3800
Connection ~ 3900 3900
Wire Wire Line
	3900 3900 3900 3850
Wire Wire Line
	4250 3500 4250 3300
Connection ~ 4250 3300
Wire Wire Line
	4250 3050 4250 3300
Wire Wire Line
	4250 2750 4250 2350
Wire Wire Line
	4250 2350 3900 2350
Wire Wire Line
	6350 3950 5950 3950
Wire Wire Line
	5950 3950 5950 3850
Connection ~ 6350 3950
Wire Wire Line
	6350 3950 6350 3900
Wire Wire Line
	5950 3550 5950 3300
Connection ~ 5950 3300
Wire Wire Line
	5950 3300 6350 3300
Wire Wire Line
	5950 3300 5950 3050
Wire Wire Line
	5950 2750 5950 2350
Wire Wire Line
	5950 2350 6350 2350
Connection ~ 6350 2350
Wire Wire Line
	6350 2350 6350 2650
$Comp
L Diode:1N4002 D1
U 1 1 60ED3FBE
P 4250 2900
F 0 "D1" V 4204 2980 50  0000 L CNN
F 1 "1N4002LR" V 4295 2980 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 4250 2725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4250 2900 50  0001 C CNN
F 4 "D" H 4250 2900 50  0001 C CNN "Spice_Primitive"
F 5 "1n4002rl" H 4250 2900 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4250 2900 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "models/1N4002RL.SP3" H 4250 2900 50  0001 C CNN "Spice_Lib_File"
	1    4250 2900
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4002 D2
U 1 1 60EE15A8
P 4250 3650
F 0 "D2" V 4204 3730 50  0000 L CNN
F 1 "1N4002LR" V 4295 3730 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 4250 3475 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4250 3650 50  0001 C CNN
F 4 "D" H 4250 3650 50  0001 C CNN "Spice_Primitive"
F 5 "1n4002rl" H 4250 3650 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4250 3650 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "models/1N4002RL.SP3" H 4250 3650 50  0001 C CNN "Spice_Lib_File"
	1    4250 3650
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4002 D4
U 1 1 60EE3007
P 5950 3700
F 0 "D4" V 5904 3780 50  0000 L CNN
F 1 "1N4002LR" V 5995 3780 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5950 3525 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5950 3700 50  0001 C CNN
F 4 "D" H 5950 3700 50  0001 C CNN "Spice_Primitive"
F 5 "1n4002rl" H 5950 3700 50  0001 C CNN "Spice_Model"
F 6 "Y" H 5950 3700 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "models/1N4002RL.SP3" H 5950 3700 50  0001 C CNN "Spice_Lib_File"
	1    5950 3700
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4002 D3
U 1 1 60EE4920
P 5950 2900
F 0 "D3" V 5904 2980 50  0000 L CNN
F 1 "1N4002LR" V 5995 2980 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5950 2725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5950 2900 50  0001 C CNN
F 4 "D" H 5950 2900 50  0001 C CNN "Spice_Primitive"
F 5 "1n4002rl" H 5950 2900 50  0001 C CNN "Spice_Model"
F 6 "Y" H 5950 2900 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "models/1N4002RL.SP3" H 5950 2900 50  0001 C CNN "Spice_Lib_File"
	1    5950 2900
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:BSC047N08NS3G Q1
U 1 1 60EFDFB3
P 3800 2850
F 0 "Q1" H 4004 2896 50  0000 L CNN
F 1 "BSC047N08NS" H 4004 2805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TDSON-8-1" H 4000 2775 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BSC047N08NS3G-DS-v02_07-en.pdf?fileId=db3a30431add1d95011ae7e8dacf5611" V 3800 2850 50  0001 L CNN
F 4 "X" H 3800 2850 50  0001 C CNN "Spice_Primitive"
F 5 "BSC047N08NS3" H 3800 2850 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3800 2850 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "models/OptiMOS3/OptiMOS3_80V.lib" H 3800 2850 50  0001 C CNN "Spice_Lib_File"
	1    3800 2850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSC047N08NS3G Q4
U 1 1 60F1C6BC
P 6450 3700
F 0 "Q4" H 6654 3746 50  0000 L CNN
F 1 "BSC047N08NS" H 6654 3655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TDSON-8-1" H 6650 3625 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BSC047N08NS3G-DS-v02_07-en.pdf?fileId=db3a30431add1d95011ae7e8dacf5611" V 6450 3700 50  0001 L CNN
F 4 "X" H 6450 3700 50  0001 C CNN "Spice_Primitive"
F 5 "BSC047N08NS3" H 6450 3700 50  0001 C CNN "Spice_Model"
F 6 "Y" H 6450 3700 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "models/OptiMOS3/OptiMOS3_80V.lib" H 6450 3700 50  0001 C CNN "Spice_Lib_File"
	1    6450 3700
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60F24326
P 3350 3650
F 0 "R2" V 3143 3650 50  0000 C CNN
F 1 "10" V 3234 3650 50  0000 C CNN
F 2 "" V 3280 3650 50  0001 C CNN
F 3 "~" H 3350 3650 50  0001 C CNN
	1    3350 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 3650 3500 3650
Wire Wire Line
	3200 3650 3100 3650
$Comp
L Device:R R3
U 1 1 60F4086E
P 6950 2850
F 0 "R3" V 6743 2850 50  0000 C CNN
F 1 "10" V 6834 2850 50  0000 C CNN
F 2 "" V 6880 2850 50  0001 C CNN
F 3 "~" H 6950 2850 50  0001 C CNN
	1    6950 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	6800 2850 6650 2850
Wire Wire Line
	3100 4650 7250 4650
Wire Wire Line
	7850 2850 7850 3400
Wire Wire Line
	7100 2850 7250 2850
Wire Wire Line
	7250 4650 7250 2850
Connection ~ 7250 2850
Wire Wire Line
	7250 2850 7850 2850
Wire Wire Line
	4250 3300 4700 3300
Wire Wire Line
	5450 3300 5950 3300
$Comp
L Device:C C2
U 1 1 60E5AD6B
P 8650 2000
F 0 "C2" H 8765 2046 50  0000 L CNN
F 1 "4.7u" H 8765 1955 50  0000 L CNN
F 2 "" H 8688 1850 50  0001 C CNN
F 3 "~" H 8650 2000 50  0001 C CNN
	1    8650 2000
	1    0    0    -1  
$EndComp
$EndSCHEMATC