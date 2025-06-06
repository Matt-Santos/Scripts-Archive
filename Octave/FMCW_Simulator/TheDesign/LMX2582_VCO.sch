EESchema Schematic File Version 4
LIBS:Main-cache
EELAYER 26 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 5850 3450
NoConn ~ 5850 3650
NoConn ~ 3700 3850
NoConn ~ 5150 2800
$Comp
L device:C C16
U 1 1 5A432B0E
P 5050 2550
F 0 "C16" H 5050 2650 50  0000 L CNN
F 1 "10u" H 5000 2450 50  0000 L CNN
F 2 "Footprint:C0805C106K9PACTU" H 5088 2400 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 5050 2550 50  0001 C CNN
F 4 "C0805C106K9PACTU" H 5050 2550 50  0001 C CNN "manf#"
	1    5050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4050 4550 4050
Wire Wire Line
	4550 4050 4550 3550
Wire Wire Line
	4550 3550 4250 3550
Wire Wire Line
	5050 2350 5050 2400
Wire Wire Line
	4750 2350 4750 2400
Wire Wire Line
	4350 2800 4350 2750
Wire Wire Line
	4450 2750 4450 2800
$Comp
L device:C C11
U 1 1 5A433EE6
P 4550 2550
F 0 "C11" H 4550 2650 50  0000 L CNN
F 1 "1u" H 4500 2450 50  0000 L CNN
F 2 "Footprint:C0603C105K8PACTU" H 4588 2400 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 4550 2550 50  0001 C CNN
F 4 "C0603C105K8PACTU" H 4550 2550 50  0001 C CNN "manf#"
	1    4550 2550
	1    0    0    -1  
$EndComp
$Comp
L device:C C10
U 1 1 5A433F7C
P 4250 2550
F 0 "C10" H 4250 2650 50  0000 L CNN
F 1 "0.1u" H 4200 2450 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 4288 2400 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 4250 2550 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 4250 2550 50  0001 C CNN "manf#"
	1    4250 2550
	1    0    0    -1  
$EndComp
$Comp
L pspice:R R1
U 1 1 5A43EECB
P 2250 3900
F 0 "R1" H 2182 3854 50  0000 R CNN
F 1 "50" H 2182 3945 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 2250 3900 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 2250 3900 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 2250 3900 50  0001 C CNN "manf#"
	1    2250 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 5600 2950 5600
Wire Wire Line
	4200 6400 4450 6400
Wire Wire Line
	4350 5100 4350 5300
Wire Wire Line
	4200 5600 4450 5600
Wire Wire Line
	4350 5300 4750 5300
Connection ~ 4350 5300
Wire Wire Line
	4750 5300 4750 5100
$Comp
L pspice:0 #GND08
U 1 1 5A46A9D9
P 8750 5300
F 0 "#GND08" H 8750 5200 50  0001 C CNN
F 1 "0" H 8750 5387 50  0000 C CNN
F 2 "" H 8750 5300 50  0001 C CNN
F 3 "" H 8750 5300 50  0001 C CNN
	1    8750 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 5300 8750 5300
$Comp
L device:C C15
U 1 1 5A46C79F
P 8500 5850
F 0 "C15" H 8500 5950 50  0000 L CNN
F 1 "100p" H 8450 5750 50  0000 L CNN
F 2 "Footprint:C0603C101K5RACTU" H 8538 5700 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 8500 5850 50  0001 C CNN
F 4 "C0603C101K5RACTU" H 8500 5850 50  0001 C CNN "manf#"
	1    8500 5850
	0    -1   -1   0   
$EndComp
$Comp
L pspice:0 #GND09
U 1 1 5A49D7EC
P 6600 4750
F 0 "#GND09" H 6600 4650 50  0001 C CNN
F 1 "0" H 6600 4837 50  0001 C CNN
F 2 "" H 6600 4750 50  0001 C CNN
F 3 "" H 6600 4750 50  0001 C CNN
	1    6600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3850 6600 3850
Connection ~ 6600 3850
$Comp
L pspice:0 #GND011
U 1 1 5A4C1E4A
P 8750 4000
F 0 "#GND011" H 8750 3900 50  0001 C CNN
F 1 "0" V 8750 4041 50  0000 L CNN
F 2 "" H 8750 4000 50  0001 C CNN
F 3 "" H 8750 4000 50  0001 C CNN
	1    8750 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 4000 8750 4000
$Comp
L device:C C6
U 1 1 5A4CEAD6
P 4750 2550
F 0 "C6" H 4750 2650 50  0000 L CNN
F 1 "10u" H 4700 2450 50  0000 L CNN
F 2 "Footprint:C0805C106K9PACTU" H 4788 2400 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 4750 2550 50  0001 C CNN
F 4 "C0805C106K9PACTU" H 4750 2550 50  0001 C CNN "manf#"
	1    4750 2550
	1    0    0    -1  
$EndComp
$Comp
L device:C C13
U 1 1 5A4CEB34
P 6000 3300
F 0 "C13" H 6000 3400 50  0000 L CNN
F 1 "10u" H 5950 3200 50  0000 L CNN
F 2 "Footprint:C0805C106K9PACTU" H 6038 3150 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 6000 3300 50  0001 C CNN
F 4 "C0805C106K9PACTU" H 6000 3300 50  0001 C CNN "manf#"
	1    6000 3300
	1    0    0    -1  
$EndComp
$Comp
L device:C C7
U 1 1 5A439C92
P 3650 4600
F 0 "C7" H 3650 4700 50  0000 L CNN
F 1 "1u" H 3600 4500 50  0000 L CNN
F 2 "Footprint:C0603C105K8PACTU" H 3688 4450 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 3650 4600 50  0001 C CNN
F 4 "C0603C105K8PACTU" H 3650 4600 50  0001 C CNN "manf#"
	1    3650 4600
	0    1    1    0   
$EndComp
$Comp
L device:C C19
U 1 1 5A439E8C
P 6250 3300
F 0 "C19" H 6250 3400 50  0000 L CNN
F 1 "1u" H 6200 3200 50  0000 L CNN
F 2 "Footprint:C0603C105K8PACTU" H 6288 3150 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 6250 3300 50  0001 C CNN
F 4 "C0603C105K8PACTU" H 6250 3300 50  0001 C CNN "manf#"
	1    6250 3300
	1    0    0    -1  
$EndComp
$Comp
L device:C C20
U 1 1 5A437184
P 6300 4550
F 0 "C20" H 6300 4650 50  0000 L CNN
F 1 "0.1u" H 6250 4450 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 6338 4400 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 6300 4550 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 6300 4550 50  0001 C CNN "manf#"
	1    6300 4550
	1    0    0    -1  
$EndComp
$Comp
L device:C C18
U 1 1 5A437318
P 6600 4550
F 0 "C18" H 6600 4650 50  0000 L CNN
F 1 "0.1u" H 6550 4450 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 6638 4400 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 6600 4550 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 6600 4550 50  0001 C CNN "manf#"
	1    6600 4550
	1    0    0    -1  
$EndComp
$Comp
L device:C C14
U 1 1 5A437411
P 3650 5100
F 0 "C14" H 3650 5200 50  0000 L CNN
F 1 "0.1u" H 3600 5000 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 3688 4950 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 3650 5100 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 3650 5100 50  0001 C CNN "manf#"
	1    3650 5100
	0    1    1    0   
$EndComp
$Comp
L device:C C12
U 1 1 5A4374B5
P 4450 6000
F 0 "C12" H 4450 6100 50  0000 L CNN
F 1 "0.1u" H 4400 5900 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 4488 5850 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 4450 6000 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 4450 6000 50  0001 C CNN "manf#"
	1    4450 6000
	1    0    0    -1  
$EndComp
$Comp
L device:C C8
U 1 1 5A437509
P 4200 5750
F 0 "C8" H 4200 5850 50  0000 L CNN
F 1 "0.1u" H 4150 5650 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 4238 5600 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 4200 5750 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 4200 5750 50  0001 C CNN "manf#"
	1    4200 5750
	1    0    0    -1  
$EndComp
$Comp
L device:C C4
U 1 1 5A43756B
P 3700 6000
F 0 "C4" H 3700 6100 50  0000 L CNN
F 1 "0.1u" H 3650 5900 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 3738 5850 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 3700 6000 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 3700 6000 50  0001 C CNN "manf#"
	1    3700 6000
	1    0    0    -1  
$EndComp
$Comp
L device:C C1
U 1 1 5A4375CB
P 3200 6000
F 0 "C1" H 3200 6100 50  0000 L CNN
F 1 "0.1u" H 3150 5900 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 3238 5850 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 3200 6000 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 3200 6000 50  0001 C CNN "manf#"
	1    3200 6000
	1    0    0    -1  
$EndComp
$Comp
L device:C C3
U 1 1 5A4376F5
P 2550 4350
F 0 "C3" H 2550 4450 50  0000 L CNN
F 1 "0.1u" H 2500 4250 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 2588 4200 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 2550 4350 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 2550 4350 50  0001 C CNN "manf#"
	1    2550 4350
	0    -1   -1   0   
$EndComp
$Comp
L device:C C2
U 1 1 5A43789E
P 2550 4150
F 0 "C2" H 2550 4250 50  0000 L CNN
F 1 "0.1u" H 2500 4050 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 2588 4000 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 2550 4150 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 2550 4150 50  0001 C CNN "manf#"
	1    2550 4150
	0    -1   -1   0   
$EndComp
$Comp
L device:C C5
U 1 1 5A437904
P 3400 3650
F 0 "C5" H 3400 3750 50  0000 L CNN
F 1 "0.1u" H 3350 3550 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 3438 3500 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 3400 3650 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 3400 3650 50  0001 C CNN "manf#"
	1    3400 3650
	0    -1   -1   0   
$EndComp
$Comp
L device:C C17
U 1 1 5A43743E
P 8500 5300
F 0 "C17" H 8500 5400 50  0000 L CNN
F 1 "100p" H 8450 5200 50  0000 L CNN
F 2 "Footprint:C0603C101K5RACTU" H 8538 5150 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 8500 5300 50  0001 C CNN
F 4 "C0603C101K5RACTU" H 8500 5300 50  0001 C CNN "manf#"
	1    8500 5300
	0    -1   -1   0   
$EndComp
$Comp
L device:C C21
U 1 1 5A4374A0
P 8500 4750
F 0 "C21" H 8500 4850 50  0000 L CNN
F 1 "100p" H 8450 4650 50  0000 L CNN
F 2 "Footprint:C0603C101K5RACTU" H 8538 4600 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 8500 4750 50  0001 C CNN
F 4 "C0603C101K5RACTU" H 8500 4750 50  0001 C CNN "manf#"
	1    8500 4750
	0    -1   -1   0   
$EndComp
$Comp
L device:C C24
U 1 1 5A43750C
P 8500 4500
F 0 "C24" H 8500 4600 50  0000 L CNN
F 1 "100p" H 8450 4400 50  0000 L CNN
F 2 "Footprint:C0603C101K5RACTU" H 8538 4350 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 8500 4500 50  0001 C CNN
F 4 "C0603C101K5RACTU" H 8500 4500 50  0001 C CNN "manf#"
	1    8500 4500
	0    -1   -1   0   
$EndComp
$Comp
L device:C C23
U 1 1 5A437AB4
P 8500 4000
F 0 "C23" H 8500 4100 50  0000 L CNN
F 1 "100p" H 8450 3900 50  0000 L CNN
F 2 "Footprint:C0603C101K5RACTU" H 8538 3850 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 8500 4000 50  0001 C CNN
F 4 "C0603C101K5RACTU" H 8500 4000 50  0001 C CNN "manf#"
	1    8500 4000
	0    -1   -1   0   
$EndComp
$Comp
L device:C C22
U 1 1 5A437B4A
P 8500 3500
F 0 "C22" H 8500 3600 50  0000 L CNN
F 1 "100p" H 8450 3400 50  0000 L CNN
F 2 "Footprint:C0603C101K5RACTU" H 8538 3350 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 8500 3500 50  0001 C CNN
F 4 "C0603C101K5RACTU" H 8500 3500 50  0001 C CNN "manf#"
	1    8500 3500
	0    -1   -1   0   
$EndComp
$Comp
L pspice:R R2
U 1 1 5A4372BB
P 2250 4600
F 0 "R2" H 2182 4554 50  0000 R CNN
F 1 "50" H 2182 4645 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 2250 4600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 2250 4600 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 2250 4600 50  0001 C CNN "manf#"
	1    2250 4600
	-1   0    0    1   
$EndComp
$Comp
L pspice:R R3
U 1 1 5A4373C5
P 3450 5600
F 0 "R3" H 3382 5554 50  0000 R CNN
F 1 "50" H 3382 5645 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 3450 5600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 3450 5600 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 3450 5600 50  0001 C CNN "manf#"
	1    3450 5600
	0    1    1    0   
$EndComp
$Comp
L pspice:R R4
U 1 1 5A437A2F
P 3950 5600
F 0 "R4" H 3882 5554 50  0000 R CNN
F 1 "50" H 3882 5645 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 3950 5600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 3950 5600 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 3950 5600 50  0001 C CNN "manf#"
	1    3950 5600
	0    1    1    0   
$EndComp
Connection ~ 4200 5600
$Comp
L pspice:R R5
U 1 1 5A437B2F
P 4200 6150
F 0 "R5" H 4132 6104 50  0000 R CNN
F 1 "50" H 4132 6195 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 4200 6150 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 4200 6150 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 4200 6150 50  0001 C CNN "manf#"
	1    4200 6150
	-1   0    0    1   
$EndComp
Connection ~ 4200 6400
$Comp
L pspice:R R6
U 1 1 5A437D58
P 8200 5600
F 0 "R6" H 8132 5554 50  0000 R CNN
F 1 "50" H 8132 5645 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 8200 5600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 8200 5600 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 8200 5600 50  0001 C CNN "manf#"
	1    8200 5600
	-1   0    0    1   
$EndComp
$Comp
L pspice:R R7
U 1 1 5A437F48
P 8200 5000
F 0 "R7" H 8132 4954 50  0000 R CNN
F 1 "50" H 8132 5045 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 8200 5000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 8200 5000 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 8200 5000 50  0001 C CNN "manf#"
	1    8200 5000
	-1   0    0    1   
$EndComp
$Comp
L pspice:R R9
U 1 1 5A438111
P 8200 4250
F 0 "R9" H 8132 4204 50  0000 R CNN
F 1 "50" H 8132 4295 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 8200 4250 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 8200 4250 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 8200 4250 50  0001 C CNN "manf#"
	1    8200 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 4500 8350 4500
Connection ~ 8200 4000
Wire Wire Line
	8200 4000 8350 4000
$Comp
L pspice:R R8
U 1 1 5A438287
P 8200 3750
F 0 "R8" H 8132 3704 50  0000 R CNN
F 1 "50" H 8132 3795 50  0000 R CNN
F 2 "Footprint:FC0603E50R0BST1" H 8200 3750 50  0001 C CNN
F 3 "http://www.vishay.com/docs/60093/fcseries.pdf" H 8200 3750 50  0001 C CNN
F 4 "FC0603E50R0BST1" H 8200 3750 50  0001 C CNN "manf#"
	1    8200 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 3500 8350 3500
$Comp
L device:C C9
U 1 1 5A43873A
P 3650 4850
F 0 "C9" H 3650 4950 50  0000 L CNN
F 1 "0.1u" H 3600 4750 50  0000 L CNN
F 2 "Footprint:C0402C104K8PACTU" H 3688 4700 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 3650 4850 50  0001 C CNN
F 4 "C0402C104K8PACTU" H 3650 4850 50  0001 C CNN "manf#"
	1    3650 4850
	0    1    1    0   
$EndComp
Text Notes 6500 7100 0    118  ~ 0
High Frequency, Low Jitter, VCO
Text HLabel 1900 2600 0    118  Input ~ 0
Vcc
Text HLabel 9500 3500 2    118  Input ~ 0
RFoutAP
Text HLabel 9500 4500 2    118  Input ~ 0
RFoutAM
Text HLabel 1900 4150 0    118  Input ~ 0
OSCinP
Text HLabel 1900 4350 0    118  Input ~ 0
OSCinM
Wire Wire Line
	1900 4150 2250 4150
Wire Wire Line
	1900 4350 2250 4350
Wire Wire Line
	8650 3500 9500 3500
Wire Wire Line
	9500 4500 8650 4500
Text HLabel 9500 4750 2    118  Input ~ 0
RFoutBP
Text HLabel 9500 5850 2    118  Input ~ 0
RFoutBM
Wire Wire Line
	8650 5850 9500 5850
Wire Wire Line
	8650 4750 9500 4750
Wire Wire Line
	8200 4750 8350 4750
Wire Wire Line
	8200 5850 8350 5850
Wire Wire Line
	8200 5300 8200 5250
Wire Wire Line
	8200 5300 8350 5300
Wire Wire Line
	8200 5300 8200 5350
Connection ~ 8200 5300
Wire Wire Line
	6600 3850 6600 4350
Wire Wire Line
	8200 4000 8000 4000
Wire Wire Line
	8000 5300 8200 5300
Text Label 2000 2600 0    118  ~ 0
Vcc
Wire Wire Line
	1900 2600 2000 2600
Text HLabel 1900 2850 0    118  Input ~ 0
Vtune
Text Label 2000 2850 0    118  ~ 0
Vtune
Wire Wire Line
	1900 2850 2000 2850
Wire Wire Line
	3200 6150 3200 6400
Wire Wire Line
	3200 6400 3700 6400
Wire Wire Line
	3700 6150 3700 6400
Connection ~ 3700 6400
Wire Wire Line
	3700 6400 4200 6400
Wire Wire Line
	3700 5850 3700 5600
Connection ~ 3700 5600
Wire Wire Line
	3200 5850 3200 5600
Connection ~ 3200 5600
Wire Wire Line
	4450 5850 4450 5600
Wire Wire Line
	4450 6150 4450 6400
Text Label 2950 5600 2    118  ~ 0
Vtune
Wire Wire Line
	5850 4150 7500 4150
Wire Wire Line
	7500 4150 7500 3500
Wire Wire Line
	7500 3500 8200 3500
Connection ~ 8200 3500
Wire Wire Line
	5850 4250 7500 4250
Wire Wire Line
	7500 4250 7500 4500
Wire Wire Line
	7500 4500 8200 4500
Connection ~ 8200 4500
Wire Wire Line
	8200 4750 7500 4750
Wire Wire Line
	7500 4750 7500 5350
Wire Wire Line
	7500 5350 5150 5350
Wire Wire Line
	5150 5350 5150 5100
Connection ~ 8200 4750
Wire Wire Line
	8200 5850 7500 5850
Wire Wire Line
	7500 5850 7500 5450
Wire Wire Line
	7500 5450 5050 5450
Wire Wire Line
	5050 5450 5050 5100
Connection ~ 8200 5850
Text Label 8000 4000 2    118  ~ 0
Vcc
Text Label 8000 5300 2    118  ~ 0
Vcc
Text HLabel 1900 6700 0    118  Input ~ 0
SCK
Text HLabel 1900 6900 0    118  Input ~ 0
SDI
Text HLabel 1900 7100 0    118  Input ~ 0
MUXout
$Comp
L pspice:0 #GND02
U 1 1 5A4E23C6
P 4550 5200
F 0 "#GND02" H 4550 5100 50  0001 C CNN
F 1 "0" H 4550 5287 50  0001 C CNN
F 2 "" H 4550 5200 50  0001 C CNN
F 3 "" H 4550 5200 50  0001 C CNN
	1    4550 5200
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND03
U 1 1 5A4E2415
P 4650 5200
F 0 "#GND03" H 4650 5100 50  0001 C CNN
F 1 "0" H 4650 5287 50  0001 C CNN
F 2 "" H 4650 5200 50  0001 C CNN
F 3 "" H 4650 5200 50  0001 C CNN
	1    4650 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5100 4550 5200
Wire Wire Line
	4650 5200 4650 5100
Wire Wire Line
	5250 7100 1900 7100
Wire Wire Line
	1900 6900 4950 6900
Wire Wire Line
	1900 6700 4850 6700
Connection ~ 2250 4150
Wire Wire Line
	2250 4150 2400 4150
Connection ~ 2250 4350
Wire Wire Line
	2250 4350 2400 4350
$Comp
L pspice:0 #GND04
U 1 1 5A4F8C88
P 3900 4850
F 0 "#GND04" H 3900 4750 50  0001 C CNN
F 1 "0" H 3900 4937 50  0001 C CNN
F 2 "" H 3900 4850 50  0001 C CNN
F 3 "" H 3900 4850 50  0001 C CNN
	1    3900 4850
	0    -1   -1   0   
$EndComp
$Comp
L pspice:0 #GND05
U 1 1 5A4F8CD7
P 2250 4850
F 0 "#GND05" H 2250 4750 50  0001 C CNN
F 1 "0" H 2250 4937 50  0001 C CNN
F 2 "" H 2250 4850 50  0001 C CNN
F 3 "" H 2250 4850 50  0001 C CNN
	1    2250 4850
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND06
U 1 1 5A4F8D8C
P 2250 3650
F 0 "#GND06" H 2250 3550 50  0001 C CNN
F 1 "0" H 2250 3737 50  0001 C CNN
F 2 "" H 2250 3650 50  0001 C CNN
F 3 "" H 2250 3650 50  0001 C CNN
	1    2250 3650
	-1   0    0    1   
$EndComp
$Comp
L LMX2582:LMX2582 U1
U 1 1 5A4CDDEC
P 4800 3900
F 0 "U1" H 4750 4000 50  0000 L CNN
F 1 "LMX2582" H 4650 3900 50  0000 L CNN
F 2 "Footprint:LMX2582" H 4800 3900 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1006_X5R_SMD.pdf" H 4800 3900 50  0001 C CNN
F 4 "LMX2582RHAT" H 4800 3900 50  0001 C CNN "manf#"
	1    4800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4250 3600 4250
Wire Wire Line
	3600 4250 3600 4350
Wire Wire Line
	3600 4350 2700 4350
Wire Wire Line
	3700 4150 2700 4150
Text Label 3150 4050 2    118  ~ 0
Vcc
Text Label 3150 4850 2    118  ~ 0
Vcc
Wire Wire Line
	3800 5100 3850 5100
Wire Wire Line
	3850 5100 3850 4850
Wire Wire Line
	3850 4850 3900 4850
Wire Wire Line
	3800 4850 3850 4850
Connection ~ 3850 4850
Wire Wire Line
	3850 4850 3850 4600
Wire Wire Line
	3850 4600 3800 4600
Wire Wire Line
	4450 5600 4450 5100
Connection ~ 4450 5600
Wire Wire Line
	4950 5100 4950 6900
Wire Wire Line
	4850 5100 4850 6700
Wire Wire Line
	5250 5100 5250 7100
Wire Wire Line
	3400 5300 3400 5100
Wire Wire Line
	3400 5300 4350 5300
Wire Wire Line
	3700 4350 3700 4450
Wire Wire Line
	3700 4450 3400 4450
Wire Wire Line
	3400 4450 3400 4600
Wire Wire Line
	3400 4600 3500 4600
Wire Wire Line
	3400 4850 3500 4850
Wire Wire Line
	3500 5100 3400 5100
Connection ~ 3400 5100
Wire Wire Line
	3400 5100 3400 4850
$Comp
L pspice:0 #GND07
U 1 1 5A5858CD
P 3600 3950
F 0 "#GND07" H 3600 3850 50  0001 C CNN
F 1 "0" H 3600 4037 50  0001 C CNN
F 2 "" H 3600 3950 50  0001 C CNN
F 3 "" H 3600 3950 50  0001 C CNN
	1    3600 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 3950 3600 3950
$Comp
L pspice:0 #GND010
U 1 1 5A58A5DF
P 3600 3750
F 0 "#GND010" H 3600 3650 50  0001 C CNN
F 1 "0" H 3600 3837 50  0001 C CNN
F 2 "" H 3600 3750 50  0001 C CNN
F 3 "" H 3600 3750 50  0001 C CNN
	1    3600 3750
	0    1    1    0   
$EndComp
$Comp
L pspice:0 #GND012
U 1 1 5A58A62E
P 3600 3550
F 0 "#GND012" H 3600 3450 50  0001 C CNN
F 1 "0" H 3600 3637 50  0001 C CNN
F 2 "" H 3600 3550 50  0001 C CNN
F 3 "" H 3600 3550 50  0001 C CNN
	1    3600 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 3550 3600 3550
Wire Wire Line
	3700 3750 3600 3750
Wire Wire Line
	3550 3650 3700 3650
$Comp
L pspice:0 #GND013
U 1 1 5A5977BD
P 3200 3650
F 0 "#GND013" H 3200 3550 50  0001 C CNN
F 1 "0" H 3200 3737 50  0001 C CNN
F 2 "" H 3200 3650 50  0001 C CNN
F 3 "" H 3200 3650 50  0001 C CNN
	1    3200 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3650 3200 3650
Wire Wire Line
	3150 4050 3700 4050
Wire Wire Line
	3150 4850 3400 4850
Connection ~ 3400 4850
Text HLabel 1900 7300 0    118  Input ~ 0
CSB
Wire Wire Line
	1900 7300 6150 7300
Wire Wire Line
	6150 7300 6150 4050
Wire Wire Line
	6150 4050 5850 4050
Wire Wire Line
	5850 3850 6600 3850
Wire Wire Line
	6000 3550 5850 3550
Wire Wire Line
	6250 3750 5850 3750
Wire Wire Line
	6000 3150 6000 3050
Wire Wire Line
	6250 3150 6250 3050
Wire Wire Line
	6250 3050 6000 3050
Connection ~ 6000 3050
Wire Wire Line
	6000 3050 6000 3000
Wire Wire Line
	5850 3950 5950 3950
$Comp
L pspice:0 #GND014
U 1 1 5A5CE112
P 6300 4750
F 0 "#GND014" H 6300 4650 50  0001 C CNN
F 1 "0" H 6300 4837 50  0001 C CNN
F 2 "" H 6300 4750 50  0001 C CNN
F 3 "" H 6300 4750 50  0001 C CNN
	1    6300 4750
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND015
U 1 1 5A5CE2C7
P 5950 3950
F 0 "#GND015" H 5950 3850 50  0001 C CNN
F 1 "0" H 5950 4037 50  0001 C CNN
F 2 "" H 5950 3950 50  0001 C CNN
F 3 "" H 5950 3950 50  0001 C CNN
	1    5950 3950
	0    -1   -1   0   
$EndComp
$Comp
L pspice:0 #GND016
U 1 1 5A5CE559
P 6000 3000
F 0 "#GND016" H 6000 2900 50  0001 C CNN
F 1 "0" H 6000 3087 50  0001 C CNN
F 2 "" H 6000 3000 50  0001 C CNN
F 3 "" H 6000 3000 50  0001 C CNN
	1    6000 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5850 4350 6300 4350
Wire Wire Line
	6300 4350 6600 4350
Connection ~ 6300 4350
Wire Wire Line
	6300 4400 6300 4350
Wire Wire Line
	6600 4400 6600 4350
Connection ~ 6600 4350
Wire Wire Line
	6300 4700 6300 4750
Wire Wire Line
	6600 4700 6600 4750
Text Label 6700 3850 0    118  ~ 0
Vcc
Wire Wire Line
	6000 3450 6000 3550
Wire Wire Line
	6250 3450 6250 3750
Text Notes 600  900  0    118  ~ 0
Notes: Very Important to keep Trace Length on these connections small\n       Spice Model still needs to be converted from IBIS
$Comp
L pspice:0 #GND017
U 1 1 5A609C8A
P 4950 2750
F 0 "#GND017" H 4950 2650 50  0001 C CNN
F 1 "0" H 4950 2837 50  0001 C CNN
F 2 "" H 4950 2750 50  0001 C CNN
F 3 "" H 4950 2750 50  0001 C CNN
	1    4950 2750
	-1   0    0    1   
$EndComp
$Comp
L pspice:0 #GND018
U 1 1 5A609CD9
P 5250 2750
F 0 "#GND018" H 5250 2650 50  0001 C CNN
F 1 "0" H 5250 2837 50  0001 C CNN
F 2 "" H 5250 2750 50  0001 C CNN
F 3 "" H 5250 2750 50  0001 C CNN
	1    5250 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 2750 4950 2800
Wire Wire Line
	5250 2750 5250 2800
$Comp
L pspice:0 #GND019
U 1 1 5A613C28
P 5050 2350
F 0 "#GND019" H 5050 2250 50  0001 C CNN
F 1 "0" H 5050 2437 50  0001 C CNN
F 2 "" H 5050 2350 50  0001 C CNN
F 3 "" H 5050 2350 50  0001 C CNN
	1    5050 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5050 2700 5050 2800
Text Label 4950 2150 0    118  ~ 0
Vtune
Wire Wire Line
	4850 2150 4950 2150
Wire Wire Line
	4850 2150 4850 2800
Wire Wire Line
	4750 2700 4750 2800
Wire Wire Line
	4550 2700 4550 2800
$Comp
L pspice:0 #GND020
U 1 1 5A63687D
P 4750 2350
F 0 "#GND020" H 4750 2250 50  0001 C CNN
F 1 "0" H 4750 2437 50  0001 C CNN
F 2 "" H 4750 2350 50  0001 C CNN
F 3 "" H 4750 2350 50  0001 C CNN
	1    4750 2350
	-1   0    0    1   
$EndComp
$Comp
L pspice:0 #GND021
U 1 1 5A6368CC
P 4550 2350
F 0 "#GND021" H 4550 2250 50  0001 C CNN
F 1 "0" H 4550 2437 50  0001 C CNN
F 2 "" H 4550 2350 50  0001 C CNN
F 3 "" H 4550 2350 50  0001 C CNN
	1    4550 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4550 2350 4550 2400
Wire Wire Line
	4650 2150 4650 2800
$Comp
L pspice:0 #GND022
U 1 1 5A640BA9
P 4450 2750
F 0 "#GND022" H 4450 2650 50  0001 C CNN
F 1 "0" H 4450 2837 50  0001 C CNN
F 2 "" H 4450 2750 50  0001 C CNN
F 3 "" H 4450 2750 50  0001 C CNN
	1    4450 2750
	-1   0    0    1   
$EndComp
$Comp
L pspice:0 #GND023
U 1 1 5A640BF8
P 4350 2750
F 0 "#GND023" H 4350 2650 50  0001 C CNN
F 1 "0" H 4350 2837 50  0001 C CNN
F 2 "" H 4350 2750 50  0001 C CNN
F 3 "" H 4350 2750 50  0001 C CNN
	1    4350 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	4250 2150 4250 2400
Wire Wire Line
	4250 2150 4650 2150
Connection ~ 4250 2150
Text Label 3700 2150 2    118  ~ 0
Vcc
$Comp
L pspice:0 #GND024
U 1 1 5A64F8BE
P 4100 2900
F 0 "#GND024" H 4100 2800 50  0001 C CNN
F 1 "0" H 4100 2987 50  0001 C CNN
F 2 "" H 4100 2900 50  0001 C CNN
F 3 "" H 4100 2900 50  0001 C CNN
	1    4100 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 2900 4100 2900
Wire Wire Line
	4250 2700 4250 2900
Connection ~ 4250 2900
Wire Wire Line
	4250 2900 4250 3550
Wire Notes Line
	4650 5400 3050 5400
Wire Notes Line
	3050 5400 3050 6500
Wire Notes Line
	3050 6500 4650 6500
Wire Notes Line
	4650 6500 4650 5400
Text Notes 1300 6050 0    118  ~ 0
VCO Tunning Block
Text Notes 550  1850 0    118  ~ 0
TI Guidelines:\n• Place output pull up components close to the pin.\n• Place capacitors close to the pins.\n• Make sure input signal trace is well matched.\n• Do not route any traces that carrying switching signal close to the charge pump traces and external VCO.
Text Notes 7450 3050 0    118  ~ 0
WHICH PIN IS RF GROUND???
Wire Wire Line
	3700 2150 3700 3450
Wire Wire Line
	3700 2150 4250 2150
$EndSCHEMATC
