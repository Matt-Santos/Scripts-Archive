EESchema Schematic File Version 4
LIBS:Main-cache
EELAYER 26 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6500 7100 0    118  ~ 0
Main Project
$Sheet
S 2450 1250 800  800 
U 5A451F81
F0 "HF_VCO" 39
F1 "LMX2582_VCO.sch" 39
F2 "Vcc" I L 2450 1350 39 
F3 "RFoutAP" I R 3250 1400 39 
F4 "RFoutAM" I R 3250 1450 39 
F5 "OSCinP" I L 2450 1650 39 
F6 "OSCinM" I L 2450 1700 39 
F7 "RFoutBP" I R 3250 1800 39 
F8 "RFoutBM" I R 3250 1850 39 
F9 "Vtune" I L 2450 1500 39 
F10 "SCK" I L 2450 1800 39 
F11 "SDI" I L 2450 1850 39 
F12 "MUXout" I L 2450 1950 39 
F13 "ChipEnable" I L 2450 1400 39 
F14 "CSB" I L 2450 1900 39 
$EndSheet
Wire Wire Line
	4950 1650 5900 1650
Wire Wire Line
	3300 1650 3750 1650
$Comp
L conn:Conn_Coaxial J?
U 1 1 5A45F60F
P 9700 1650
F 0 "J?" H 9799 1626 50  0000 L CNN
F 1 "Antenna_Connector" H 9799 1535 50  0000 L CNN
F 2 "" H 9700 1650 50  0001 C CNN
F 3 "" H 9700 1650 50  0001 C CNN
	1    9700 1650
	1    0    0    -1  
$EndComp
$Sheet
S 3800 1250 900  800 
U 5A45FD1A
F0 "HF_AMP_GEN" 39
F1 "HF_AMP_GEN.sch" 39
$EndSheet
$Sheet
S 5950 1250 850  800 
U 5A45FEB7
F0 "HF_PSplitter" 39
F1 "HF_PSplitter.sch" 39
$EndSheet
$Sheet
S 3850 6600 1250 1150
U 5A4600F8
F0 "POWER_DIST" 39
F1 "POWER_DIST.sch" 39
F2 "PWR_GND" I R 5100 7050 118
F3 "PWR_VCC" I R 5100 6850 118
F4 "RF_GND" I R 5100 7400 118
$EndSheet
$Sheet
S 7700 2550 1150 800 
U 5A4607E2
F0 "HF_AMP_LOW_NOISE" 39
F1 "HF_AMP_LOW_NOISE.sch" 39
$EndSheet
$Sheet
S 5950 2500 1100 900 
U 5A46175B
F0 "HF_MIXER" 39
F1 "HF_MIXER.sch" 39
$EndSheet
$Sheet
S 3850 2500 900  850 
U 5A461AC7
F0 "HF_AMP_MIX" 39
F1 "HF_AMP_MIX.sch" 39
$EndSheet
$Sheet
S 2450 2500 950  850 
U 5A461C68
F0 "MIX_FILTER" 39
F1 "MIX_FILTER.sch" 39
$EndSheet
$Sheet
S 1600 4250 2200 2000
U 5A46213D
F0 "MPU" 39
F1 "MPU.sch" 39
$EndSheet
$Comp
L conn:Conn_Coaxial J?
U 1 1 5A45EAE5
P 9700 2800
F 0 "J?" H 9799 2776 50  0000 L CNN
F 1 "Antenna_Connector" H 9799 2685 50  0000 L CNN
F 2 "" H 9700 2800 50  0001 C CNN
F 3 "" H 9700 2800 50  0001 C CNN
	1    9700 2800
	1    0    0    -1  
$EndComp
Text Notes 4950 950  0    118  ~ 0
Note: Circulator is out, to restricting on the bandwidth
$Sheet
S 6650 4500 1750 1500
U 5A4D485A
F0 "IMU" 39
F1 "IMU.sch" 39
$EndSheet
$EndSCHEMATC
