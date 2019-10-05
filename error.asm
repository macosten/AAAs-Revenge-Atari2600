game
.L00 ;  rem Generated 8/29/2019 9:06:07 PM by Visual bB Version 1.0.0.568

.L01 ;  rem **********************************

.L02 ;  rem *<filename>                      *

.L03 ;  rem *<description>                   *

.L04 ;  rem *<author>                        *

.L05 ;  rem *<contact info>                  *

.L06 ;  rem *<license>                       *

.L07 ;  rem **********************************

.
 ; 

.L08 ;  set kernel multisprite

.
 ; 

.
 ; 

.L09 ;  set romsize 2k

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L010 ;  macro setLowNibble

 MAC setLowNibble

.L011 ;  {1} =  (  ( {2} ^ {1} )  & $0F )  ^ {1}

; complex statement detected
	LDA {2}
	EOR {1}
	AND #$0F
	EOR {1}
	STA {1}
 ENDM
.
 ; 

.L012 ;  macro setHiNibble

 MAC setHiNibble

.L013 ;  {1} =  (  ( {2} * 4 * 4 ^ {1} )  & $F0 )  ^ {1}

; complex statement detected
	LDA {2}
	asl
	asl
	asl
	asl
	EOR {1}
	AND #$F0
	EOR {1}
	STA {1}
 ENDM
.
 ; 

.L014 ;  macro setPlayer0xy

 MAC setPlayer0xy

.L015 ;  player0x  =  {1}

	LDA {1}
	STA player0x
.L016 ;  player0y  =  {2}

	LDA {2}
	STA player0y
 ENDM
;.player0xy.  callmacro setPlayer0xy.
.L017 ;  def player0xy  =  callmacro setPlayer0xy

.
 ; 

.
 ; 

;.PEEK_lives.  a & $0F.
.L018 ;  def PEEK_lives  =  a & $0F

;.POKE_lives.  callmacro setLowNibble a.
.L019 ;  def POKE_lives  =  callmacro setLowNibble a

.
 ; 

;.PEEK_playerPosition.  a / 4 / 4.
.L020 ;  def PEEK_playerPosition  =  a / 4 / 4

;.POKE_playerPosition.  callmacro setHiNibble a.
.L021 ;  def POKE_playerPosition  =  callmacro setHiNibble a

.
 ; 

.L022 ;  dim blockedAreas  =  b

.
 ; 

;.PEEK_cooldown.  c & $0F.
.L023 ;  def PEEK_cooldown  =  c & $0F

;.POKE_cooldown.  callmacro setLowNibble c.
.L024 ;  def POKE_cooldown  =  callmacro setLowNibble c

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L025 ;  dim debugdisplay0 = score

.L026 ;  dim debugdisplay1 = score + 1

.L027 ;  dim debugdisplay2 = score + 2

.
 ; 

.L028 ;  const fontcharsHEX  =  1

.
 ; 

.
 ; 

.
 ; 

._startGame
 ; _startGame

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L029 ;  AUDV0  =  0  :  AUDV1  =  0

	LDA #0
	STA AUDV0
	STA AUDV1
.L030 ;  a  =  0  :  b  =  0  :  c  =  0  :  d  =  0  :  e  =  0  :  f  =  0  :  g  =  1  :  h  =  0

	LDA #0
	STA a
	STA b
	STA c
	STA d
	STA e
	STA f
	LDA #1
	STA g
	LDA #0
	STA h
.L031 ;  i  =  0  :  j  =  0  :  k  =  0  :  l  =  0  :  m  =  0  :  n  =  0  :  o  =  0  :  p  =  0

	LDA #0
	STA i
	STA j
	STA k
	STA l
	STA m
	STA n
	STA o
	STA p
.L032 ;  q  =  0  :  r  =  0  :  s  =  0

	LDA #0
	STA q
	STA r
	STA s
.
 ; 

.
 ; 

.L033 ;  player0xy 30 30

 setPlayer0xy #30, #30,
.L034 ;  player0:

	LDX #<playerL034_0
	STX player0pointerlo
	LDA #>playerL034_0
	STA player0pointerhi
	LDA #8
	STA player0height
.
 ; 

.L035 ;  if switchleftb then COLUP0  =  $9C else COLUP0  =  $A2

 bit SWCHB
	BVS .skipL035
.condpart0
	LDA #$9C
	STA COLUP0
 jmp .skipelse0
.skipL035
	LDA #$A2
	STA COLUP0
.skipelse0
.L036 ;  if

