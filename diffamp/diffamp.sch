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
L dk_Linear-Amplifiers-Instrumentation-OP-Amps-Buffer-Amps:LM358P U?
U 1 1 6192BF97
P 5650 3600
F 0 "U?" H 5994 3653 60  0000 L CNN
F 1 "LMX58B_LM2904B" H 5994 3547 60  0000 L CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 5850 3800 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Flm358" H 5850 3900 60  0001 L CNN
F 4 "296-1395-5-ND" H 5850 4000 60  0001 L CNN "Digi-Key_PN"
F 5 "LM358P" H 5850 4100 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 5850 4200 60  0001 L CNN "Category"
F 7 "Linear - Amplifiers - Instrumentation, OP Amps, Buffer Amps" H 5850 4300 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Flm358" H 5850 4400 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/LM358P/296-1395-5-ND/277042" H 5850 4500 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OPAMP GP 2 CIRCUIT 8DIP" H 5850 4600 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 5850 4700 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5850 4800 60  0001 L CNN "Status"
F 13 "X" H 5650 3600 50  0001 C CNN "Spice_Primitive"
F 14 "LMX58B_LM2904B" H 5650 3600 50  0001 C CNN "Spice_Model"
F 15 "Y" H 5650 3600 50  0001 C CNN "Spice_Netlist_Enabled"
F 16 "lmx58b_lm2904b.lib" H 5650 3600 50  0001 C CNN "Spice_Lib_File"
	1    5650 3600
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND?
U 1 1 6192CECE
P 5050 3950
F 0 "#GND?" H 5050 3850 50  0001 C CNN
F 1 "0" H 5050 4039 50  0000 C CNN
F 2 "" H 5050 3950 50  0001 C CNN
F 3 "~" H 5050 3950 50  0001 C CNN
	1    5050 3950
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND?
U 1 1 6192D2C9
P 6050 3950
F 0 "#GND?" H 6050 3850 50  0001 C CNN
F 1 "0" H 6050 4039 50  0000 C CNN
F 2 "" H 6050 3950 50  0001 C CNN
F 3 "~" H 6050 3950 50  0001 C CNN
	1    6050 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3950 5050 3900
Wire Wire Line
	5050 3500 5350 3500
Wire Wire Line
	5350 3700 5050 3700
Connection ~ 5050 3700
Wire Wire Line
	5050 3700 5050 3500
Wire Wire Line
	5950 3600 6050 3600
Wire Wire Line
	6050 3600 6050 3950
Wire Wire Line
	5050 3900 5650 3900
Wire Wire Line
	5650 3900 5650 3800
Connection ~ 5050 3900
Wire Wire Line
	5050 3900 5050 3700
Wire Wire Line
	5650 3400 5650 3300
Wire Wire Line
	5650 3300 5050 3300
Wire Wire Line
	5050 3300 5050 3500
Connection ~ 5050 3500
$EndSCHEMATC
