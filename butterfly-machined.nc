﻿%
 
(BUTTERFLY, MACHINED REV NC OP#1) 
(DATE OPERATED: 04/22/2024)
(DATE WRITTEN: 03/19/2015) 
(DATE MODIFIED: 10/09/2020) 
(RUNTIME: 40 MINUTES)


(CHANGE TOOL LOCATIONS HERE ONLY!!!) 
(DO NOT MODIFY T#'S IN BODY OF PROGRAM) 
(DO NOT CHANGE ZEROED VALUES) 

#801= 101 (ROUGH TURN #1) 
#802= 202 (ROUGH TURN #2) 
#803= 303 (FINISH TURN) 
#804= 404 (ROUGH GROOVE) 
#805= 505 (EDGE BREAK GROOVE) 
#806= 606 (FINISH GROOVE)
#807= 0 
#808= 0 
#809= 0 
#810= 0 
#811= 0 
#812= 0 


(DO NOT CHANGE ANYTHING BELOW THIS LINE -------------------------------------) 





M19 P120. (ORIENT & LOCK SPINDLE)

M97 P90004 (CALL FINISH TURN COUNT VERIFY SUB)
M97 P90005 (CALL INSERT COUNT SUB)

N1 (TAILSTOCK RAPIDS TO 18") 
G00 B-18. 
M00 (ORIENT CASTING TO MATCH CENTER) 
G01 B-18.6 F0.001 
(TAILSTOCK FEEDS UNTIL IT IS AGAINST CASTING) 
M00 

M31 (CONVEYOR FORWARD)

N2 T#801 M08 
(CNMG 432 AH120) 
(ROUGH TURN TO 1.900) 
G54 G50 S1500 
G96 S200 M03 
G00 Z0.6 
X2.1 
G71 P30 Q31 U0.005 D0.02 F0.007 
N30 G00 X1.9 
G01 Z-0.75 F0.005 
N31 G01 X2.1 F0.01 
G00 Z0.6 
G70 P30 Q31 
M97 P93552 
M01 

M33 (CONVEYOR STOP)

N3 T#802 
(VNMG 332 AH120) 
(ROUGH SPHERICAL RAD TO 1.868) 
G54 G50 S1500 
G96 S200 M03 
G00 Z0.55 
X1.9 M08 
G71 P40 Q41 U0.005 D0.015 F0.006 
N40 G01 X1.4034 Z0.5 F0.003 
G03 X1.4947 Z-0.695 R0.9604 
G01 Z-0.71 
N41 G01 X1.9 F0.01 
G00 Z0.5 
G70 P40 Q41 
M97 P93552 
M01 

N4 T#803 
(VNMG 332 AH120) 
(FINISH 1.858 SPHERICAL R) 
G54 G50 S1500 
G96 S200 M03 
G00 Z0.5 
X1.9 M08 
G01 X1.3984 F0.01 
G03 X1.4897 Z-0.695 R0.9604 F0.003 
G00 X2.1 
Z0.5 
X1.9 
G01 X1.3934 F0.01 
G03 X1.4847 Z-0.695 R0.9604 F0.003 
G00 X2.1 
M97 P93552 
M01 

N5 T#804
(HTN MW120319 01 323F) 
(ROUGH GROOVE TO 1.570 DIA) 
G54 G50 S1000 
G97 S750 M03 
G00 Z-0.1115 
X1.9 M08 
G96 S35 M03 
G01 X1.808 F0.0002 
U0.005 
G04 P1. 
G01 X1.758 
U0.005 
G04 P1. 
G01 X1.708 
U0.005 
G04 P1. 
G01 X1.658 
U0.005 
G04 P1. 
G01 X1.608 
U0.005 
G04 P1. 
G01 X1.57 
U0.005 
G01 X1.9 F0.01 
M97 P93552 
M01 

N6 T#805 
(KCTP-3R TC-60) 
(BREAK EDGES IN GROOVE .007 X 45 DEG) 
G54 G50 S1500 
G96 S200 M03 
G00 Z-0.183 
X1.9 M08 
G01 X1.809 F0.005 
X1.9 Z-0.137 F0.0005 
Z-0.183 F0.005 
X1.809 
X1.9 Z-0.229 F0.0005 
M97 P93552 
M01 

N7 T#806
(HTN MW120319 01 323F) 
(FINISH GROOVE .035 +/-.0015)
(X 1.565 +/-.005 TO SIZE)
G54 G50 S1000 
G97 S750 M03 
G00 Z-0.1115 
X1.9 M08 
G96 S65 M03 
G01 X1.6 F0.0005 
G96 S35 M03 
G01 X1.565 F0.0002 
G04 P0.5 
G01 U0.005 
G01 X1.9 F0.01 
M97 P93552 
M09 
G97 S1000 M03 
M09 T11 
G28 U0 
G28 W0 
M00

N7 (RETRACT TAILSTOCK) 
M19
G00 B-16. 
M30 


N90005 
(SUB-ROUTINE TO TRACK INSERT COUNT AND NOTIFY) 
(THE OPERATOR WHEN INSERTS NEED TO BE CHANGED)
#500= #500 + 1 
IF [ #500 EQ 1 ] THEN #501= #501 + 1 
IF [ #500 EQ 2 ] THEN #501= #501 + 1 
IF [ #500 EQ 3 ] THEN #500= 0 
IF [ #501 EQ 7 ] THEN #501= 0 
IF [ #501 EQ 0 ] THEN #500= 0 
IF [ #501 EQ 0 ] THEN T1212 
IF [ #501 EQ 0 ] THEN #3000= 16 (CHANGE FINISH INSERT) 
IF [ #500 EQ 0 ] THEN #3000= 15 (CHANGE ROUGH INSERTS) 

M99 



N90004 
(SUB-ROUTINE TO CHECK VARIABLE COUNT ON THE FINISH INSERT)
(IF VARIABLE COUNT EQUALS ZERO THEN CALL THE ATP SUB)
IF [ #501 EQ 0 ] THEN M97 P90006 
M99 



N90006 
(SUB-ROUTINE TO ACTIVATE THE ATP FOR)
(RE-SETTING THE FINISH TURN TOOL GEOMETRY)
G28 B0 
T#803 
M104 
G212 H3 
G28 
M105 
G99 
M99 



N93552 
(SUB-ROUTINE TO RAPID) 
(TO INDEXING POSITION) 
G00 G53 X-3. 
G00 G53 Z-13. 
M99 

%
