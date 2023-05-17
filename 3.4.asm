   LIST    p=16f887
   #INCLUDE <p16f887.inc>
    
   NUMA1   EQU	0x20
   NUMA2   EQU	0x21
   NUMB1   EQU	0x22
   NUMB2   EQU	0x23
   RES1    EQU	0x24
   RES2    EQU	0x25
   CARRY   EQU	0x26
   
   ORG	    0x00
   GOTO	    MAIN
   ORG	    0x05
   
MAIN
   BCF	    STATUS,RP0
   BCF	    STATUS,RP1
   MOVLW    0x30
   MOVWF    NUMA1
   MOVWF    NUMA2
   MOVLW    0x15
   MOVWF    NUMB1
   MOVWF    NUMB2
   
   GOTO	    SUMA
   
SUMA
   
   MOVF	    NUMA1,W
   ADDWF    NUMB1,W
   MOVWF    RES1
   MOVLW    0x01
   BTFSC    STATUS,C
   ADDWF    NUMA2,F
   BCF	    STATUS,C
   MOVF	    NUMA2,W
   ADDWF    NUMB2,W
   MOVWF    RES2
   MOVLW    0x01
   BTFSC    STATUS,C
   MOVWF    CARRY
   NOP
   END
   