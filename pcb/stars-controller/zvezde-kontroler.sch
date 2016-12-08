EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:eurocad
LIBS:zvezde-kontroler-cache
EELAYER 25 0
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
L TLC5925 J1
U 1 1 57EBC450
P 4650 3150
F 0 "J1" H 4650 2500 60  0000 C CNN
F 1 "TLC5925" H 4650 3800 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-24W_7.5x15.4mm_Pitch1.27mm" H 4650 3200 60  0001 C CNN
F 3 "" H 4650 3200 60  0000 C CNN
	1    4650 3150
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P2
U 1 1 57EBC4BF
P 5400 3350
F 0 "P2" H 5400 3800 50  0000 C CNN
F 1 "CONN_01X08" V 5500 3350 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x08" H 5400 3350 50  0001 C CNN
F 3 "" H 5400 3350 50  0000 C CNN
	1    5400 3350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P1
U 1 1 57EBC502
P 3900 3350
F 0 "P1" H 3900 3800 50  0000 C CNN
F 1 "CONN_01X08" V 4000 3350 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x08" H 3900 3350 50  0001 C CNN
F 3 "" H 3900 3350 50  0000 C CNN
	1    3900 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4100 3000 4200 3000
Wire Wire Line
	4100 3100 4200 3100
Wire Wire Line
	4100 3200 4200 3200
Wire Wire Line
	4100 3300 4200 3300
Wire Wire Line
	4100 3400 4200 3400
Wire Wire Line
	4100 3500 4200 3500
Wire Wire Line
	4100 3600 4200 3600
Wire Wire Line
	4100 3700 4200 3700
Wire Wire Line
	5100 3000 5200 3000
Wire Wire Line
	5100 3100 5200 3100
Wire Wire Line
	5100 3200 5200 3200
Wire Wire Line
	5100 3300 5200 3300
Wire Wire Line
	5100 3400 5200 3400
Wire Wire Line
	5100 3500 5200 3500
Wire Wire Line
	5100 3600 5200 3600
Wire Wire Line
	5100 3700 5200 3700
$Comp
L +5V #PWR14
U 1 1 57EBC782
P 5150 2550
F 0 "#PWR14" H 5150 2400 50  0001 C CNN
F 1 "+5V" H 5150 2690 50  0000 C CNN
F 2 "" H 5150 2550 50  0000 C CNN
F 3 "" H 5150 2550 50  0000 C CNN
	1    5150 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2600 5150 2600
Wire Wire Line
	5150 2600 5150 2550
$Comp
L GND #PWR13
U 1 1 57EBC7B1
P 4050 2400
F 0 "#PWR13" H 4050 2150 50  0001 C CNN
F 1 "GND" H 4050 2250 50  0000 C CNN
F 2 "" H 4050 2400 50  0000 C CNN
F 3 "" H 4050 2400 50  0000 C CNN
	1    4050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 2600 4150 2600
Wire Wire Line
	4150 2600 4150 2350
Wire Wire Line
	4150 2350 4050 2350
Wire Wire Line
	4050 2350 4050 2400
Text GLabel 4100 2700 0    60   Input ~ 0
AVR_MOSI
Text GLabel 4100 2800 0    60   Input ~ 0
AVR_SCK
Text GLabel 4100 2900 0    60   Input ~ 0
LATCH
$Comp
L R R1
U 1 1 57EBC826
P 5350 2700
F 0 "R1" V 5430 2700 50  0000 C CNN
F 1 "1k" V 5350 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5280 2700 50  0001 C CNN
F 3 "" H 5350 2700 50  0000 C CNN
	1    5350 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 2700 5200 2700
$Comp
L GND #PWR17
U 1 1 57EBC86F
P 5650 2550
F 0 "#PWR17" H 5650 2300 50  0001 C CNN
F 1 "GND" H 5650 2400 50  0000 C CNN
F 2 "" H 5650 2550 50  0000 C CNN
F 3 "" H 5650 2550 50  0000 C CNN
	1    5650 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2700 5550 2700
Wire Wire Line
	5550 2700 5550 2500
Wire Wire Line
	5550 2500 5650 2500
Wire Wire Line
	5650 2500 5650 2550
Text GLabel 5200 2900 2    60   Input ~ 0
ENABLE
Wire Wire Line
	5100 2900 5200 2900
Wire Wire Line
	4200 2900 4100 2900
Wire Wire Line
	4200 2800 4100 2800
Wire Wire Line
	4200 2700 4100 2700
$Comp
L TLC5925 J2
U 1 1 57EBCB85
P 7000 3250
F 0 "J2" H 7000 2600 60  0000 C CNN
F 1 "TLC5925" H 7000 3900 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-24W_7.5x15.4mm_Pitch1.27mm" H 7000 3300 60  0001 C CNN
F 3 "" H 7000 3300 60  0000 C CNN
	1    7000 3250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P6
U 1 1 57EBCB8B
P 7750 3450
F 0 "P6" H 7750 3900 50  0000 C CNN
F 1 "CONN_01X08" V 7850 3450 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x08" H 7750 3450 50  0001 C CNN
F 3 "" H 7750 3450 50  0000 C CNN
	1    7750 3450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P4
U 1 1 57EBCB91
P 6250 3450
F 0 "P4" H 6250 3900 50  0000 C CNN
F 1 "CONN_01X08" V 6350 3450 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x08" H 6250 3450 50  0001 C CNN
F 3 "" H 6250 3450 50  0000 C CNN
	1    6250 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	6450 3100 6550 3100
Wire Wire Line
	6450 3200 6550 3200
Wire Wire Line
	6450 3300 6550 3300
Wire Wire Line
	6450 3400 6550 3400
Wire Wire Line
	6450 3500 6550 3500
Wire Wire Line
	6450 3600 6550 3600
Wire Wire Line
	6450 3700 6550 3700
Wire Wire Line
	6450 3800 6550 3800
Wire Wire Line
	7450 3100 7550 3100
Wire Wire Line
	7450 3200 7550 3200
Wire Wire Line
	7450 3300 7550 3300
Wire Wire Line
	7450 3400 7550 3400
Wire Wire Line
	7450 3500 7550 3500
Wire Wire Line
	7450 3600 7550 3600
Wire Wire Line
	7450 3700 7550 3700
Wire Wire Line
	7450 3800 7550 3800
$Comp
L +5V #PWR22
U 1 1 57EBCBA7
P 7500 2650
F 0 "#PWR22" H 7500 2500 50  0001 C CNN
F 1 "+5V" H 7500 2790 50  0000 C CNN
F 2 "" H 7500 2650 50  0000 C CNN
F 3 "" H 7500 2650 50  0000 C CNN
	1    7500 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2700 7500 2700
Wire Wire Line
	7500 2700 7500 2650
$Comp
L GND #PWR20
U 1 1 57EBCBAF
P 6400 2500
F 0 "#PWR20" H 6400 2250 50  0001 C CNN
F 1 "GND" H 6400 2350 50  0000 C CNN
F 2 "" H 6400 2500 50  0000 C CNN
F 3 "" H 6400 2500 50  0000 C CNN
	1    6400 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2700 6500 2700
Wire Wire Line
	6500 2700 6500 2450
Wire Wire Line
	6500 2450 6400 2450
Wire Wire Line
	6400 2450 6400 2500
Text GLabel 6450 2900 0    60   Input ~ 0
AVR_SCK
Text GLabel 6450 3000 0    60   Input ~ 0
LATCH
$Comp
L R R2
U 1 1 57EBCBBC
P 7700 2800
F 0 "R2" V 7780 2800 50  0000 C CNN
F 1 "1k" V 7700 2800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7630 2800 50  0001 C CNN
F 3 "" H 7700 2800 50  0000 C CNN
	1    7700 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 2800 7550 2800
$Comp
L GND #PWR25
U 1 1 57EBCBC3
P 8000 2650
F 0 "#PWR25" H 8000 2400 50  0001 C CNN
F 1 "GND" H 8000 2500 50  0000 C CNN
F 2 "" H 8000 2650 50  0000 C CNN
F 3 "" H 8000 2650 50  0000 C CNN
	1    8000 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2800 7900 2800
Wire Wire Line
	7900 2800 7900 2600
Wire Wire Line
	7900 2600 8000 2600
Wire Wire Line
	8000 2600 8000 2650
Text GLabel 7550 3000 2    60   Input ~ 0
ENABLE
Wire Wire Line
	7450 3000 7550 3000
Wire Wire Line
	6550 3000 6450 3000
Wire Wire Line
	6550 2900 6450 2900
Wire Wire Line
	6550 2800 5100 2800
$Comp
L +12V #PWR19
U 1 1 57EBCDCA
P 6350 1700
F 0 "#PWR19" H 6350 1550 50  0001 C CNN
F 1 "+12V" H 6350 1840 50  0000 C CNN
F 2 "" H 6350 1700 50  0000 C CNN
F 3 "" H 6350 1700 50  0000 C CNN
	1    6350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1750 6350 1750
Wire Wire Line
	6350 1700 6350 2050
$Comp
L ATTINY841-SSU IC1
U 1 1 57EBCF4C
P 3150 5400
F 0 "IC1" H 2300 6150 50  0000 C CNN
F 1 "ATTINY841-SSU" H 3850 4650 50  0000 C CNN
F 2 "SMD_Packages:SOIC-14_N" H 3150 5200 50  0000 C CIN
F 3 "" H 3150 5400 50  0000 C CNN
	1    3150 5400
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 57EBD03D
P 5350 2200
F 0 "C2" H 5375 2300 50  0000 L CNN
F 1 "100nF" H 5375 2100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5388 2050 50  0001 C CNN
F 3 "" H 5350 2200 50  0000 C CNN
	1    5350 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR16
U 1 1 57EBD0B9
P 5350 2400
F 0 "#PWR16" H 5350 2150 50  0001 C CNN
F 1 "GND" H 5350 2250 50  0000 C CNN
F 2 "" H 5350 2400 50  0000 C CNN
F 3 "" H 5350 2400 50  0000 C CNN
	1    5350 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2400 5350 2350
$Comp
L +5V #PWR15
U 1 1 57EBD13D
P 5350 2000
F 0 "#PWR15" H 5350 1850 50  0001 C CNN
F 1 "+5V" H 5350 2140 50  0000 C CNN
F 2 "" H 5350 2000 50  0000 C CNN
F 3 "" H 5350 2000 50  0000 C CNN
	1    5350 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2050 5350 2000
$Comp
L C C3
U 1 1 57EBD291
P 7750 2250
F 0 "C3" H 7775 2350 50  0000 L CNN
F 1 "100nF" H 7775 2150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7788 2100 50  0001 C CNN
F 3 "" H 7750 2250 50  0000 C CNN
	1    7750 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR24
U 1 1 57EBD297
P 7750 2450
F 0 "#PWR24" H 7750 2200 50  0001 C CNN
F 1 "GND" H 7750 2300 50  0000 C CNN
F 2 "" H 7750 2450 50  0000 C CNN
F 3 "" H 7750 2450 50  0000 C CNN
	1    7750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2450 7750 2400
$Comp
L +5V #PWR23
U 1 1 57EBD29E
P 7750 2050
F 0 "#PWR23" H 7750 1900 50  0001 C CNN
F 1 "+5V" H 7750 2190 50  0000 C CNN
F 2 "" H 7750 2050 50  0000 C CNN
F 3 "" H 7750 2050 50  0000 C CNN
	1    7750 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2100 7750 2050
$Comp
L C C1
U 1 1 57EBD359
P 2050 5000
F 0 "C1" H 2075 5100 50  0000 L CNN
F 1 "100nF" H 2075 4900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2088 4850 50  0001 C CNN
F 3 "" H 2050 5000 50  0000 C CNN
	1    2050 5000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR3
U 1 1 57EBD3D8
P 2050 4750
F 0 "#PWR3" H 2050 4600 50  0001 C CNN
F 1 "+5V" H 2050 4890 50  0000 C CNN
F 2 "" H 2050 4750 50  0000 C CNN
F 3 "" H 2050 4750 50  0000 C CNN
	1    2050 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 57EBD40A
P 2050 6050
F 0 "#PWR5" H 2050 5800 50  0001 C CNN
F 1 "GND" H 2050 5900 50  0000 C CNN
F 2 "" H 2050 6050 50  0000 C CNN
F 3 "" H 2050 6050 50  0000 C CNN
	1    2050 6050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 57EBD43C
P 2050 5200
F 0 "#PWR4" H 2050 4950 50  0001 C CNN
F 1 "GND" H 2050 5050 50  0000 C CNN
F 2 "" H 2050 5200 50  0000 C CNN
F 3 "" H 2050 5200 50  0000 C CNN
	1    2050 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4800 2050 4800
Wire Wire Line
	2050 4750 2050 4850
Connection ~ 2050 4800
Wire Wire Line
	2050 5200 2050 5150
Wire Wire Line
	2050 6050 2050 6000
Wire Wire Line
	2050 6000 2100 6000
Text GLabel 4300 5000 2    60   Input ~ 0
RXD
Text GLabel 4300 5100 2    60   Input ~ 0
XCK
Text GLabel 4300 5200 2    60   Input ~ 0
AVR_SCK
Text GLabel 4300 5300 2    60   Input ~ 0
AVR_MISO
Text GLabel 4300 5400 2    60   Input ~ 0
AVR_MOSI
Text GLabel 4300 6000 2    60   Input ~ 0
AVR_RESET
Wire Wire Line
	4200 6000 4300 6000
Wire Wire Line
	4200 5400 4300 5400
Wire Wire Line
	4200 5300 4300 5300
Wire Wire Line
	4200 5200 4300 5200
Wire Wire Line
	4200 5100 4300 5100
Wire Wire Line
	4200 5000 4300 5000
Text GLabel 4300 5500 2    60   Input ~ 0
ENABLE
Text GLabel 4300 5700 2    60   Input ~ 0
LATCH
$Comp
L CONN_01X06 P3
U 1 1 57EBDE54
P 6200 5350
F 0 "P3" H 6200 5700 50  0000 C CNN
F 1 "CONN_01X06" V 6300 5350 50  0000 C CNN
F 2 "attiny841-spi:ATTINY841-SPI" H 6200 5350 50  0001 C CNN
F 3 "" H 6200 5350 50  0000 C CNN
	1    6200 5350
	1    0    0    -1  
$EndComp
Text GLabel 5900 5100 0    60   Input ~ 0
AVR_MISO
Text GLabel 5900 5300 0    60   Input ~ 0
AVR_SCK
Text GLabel 5900 5400 0    60   Input ~ 0
AVR_MOSI
Text GLabel 5900 5500 0    60   Input ~ 0
AVR_RESET
$Comp
L GND #PWR18
U 1 1 57EBDF6D
P 5950 5650
F 0 "#PWR18" H 5950 5400 50  0001 C CNN
F 1 "GND" H 5950 5500 50  0000 C CNN
F 2 "" H 5950 5650 50  0000 C CNN
F 3 "" H 5950 5650 50  0000 C CNN
	1    5950 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5600 5950 5600
Wire Wire Line
	5950 5600 5950 5650
Wire Wire Line
	6000 5500 5900 5500
Wire Wire Line
	6000 5400 5900 5400
Wire Wire Line
	6000 5300 5900 5300
Wire Wire Line
	6000 5100 5900 5100
$Comp
L +5V #PWR21
U 1 1 57EBE1A5
P 6400 5050
F 0 "#PWR21" H 6400 4900 50  0001 C CNN
F 1 "+5V" H 6400 5190 50  0000 C CNN
F 2 "" H 6400 5050 50  0000 C CNN
F 3 "" H 6400 5050 50  0000 C CNN
	1    6400 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5200 6400 5200
Wire Wire Line
	6400 5200 6400 5050
$Comp
L CONN_01X04 P5
U 1 1 57EBE37F
P 6600 1900
F 0 "P5" H 6600 2150 50  0000 C CNN
F 1 "CONN_01X04" V 6700 1900 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04" H 6600 1900 50  0001 C CNN
F 3 "" H 6600 1900 50  0000 C CNN
	1    6600 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 1850 6400 1850
Connection ~ 6350 1750
Wire Wire Line
	6350 1950 6400 1950
Connection ~ 6350 1850
Wire Wire Line
	6350 2050 6400 2050
Connection ~ 6350 1950
$Comp
L RJ45 J9
U 1 1 57EBE9CA
P 10600 1100
F 0 "J9" H 10800 1600 50  0000 C CNN
F 1 "RJ45" H 10450 1600 50  0000 C CNN
F 2 "rj45:RJ45" H 10600 1100 50  0001 C CNN
F 3 "" H 10600 1100 50  0000 C CNN
	1    10600 1100
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR52
U 1 1 57EBEAA2
P 10950 1650
F 0 "#PWR52" H 10950 1500 50  0001 C CNN
F 1 "+12V" H 10950 1790 50  0000 C CNN
F 2 "" H 10950 1650 50  0000 C CNN
F 3 "" H 10950 1650 50  0000 C CNN
	1    10950 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	10950 1650 10950 1550
$Comp
L GND #PWR44
U 1 1 57EBEBDB
P 10250 1650
F 0 "#PWR44" H 10250 1400 50  0001 C CNN
F 1 "GND" H 10250 1500 50  0000 C CNN
F 2 "" H 10250 1650 50  0000 C CNN
F 3 "" H 10250 1650 50  0000 C CNN
	1    10250 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 1500 10250 1650
Wire Wire Line
	10250 1500 10850 1500
Wire Wire Line
	10450 1500 10450 1550
Connection ~ 10250 1550
Wire Wire Line
	10650 1500 10650 1550
Connection ~ 10450 1500
Wire Wire Line
	10850 1500 10850 1550
Connection ~ 10650 1500
$Comp
L +5V #PWR48
U 1 1 57EBEDE4
P 10350 1850
F 0 "#PWR48" H 10350 1700 50  0001 C CNN
F 1 "+5V" H 10350 1990 50  0000 C CNN
F 2 "" H 10350 1850 50  0000 C CNN
F 3 "" H 10350 1850 50  0000 C CNN
	1    10350 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 1850 10350 1550
Text GLabel 10550 1650 3    60   Input ~ 0
RXD
Wire Wire Line
	10550 1550 10550 1650
Text GLabel 10750 1650 3    60   Input ~ 0
XCK
Wire Wire Line
	10750 1650 10750 1550
$Comp
L RJ45 J10
U 1 1 57EBF329
P 10600 2600
F 0 "J10" H 10800 3100 50  0000 C CNN
F 1 "RJ45" H 10450 3100 50  0000 C CNN
F 2 "rj45:RJ45" H 10600 2600 50  0001 C CNN
F 3 "" H 10600 2600 50  0000 C CNN
	1    10600 2600
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR53
U 1 1 57EBF32F
P 10950 3150
F 0 "#PWR53" H 10950 3000 50  0001 C CNN
F 1 "+12V" H 10950 3290 50  0000 C CNN
F 2 "" H 10950 3150 50  0000 C CNN
F 3 "" H 10950 3150 50  0000 C CNN
	1    10950 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	10950 3150 10950 3050
$Comp
L GND #PWR45
U 1 1 57EBF336
P 10250 3150
F 0 "#PWR45" H 10250 2900 50  0001 C CNN
F 1 "GND" H 10250 3000 50  0000 C CNN
F 2 "" H 10250 3150 50  0000 C CNN
F 3 "" H 10250 3150 50  0000 C CNN
	1    10250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 3000 10250 3150
Wire Wire Line
	10250 3000 10850 3000
Wire Wire Line
	10450 3000 10450 3050
Connection ~ 10250 3050
Wire Wire Line
	10650 3000 10650 3050
Connection ~ 10450 3000
Wire Wire Line
	10850 3000 10850 3050
Connection ~ 10650 3000
$Comp
L +5V #PWR49
U 1 1 57EBF344
P 10350 3350
F 0 "#PWR49" H 10350 3200 50  0001 C CNN
F 1 "+5V" H 10350 3490 50  0000 C CNN
F 2 "" H 10350 3350 50  0000 C CNN
F 3 "" H 10350 3350 50  0000 C CNN
	1    10350 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 3350 10350 3050
Text GLabel 10550 3150 3    60   Input ~ 0
RXD
Wire Wire Line
	10550 3050 10550 3150
Text GLabel 10750 3150 3    60   Input ~ 0
XCK
Wire Wire Line
	10750 3150 10750 3050
$Comp
L RJ45 J11
U 1 1 57EBF669
P 10600 4100
F 0 "J11" H 10800 4600 50  0000 C CNN
F 1 "RJ45" H 10450 4600 50  0000 C CNN
F 2 "rj45:RJ45" H 10600 4100 50  0001 C CNN
F 3 "" H 10600 4100 50  0000 C CNN
	1    10600 4100
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR54
U 1 1 57EBF66F
P 10950 4650
F 0 "#PWR54" H 10950 4500 50  0001 C CNN
F 1 "+12V" H 10950 4790 50  0000 C CNN
F 2 "" H 10950 4650 50  0000 C CNN
F 3 "" H 10950 4650 50  0000 C CNN
	1    10950 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	10950 4650 10950 4550
$Comp
L GND #PWR46
U 1 1 57EBF676
P 10250 4650
F 0 "#PWR46" H 10250 4400 50  0001 C CNN
F 1 "GND" H 10250 4500 50  0000 C CNN
F 2 "" H 10250 4650 50  0000 C CNN
F 3 "" H 10250 4650 50  0000 C CNN
	1    10250 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 4500 10250 4650
Wire Wire Line
	10250 4500 10850 4500
Wire Wire Line
	10450 4500 10450 4550
Connection ~ 10250 4550
Wire Wire Line
	10650 4500 10650 4550
Connection ~ 10450 4500
Wire Wire Line
	10850 4500 10850 4550
Connection ~ 10650 4500
$Comp
L +5V #PWR50
U 1 1 57EBF684
P 10350 4850
F 0 "#PWR50" H 10350 4700 50  0001 C CNN
F 1 "+5V" H 10350 4990 50  0000 C CNN
F 2 "" H 10350 4850 50  0000 C CNN
F 3 "" H 10350 4850 50  0000 C CNN
	1    10350 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 4850 10350 4550
Text GLabel 10550 4650 3    60   Input ~ 0
RXD
Wire Wire Line
	10550 4550 10550 4650
Text GLabel 10750 4650 3    60   Input ~ 0
XCK
Wire Wire Line
	10750 4650 10750 4550
$Comp
L RJ45 J12
U 1 1 57EBF68F
P 10600 5600
F 0 "J12" H 10800 6100 50  0000 C CNN
F 1 "RJ45" H 10450 6100 50  0000 C CNN
F 2 "rj45:RJ45" H 10600 5600 50  0001 C CNN
F 3 "" H 10600 5600 50  0000 C CNN
	1    10600 5600
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR55
U 1 1 57EBF695
P 10950 6150
F 0 "#PWR55" H 10950 6000 50  0001 C CNN
F 1 "+12V" H 10950 6290 50  0000 C CNN
F 2 "" H 10950 6150 50  0000 C CNN
F 3 "" H 10950 6150 50  0000 C CNN
	1    10950 6150
	-1   0    0    1   
$EndComp
Wire Wire Line
	10950 6150 10950 6050
$Comp
L GND #PWR47
U 1 1 57EBF69C
P 10250 6150
F 0 "#PWR47" H 10250 5900 50  0001 C CNN
F 1 "GND" H 10250 6000 50  0000 C CNN
F 2 "" H 10250 6150 50  0000 C CNN
F 3 "" H 10250 6150 50  0000 C CNN
	1    10250 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 6000 10250 6150
Wire Wire Line
	10250 6000 10850 6000
Wire Wire Line
	10450 6000 10450 6050
Connection ~ 10250 6050
Wire Wire Line
	10650 6000 10650 6050
Connection ~ 10450 6000
Wire Wire Line
	10850 6000 10850 6050
Connection ~ 10650 6000
$Comp
L +5V #PWR51
U 1 1 57EBF6AA
P 10350 6350
F 0 "#PWR51" H 10350 6200 50  0001 C CNN
F 1 "+5V" H 10350 6490 50  0000 C CNN
F 2 "" H 10350 6350 50  0000 C CNN
F 3 "" H 10350 6350 50  0000 C CNN
	1    10350 6350
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 6350 10350 6050
Text GLabel 10550 6150 3    60   Input ~ 0
RXD
Wire Wire Line
	10550 6050 10550 6150
Text GLabel 10750 6150 3    60   Input ~ 0
XCK
Wire Wire Line
	10750 6150 10750 6050
$Comp
L RJ45 J5
U 1 1 57EBF863
P 9550 1100
F 0 "J5" H 9750 1600 50  0000 C CNN
F 1 "RJ45" H 9400 1600 50  0000 C CNN
F 2 "rj45:RJ45" H 9550 1100 50  0001 C CNN
F 3 "" H 9550 1100 50  0000 C CNN
	1    9550 1100
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR40
U 1 1 57EBF869
P 9900 1650
F 0 "#PWR40" H 9900 1500 50  0001 C CNN
F 1 "+12V" H 9900 1790 50  0000 C CNN
F 2 "" H 9900 1650 50  0000 C CNN
F 3 "" H 9900 1650 50  0000 C CNN
	1    9900 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	9900 1650 9900 1550
$Comp
L GND #PWR32
U 1 1 57EBF870
P 9200 1650
F 0 "#PWR32" H 9200 1400 50  0001 C CNN
F 1 "GND" H 9200 1500 50  0000 C CNN
F 2 "" H 9200 1650 50  0000 C CNN
F 3 "" H 9200 1650 50  0000 C CNN
	1    9200 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1500 9200 1650
Wire Wire Line
	9200 1500 9800 1500
Wire Wire Line
	9400 1500 9400 1550
Connection ~ 9200 1550
Wire Wire Line
	9600 1500 9600 1550
Connection ~ 9400 1500
Wire Wire Line
	9800 1500 9800 1550
Connection ~ 9600 1500
$Comp
L +5V #PWR36
U 1 1 57EBF87E
P 9300 1850
F 0 "#PWR36" H 9300 1700 50  0001 C CNN
F 1 "+5V" H 9300 1990 50  0000 C CNN
F 2 "" H 9300 1850 50  0000 C CNN
F 3 "" H 9300 1850 50  0000 C CNN
	1    9300 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	9300 1850 9300 1550
Text GLabel 9500 1650 3    60   Input ~ 0
RXD
Wire Wire Line
	9500 1550 9500 1650
Text GLabel 9700 1650 3    60   Input ~ 0
XCK
Wire Wire Line
	9700 1650 9700 1550
$Comp
L RJ45 J6
U 1 1 57EBF889
P 9550 2600
F 0 "J6" H 9750 3100 50  0000 C CNN
F 1 "RJ45" H 9400 3100 50  0000 C CNN
F 2 "rj45:RJ45" H 9550 2600 50  0001 C CNN
F 3 "" H 9550 2600 50  0000 C CNN
	1    9550 2600
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR41
U 1 1 57EBF88F
P 9900 3150
F 0 "#PWR41" H 9900 3000 50  0001 C CNN
F 1 "+12V" H 9900 3290 50  0000 C CNN
F 2 "" H 9900 3150 50  0000 C CNN
F 3 "" H 9900 3150 50  0000 C CNN
	1    9900 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	9900 3150 9900 3050
$Comp
L GND #PWR33
U 1 1 57EBF896
P 9200 3150
F 0 "#PWR33" H 9200 2900 50  0001 C CNN
F 1 "GND" H 9200 3000 50  0000 C CNN
F 2 "" H 9200 3150 50  0000 C CNN
F 3 "" H 9200 3150 50  0000 C CNN
	1    9200 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3000 9200 3150
Wire Wire Line
	9200 3000 9800 3000
Wire Wire Line
	9400 3000 9400 3050
Connection ~ 9200 3050
Wire Wire Line
	9600 3000 9600 3050
Connection ~ 9400 3000
Wire Wire Line
	9800 3000 9800 3050
Connection ~ 9600 3000
$Comp
L +5V #PWR37
U 1 1 57EBF8A4
P 9300 3350
F 0 "#PWR37" H 9300 3200 50  0001 C CNN
F 1 "+5V" H 9300 3490 50  0000 C CNN
F 2 "" H 9300 3350 50  0000 C CNN
F 3 "" H 9300 3350 50  0000 C CNN
	1    9300 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	9300 3350 9300 3050
Text GLabel 9500 3150 3    60   Input ~ 0
RXD
Wire Wire Line
	9500 3050 9500 3150
Text GLabel 9700 3150 3    60   Input ~ 0
XCK
Wire Wire Line
	9700 3150 9700 3050
$Comp
L RJ45 J7
U 1 1 57EBF8AF
P 9550 4100
F 0 "J7" H 9750 4600 50  0000 C CNN
F 1 "RJ45" H 9400 4600 50  0000 C CNN
F 2 "rj45:RJ45" H 9550 4100 50  0001 C CNN
F 3 "" H 9550 4100 50  0000 C CNN
	1    9550 4100
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR42
U 1 1 57EBF8B5
P 9900 4650
F 0 "#PWR42" H 9900 4500 50  0001 C CNN
F 1 "+12V" H 9900 4790 50  0000 C CNN
F 2 "" H 9900 4650 50  0000 C CNN
F 3 "" H 9900 4650 50  0000 C CNN
	1    9900 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	9900 4650 9900 4550
$Comp
L GND #PWR34
U 1 1 57EBF8BC
P 9200 4650
F 0 "#PWR34" H 9200 4400 50  0001 C CNN
F 1 "GND" H 9200 4500 50  0000 C CNN
F 2 "" H 9200 4650 50  0000 C CNN
F 3 "" H 9200 4650 50  0000 C CNN
	1    9200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 4500 9200 4650
Wire Wire Line
	9200 4500 9800 4500
Wire Wire Line
	9400 4500 9400 4550
Connection ~ 9200 4550
Wire Wire Line
	9600 4500 9600 4550
Connection ~ 9400 4500
Wire Wire Line
	9800 4500 9800 4550
Connection ~ 9600 4500
$Comp
L +5V #PWR38
U 1 1 57EBF8CA
P 9300 4850
F 0 "#PWR38" H 9300 4700 50  0001 C CNN
F 1 "+5V" H 9300 4990 50  0000 C CNN
F 2 "" H 9300 4850 50  0000 C CNN
F 3 "" H 9300 4850 50  0000 C CNN
	1    9300 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	9300 4850 9300 4550
Text GLabel 9500 4650 3    60   Input ~ 0
RXD
Wire Wire Line
	9500 4550 9500 4650
Text GLabel 9700 4650 3    60   Input ~ 0
XCK
Wire Wire Line
	9700 4650 9700 4550
$Comp
L RJ45 J8
U 1 1 57EBF8D5
P 9550 5600
F 0 "J8" H 9750 6100 50  0000 C CNN
F 1 "RJ45" H 9400 6100 50  0000 C CNN
F 2 "rj45:RJ45" H 9550 5600 50  0001 C CNN
F 3 "" H 9550 5600 50  0000 C CNN
	1    9550 5600
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR43
U 1 1 57EBF8DB
P 9900 6150
F 0 "#PWR43" H 9900 6000 50  0001 C CNN
F 1 "+12V" H 9900 6290 50  0000 C CNN
F 2 "" H 9900 6150 50  0000 C CNN
F 3 "" H 9900 6150 50  0000 C CNN
	1    9900 6150
	-1   0    0    1   
$EndComp
Wire Wire Line
	9900 6150 9900 6050
$Comp
L GND #PWR35
U 1 1 57EBF8E2
P 9200 6150
F 0 "#PWR35" H 9200 5900 50  0001 C CNN
F 1 "GND" H 9200 6000 50  0000 C CNN
F 2 "" H 9200 6150 50  0000 C CNN
F 3 "" H 9200 6150 50  0000 C CNN
	1    9200 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 6000 9200 6150
Wire Wire Line
	9200 6000 9800 6000
Wire Wire Line
	9400 6000 9400 6050
Connection ~ 9200 6050
Wire Wire Line
	9600 6000 9600 6050
Connection ~ 9400 6000
Wire Wire Line
	9800 6000 9800 6050
Connection ~ 9600 6000
$Comp
L +5V #PWR39
U 1 1 57EBF8F0
P 9300 6350
F 0 "#PWR39" H 9300 6200 50  0001 C CNN
F 1 "+5V" H 9300 6490 50  0000 C CNN
F 2 "" H 9300 6350 50  0000 C CNN
F 3 "" H 9300 6350 50  0000 C CNN
	1    9300 6350
	-1   0    0    1   
$EndComp
Wire Wire Line
	9300 6350 9300 6050
Text GLabel 9500 6150 3    60   Input ~ 0
RXD
Wire Wire Line
	9500 6050 9500 6150
Text GLabel 9700 6150 3    60   Input ~ 0
XCK
Wire Wire Line
	9700 6150 9700 6050
$Comp
L RJ45 J3
U 1 1 57EBFC13
P 8550 4100
F 0 "J3" H 8750 4600 50  0000 C CNN
F 1 "RJ45" H 8400 4600 50  0000 C CNN
F 2 "rj45:RJ45" H 8550 4100 50  0001 C CNN
F 3 "" H 8550 4100 50  0000 C CNN
	1    8550 4100
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR30
U 1 1 57EBFC19
P 8900 4650
F 0 "#PWR30" H 8900 4500 50  0001 C CNN
F 1 "+12V" H 8900 4790 50  0000 C CNN
F 2 "" H 8900 4650 50  0000 C CNN
F 3 "" H 8900 4650 50  0000 C CNN
	1    8900 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	8900 4650 8900 4550
$Comp
L GND #PWR26
U 1 1 57EBFC20
P 8200 4650
F 0 "#PWR26" H 8200 4400 50  0001 C CNN
F 1 "GND" H 8200 4500 50  0000 C CNN
F 2 "" H 8200 4650 50  0000 C CNN
F 3 "" H 8200 4650 50  0000 C CNN
	1    8200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4500 8200 4650
Wire Wire Line
	8200 4500 8800 4500
Wire Wire Line
	8400 4500 8400 4550
Connection ~ 8200 4550
Wire Wire Line
	8600 4500 8600 4550
Connection ~ 8400 4500
Wire Wire Line
	8800 4500 8800 4550
Connection ~ 8600 4500
$Comp
L +5V #PWR28
U 1 1 57EBFC2E
P 8300 4850
F 0 "#PWR28" H 8300 4700 50  0001 C CNN
F 1 "+5V" H 8300 4990 50  0000 C CNN
F 2 "" H 8300 4850 50  0000 C CNN
F 3 "" H 8300 4850 50  0000 C CNN
	1    8300 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	8300 4850 8300 4550
Text GLabel 8500 4650 3    60   Input ~ 0
RXD
Wire Wire Line
	8500 4550 8500 4650
Text GLabel 8700 4650 3    60   Input ~ 0
XCK
Wire Wire Line
	8700 4650 8700 4550
$Comp
L RJ45 J4
U 1 1 57EBFC39
P 8550 5600
F 0 "J4" H 8750 6100 50  0000 C CNN
F 1 "RJ45" H 8400 6100 50  0000 C CNN
F 2 "rj45:RJ45" H 8550 5600 50  0001 C CNN
F 3 "" H 8550 5600 50  0000 C CNN
	1    8550 5600
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR31
U 1 1 57EBFC3F
P 8900 6150
F 0 "#PWR31" H 8900 6000 50  0001 C CNN
F 1 "+12V" H 8900 6290 50  0000 C CNN
F 2 "" H 8900 6150 50  0000 C CNN
F 3 "" H 8900 6150 50  0000 C CNN
	1    8900 6150
	-1   0    0    1   
$EndComp
Wire Wire Line
	8900 6150 8900 6050
$Comp
L GND #PWR27
U 1 1 57EBFC46
P 8200 6150
F 0 "#PWR27" H 8200 5900 50  0001 C CNN
F 1 "GND" H 8200 6000 50  0000 C CNN
F 2 "" H 8200 6150 50  0000 C CNN
F 3 "" H 8200 6150 50  0000 C CNN
	1    8200 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 6000 8200 6150
Wire Wire Line
	8200 6000 8800 6000
Wire Wire Line
	8400 6000 8400 6050
Connection ~ 8200 6050
Wire Wire Line
	8600 6000 8600 6050
Connection ~ 8400 6000
Wire Wire Line
	8800 6000 8800 6050
Connection ~ 8600 6000
$Comp
L +5V #PWR29
U 1 1 57EBFC54
P 8300 6350
F 0 "#PWR29" H 8300 6200 50  0001 C CNN
F 1 "+5V" H 8300 6490 50  0000 C CNN
F 2 "" H 8300 6350 50  0000 C CNN
F 3 "" H 8300 6350 50  0000 C CNN
	1    8300 6350
	-1   0    0    1   
$EndComp
Wire Wire Line
	8300 6350 8300 6050
Text GLabel 8500 6150 3    60   Input ~ 0
RXD
Wire Wire Line
	8500 6050 8500 6150
Text GLabel 8700 6150 3    60   Input ~ 0
XCK
Wire Wire Line
	8700 6150 8700 6050
Wire Wire Line
	4200 5500 4300 5500
Wire Wire Line
	4200 5700 4300 5700
$Comp
L CP C4
U 1 1 57ED5750
P 2300 2550
F 0 "C4" H 2325 2650 50  0000 L CNN
F 1 "100uF" H 2325 2450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D6.3_L11.2_P2.5" H 2338 2400 50  0001 C CNN
F 3 "" H 2300 2550 50  0000 C CNN
	1    2300 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 57ED587C
P 2300 2750
F 0 "#PWR7" H 2300 2500 50  0001 C CNN
F 1 "GND" H 2300 2600 50  0000 C CNN
F 2 "" H 2300 2750 50  0000 C CNN
F 3 "" H 2300 2750 50  0000 C CNN
	1    2300 2750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR6
U 1 1 57ED58EB
P 2300 2350
F 0 "#PWR6" H 2300 2200 50  0001 C CNN
F 1 "+5V" H 2300 2490 50  0000 C CNN
F 2 "" H 2300 2350 50  0000 C CNN
F 3 "" H 2300 2350 50  0000 C CNN
	1    2300 2350
	1    0    0    -1  
$EndComp
$Comp
L CP C5
U 1 1 57ED5941
P 2700 2550
F 0 "C5" H 2725 2650 50  0000 L CNN
F 1 "100uF" H 2725 2450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D6.3_L11.2_P2.5" H 2738 2400 50  0001 C CNN
F 3 "" H 2700 2550 50  0000 C CNN
	1    2700 2550
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR8
U 1 1 57ED59BB
P 2700 2350
F 0 "#PWR8" H 2700 2200 50  0001 C CNN
F 1 "+12V" H 2700 2490 50  0000 C CNN
F 2 "" H 2700 2350 50  0000 C CNN
F 3 "" H 2700 2350 50  0000 C CNN
	1    2700 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR9
U 1 1 57ED5A14
P 2700 2750
F 0 "#PWR9" H 2700 2500 50  0001 C CNN
F 1 "GND" H 2700 2600 50  0000 C CNN
F 2 "" H 2700 2750 50  0000 C CNN
F 3 "" H 2700 2750 50  0000 C CNN
	1    2700 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 2750 2700 2700
Wire Wire Line
	2300 2750 2300 2700
Wire Wire Line
	2300 2400 2300 2350
Wire Wire Line
	2700 2400 2700 2350
$Comp
L CONN_01X04 P7
U 1 1 57ED5F97
P 3650 1700
F 0 "P7" H 3650 1950 50  0000 C CNN
F 1 "CONN_01X04" V 3750 1700 50  0000 C CNN
F 2 "molex:molex" H 3650 1700 50  0001 C CNN
F 3 "" H 3650 1700 50  0000 C CNN
	1    3650 1700
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR11
U 1 1 57ED601E
P 3400 1500
F 0 "#PWR11" H 3400 1350 50  0001 C CNN
F 1 "+12V" H 3400 1640 50  0000 C CNN
F 2 "" H 3400 1500 50  0000 C CNN
F 3 "" H 3400 1500 50  0000 C CNN
	1    3400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1550 3400 1550
Wire Wire Line
	3400 1550 3400 1500
$Comp
L GND #PWR10
U 1 1 57ED61A9
P 3250 1800
F 0 "#PWR10" H 3250 1550 50  0001 C CNN
F 1 "GND" H 3250 1650 50  0000 C CNN
F 2 "" H 3250 1800 50  0000 C CNN
F 3 "" H 3250 1800 50  0000 C CNN
	1    3250 1800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR12
U 1 1 57ED6279
P 3400 1900
F 0 "#PWR12" H 3400 1750 50  0001 C CNN
F 1 "+5V" H 3400 2040 50  0000 C CNN
F 2 "" H 3400 1900 50  0000 C CNN
F 3 "" H 3400 1900 50  0000 C CNN
	1    3400 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3450 1850 3400 1850
Wire Wire Line
	3400 1850 3400 1900
Wire Wire Line
	3450 1750 3250 1750
Wire Wire Line
	3250 1750 3250 1800
Wire Wire Line
	3450 1650 3400 1650
Wire Wire Line
	3400 1650 3400 1750
Connection ~ 3400 1750
$Comp
L CP C6
U 1 1 57ED7182
P 1950 2550
F 0 "C6" H 1975 2650 50  0000 L CNN
F 1 "100uF" H 1975 2450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D6.3_L11.2_P2.5" H 1988 2400 50  0001 C CNN
F 3 "" H 1950 2550 50  0000 C CNN
	1    1950 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 57ED7188
P 1950 2750
F 0 "#PWR2" H 1950 2500 50  0001 C CNN
F 1 "GND" H 1950 2600 50  0000 C CNN
F 2 "" H 1950 2750 50  0000 C CNN
F 3 "" H 1950 2750 50  0000 C CNN
	1    1950 2750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR1
U 1 1 57ED718E
P 1950 2350
F 0 "#PWR1" H 1950 2200 50  0001 C CNN
F 1 "+5V" H 1950 2490 50  0000 C CNN
F 2 "" H 1950 2350 50  0000 C CNN
F 3 "" H 1950 2350 50  0000 C CNN
	1    1950 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2750 1950 2700
Wire Wire Line
	1950 2400 1950 2350
$EndSCHEMATC
