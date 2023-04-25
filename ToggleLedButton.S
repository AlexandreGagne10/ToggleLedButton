#define __SFR_OFFSET 0

#include "avr/io.h"

.global setup
.global main        ; (global) déclare la fonction main comme globale

main:
    SBI DDRB, 7
    CBI DDRF, 7

LOOP:
    SBIS PINF, 7 ; Si la pin 7 du portF est à LOW, la led clignote
    CALL CLIGNOTEMENT
    CBI PORTB, 7
    RJMP LOOP

CLIGNOTEMENT:
    SBI PORTB, 7
    CALL DELAY
    CBI PORTB, 7
    CALL DELAY

DELAY:
    LDI R16, 10
D0: LDI R17, 255
D1: LDI R18, 255
D2: NOP
    NOP
    DEC R18
    BRNE D2
    DEC R17
    BRNE D1
    DEC R16
    BRNE D0
    RET