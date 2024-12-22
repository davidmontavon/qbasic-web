


' *****************************
' Déclarations des procédures :
' *****************************

DECLARE SUB SOMMAIRE ()
DECLARE SUB sol ()
DECLARE SUB bignose ()
DECLARE SUB bombe ()
DECLARE SUB AIDE ()

SOMMAIRE

' **************************************
' Déclarations des tableaux graphiques :
' **************************************

DIM tbloc(200)
DIM rednose(200)
DIM boum(200)

' ****************************
' Déclarations des variables :
' ****************************

DIM X AS INTEGER
DIM Y AS INTEGER
DIM c AS STRING
DIM B AS INTEGER
DIM D AS INTEGER
DIM W AS INTEGER

' **************
' Mode d'écran :
' **************

SCREEN 7

' ***********
' Variables :
' ***********

RANDOMIZE TIMER

X = 50
Y = 50
B = 0
D = 0
S = 0

' *******************************
' Enregistrement des graphiques :
' *******************************

bignose
GET (37, 50)-(61, 79), rednose
CLS
bombe
GET (30, 30)-(60, 60), boum
CLS
sol
GET (0, 0)-(150, 5), tbloc

' **********************
' Positions graphiques :
' **********************

PUT (X, Y), rednose
PUT (150, 30), tbloc

' *******************
' Boucle principale :
' *******************

DO

LOCATE 15, 5
PRINT "SCORE : "; S
PRINT
PRINT "APPUYEZ SUR Q POUR REVENIR AU MENU"

PUT (B, D), boum
SLEEP .6
CLS
D = D + 4
IF D = 24 AND X = B + 10 THEN
SOUND 200, 1
S = S + 10
D = 0
W = INT(RND * 4)
IF W < 3 THEN B = B + 60
IF W = 3 THEN B = B - 60
IF B < 1 THEN B = 0
IF B > 260 THEN B = 0
END IF
IF D > 51 THEN
PLAY "T200 >b64a64g64f64e64d64c64"
GOTO 66
END IF
PUT (X, Y), rednose
sol

LOCATE 15, 5
PRINT "SCORE : "; S

' clavier :

c = INKEY$
IF c = "q" OR c = "Q" THEN
GOTO 66
END IF
IF c = CHR$(0) + CHR$(77) THEN
X = X + 15
IF X > 250 THEN X = 10
IF X < 10 THEN X = 250
CLS
sol
PUT (X, Y), rednose
END IF
IF c = CHR$(0) + CHR$(75) THEN
X = X - 15
IF X > 250 THEN X = 10
IF X < 10 THEN X = 250
CLS
sol
PUT (X, Y), rednose
END IF
LOOP

' ******************
' Fin du programme :
' ******************

66
CLS
SOMMAIRE



SUB AIDE
CLS
SCREEN 13
COLOR 40
PRINT "+--------------------------------------+"
COLOR 42
PRINT "| AIDE DE BIGNOSE BOMB |"
COLOR 44
PRINT "+--------------------------------------+"
PRINT ""
COLOR 46
PRINT "CREDITS................................."
COLOR 51
PRINT "Programmation du jeu: David Montavon"
COLOR 52
PRINT "Programmation du menu: Patrick Monnin"
COLOR 55
PRINT " David Montavon"
PRINT
COLOR 35
PRINT "MERCI..................................."
COLOR 37
PRINT "Merci d'avoir acheté le jeu BigNose Bomb"
COLOR 40
PRINT "Le team TYPEMPROG espère qu'il vous"
COLOR 42
PRINT "plaira."
PRINT
COLOR 44
PRINT "BUT DU JEU.............................."
COLOR 46
PRINT "Le but du jeu est de faire rebondir la"
COLOR 51
PRINT "bombe sur le chapeau de BigNose. "
COLOR 52
PRINT "Si la bombe touche le sol brûlant, elle"
COLOR 55
PRINT "explose, et vous avec. Vous pouvez vous"
COLOR 35
PRINT "diriger avec les flèches du clavier."
PRINT
COLOR 37
PRINT "CONTACT................................."
COLOR 40
PRINT "contact@cdsinfo.ht.st, (078) 821 94 50"
SLEEP
END SUB

SUB bignose
LINE (45, 50)-(50, 50), 1
LINE (44, 51)-(44, 51), 1
LINE (43, 52)-(43, 52), 1
LINE (42, 53)-(42, 58), 1
LINE (51, 51)-(51, 51), 1
LINE (52, 52)-(52, 52), 1
LINE (53, 53)-(53, 58), 1
LINE (40, 58)-(55, 58), 1
LINE (42, 57)-(53, 57), 1
LINE (42, 56)-(53, 56), 1
LINE (50, 59)-(55, 59), 4
LINE (49, 60)-(56, 60), 4
LINE (48, 61)-(57, 61), 4
LINE (49, 62)-(56, 62), 4
LINE (50, 63)-(55, 63), 4
LINE (49, 63)-(47, 63), 7
LINE (56, 63)-(58, 63), 7
LINE (46, 64)-(59, 64), 7
LINE (46, 65)-(59, 65), 7
LINE (45, 66)-(51, 66), 7
LINE (60, 66)-(54, 66), 7
LINE (40, 59)-(41, 59), 6
LINE (39, 60)-(39, 62), 6
LINE (40, 63)-(41, 63), 6
LINE (39, 61)-(40, 61), 6
LINE (39, 62)-(40, 62), 6
LINE (42, 59)-(42, 63), 7
LINE (43, 59)-(43, 62), 7
LINE (44, 59)-(44, 60), 7
LINE (45, 59)-(49, 59), 6
LINE (45, 60)-(48, 60), 6
LINE (44, 61)-(47, 61), 6
LINE (44, 62)-(48, 62), 6
LINE (43, 63)-(46, 63), 6
LINE (42, 64)-(45, 64), 6
LINE (42, 65)-(45, 65), 6
LINE (43, 66)-(44, 66), 6
LINE (52, 66)-(53, 66), 6
LINE (44, 67)-(53, 67), 6
LINE (44, 68)-(52, 68), 14
LINE (44, 69)-(52, 69), 14
LINE (44, 70)-(53, 70), 14
LINE (44, 71)-(53, 71), 14
LINE (44, 72)-(53, 72), 14
LINE (44, 73)-(53, 73), 14
LINE (44, 74)-(53, 74), 14
LINE (43, 70)-(43, 75), 14
LINE (44, 75)-(53, 75), 14
LINE (45, 69)-(38, 73), 14
LINE (48, 69)-(41, 73), 14
LINE (38, 73)-(41, 73), 14
LINE (41, 72)-(41, 72), 14
LINE (46, 69)-(39, 73), 14
LINE (53, 70)-(56, 70), 14
LINE (53, 69)-(57, 69), 14
LINE (53, 71)-(56, 71), 14
LINE (56, 69)-(58, 67), 14
LINE (57, 70)-(59, 68), 14
LINE (57, 71)-(59, 69), 14
LINE (37, 74)-(41, 74), 6
LINE (37, 75)-(41, 75), 6
LINE (57, 68)-(61, 68), 6
LINE (57, 67)-(61, 67), 6
LINE (61, 66)-(61, 66), 6
LINE (45, 76)-(39, 79), 1
LINE (48, 76)-(48, 76), 1
LINE (39, 79)-(43, 79), 1
LINE (43, 79)-(47, 76), 1
LINE (49, 76)-(50, 77), 1
LINE (50, 78)-(51, 78), 1
LINE (51, 76)-(52, 76), 1
LINE (52, 77)-(53, 77), 1
LINE (53, 78)-(54, 78), 1
LINE (53, 79)-(51, 79), 1
LINE (53, 79)-(55, 77), 1
LINE (55, 77)-(55, 76), 1
LINE (54, 78)-(54, 77), 1
LINE (54, 77)-(54, 76), 1
LINE (53, 77)-(53, 77), 1
END SUB

SUB bombe
CIRCLE (50, 50), 10, 8
CIRCLE (45, 46), 1, 8
LINE (47, 41)-(53, 37), 8, B
LINE (50, 36)-(50, 34), 6
PSET (51, 33), 6
PSET (52, 32), 6
END SUB

SUB sol
LINE (0, 80)-(300, 86), 4, BF
END SUB

SUB SOMMAIRE
300 CLS
SCREEN 13
COLOR 40
PRINT " BigNose Bomb"
LINE (0, 10)-(320, 10), 42
PRINT
PRINT
COLOR 44
PRINT "[N]ouvelle partie"
COLOR 46
PRINT "[A]ide"
COLOR 51
PRINT "[Q]uitter"
DO
c$ = INKEY$
IF c$ = "n" THEN GOTO 200
IF c$ = "N" THEN GOTO 200
IF c$ = "a" THEN GOTO 100
IF c$ = "A" THEN GOTO 100
IF c$ = "q" THEN END
IF c$ = "Q" THEN END


LOOP
100 AIDE
GOTO 300

200
END SUB
