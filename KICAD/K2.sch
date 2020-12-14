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
L Connector:Conn_01x08_Female J4
U 1 1 5FDC4D34
P 6100 3000
F 0 "J4" H 6128 2976 50  0000 L CNN
F 1 "ZÓCALO SENSOR CCS811" H 6128 2885 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 6100 3000 50  0001 C CNN
F 3 "~" H 6100 3000 50  0001 C CNN
	1    6100 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J1
U 1 1 5FDC5978
P 3500 3100
F 0 "J1" H 3392 3385 50  0000 C CNN
F 1 "ZÓCALO RGB" H 3392 3294 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 3500 3100 50  0001 C CNN
F 3 "~" H 3500 3100 50  0001 C CNN
	1    3500 3100
	-1   0    0    -1  
$EndComp
NoConn ~ 5900 3200
NoConn ~ 5900 3300
NoConn ~ 5900 3400
$Comp
L Connector:Conn_01x15_Female J3
U 1 1 5FDC411A
P 5000 3400
F 0 "J3" H 4892 4285 50  0000 C CNN
F 1 "ZOCALONODEMCUDER" H 4892 4194 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 5000 3400 50  0001 C CNN
F 3 "~" H 5000 3400 50  0001 C CNN
	1    5000 3400
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x15_Female J2
U 1 1 5FDC30E0
P 4300 3400
F 0 "J2" H 4328 3426 50  0000 L CNN
F 1 "ZOCALONODEMCUIZQ" H 4328 3335 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 4300 3400 50  0001 C CNN
F 3 "~" H 4300 3400 50  0001 C CNN
	1    4300 3400
	1    0    0    -1  
$EndComp
Text Label 6150 2700 0    50   ~ 0
VCC
Text Label 3350 3100 0    50   ~ 0
GND
Wire Wire Line
	4100 2800 3850 2800
Wire Wire Line
	3850 2800 3850 3200
Wire Wire Line
	3850 3200 3700 3200
Wire Wire Line
	3700 3300 3800 3300
Wire Wire Line
	3800 3300 3800 3400
Wire Wire Line
	3800 3400 4100 3400
Wire Wire Line
	3700 3100 3950 3100
Wire Wire Line
	3950 3100 3950 3300
Wire Wire Line
	3950 3300 4100 3300
Wire Wire Line
	3700 3000 4000 3000
Wire Wire Line
	4000 3000 4000 3200
Wire Wire Line
	4000 3200 4100 3200
Wire Wire Line
	5900 2700 5900 2550
Wire Wire Line
	5900 2550 5700 2550
Wire Wire Line
	4100 2550 4100 2700
Wire Wire Line
	5900 2800 5750 2800
Wire Wire Line
	5900 2900 5700 2900
Wire Wire Line
	5350 2900 5350 4150
Wire Wire Line
	5350 4150 4000 4150
Wire Wire Line
	4000 4150 4000 4000
Wire Wire Line
	4000 4000 4100 4000
Wire Wire Line
	5900 3000 5550 3000
Wire Wire Line
	5450 3000 5450 4200
Wire Wire Line
	5450 4200 3950 4200
Wire Wire Line
	3950 4200 3950 3900
Wire Wire Line
	3950 3900 4100 3900
Wire Wire Line
	5900 3100 5750 3100
Wire Wire Line
	5750 3100 5750 2800
Connection ~ 5750 2800
Wire Wire Line
	5750 2800 5200 2800
NoConn ~ 4100 2900
NoConn ~ 4100 3000
NoConn ~ 4100 3100
NoConn ~ 4100 3500
NoConn ~ 4100 3600
NoConn ~ 4100 3700
NoConn ~ 4100 3800
NoConn ~ 5200 4100
NoConn ~ 5200 4000
NoConn ~ 5200 3900
NoConn ~ 5200 3800
NoConn ~ 5200 3700
NoConn ~ 5200 3600
NoConn ~ 5200 3500
NoConn ~ 5200 3400
NoConn ~ 5200 3300
NoConn ~ 5200 3200
NoConn ~ 5200 3100
NoConn ~ 5200 3000
NoConn ~ 5200 2900
NoConn ~ 5200 2700
NoConn ~ 4100 4100
$Comp
L Device:R R2
U 1 1 5FD8B38E
P 5700 2700
F 0 "R2" H 5770 2746 50  0000 L CNN
F 1 "10 K" H 5770 2655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5630 2700 50  0001 C CNN
F 3 "~" H 5700 2700 50  0001 C CNN
	1    5700 2700
	1    0    0    -1  
$EndComp
Connection ~ 5700 2550
Wire Wire Line
	5700 2550 5550 2550
$Comp
L Device:R R1
U 1 1 5FD8BF5C
P 5550 2700
F 0 "R1" H 5620 2746 50  0000 L CNN
F 1 "10 K" H 5620 2655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5480 2700 50  0001 C CNN
F 3 "~" H 5550 2700 50  0001 C CNN
	1    5550 2700
	1    0    0    -1  
$EndComp
Connection ~ 5550 2550
Wire Wire Line
	5550 2550 4100 2550
Wire Wire Line
	5700 2850 5700 2900
Connection ~ 5700 2900
Wire Wire Line
	5700 2900 5350 2900
Wire Wire Line
	5550 2850 5550 3000
Connection ~ 5550 3000
Wire Wire Line
	5550 3000 5450 3000
$EndSCHEMATC
