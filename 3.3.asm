    LIST    p=16f887
    #INCLUDE <p16f887.inc>
    
    NUMA    EQU	0x21
    NUMB    EQU	0x22
    NUMC    EQU	0x23
    RESP    EQU	0x24
    CARRY   EQU	0x25
    
    ORG	    0x00  
    GOTO    MAIN
    ORG	    0x05
    
MAIN
    BCF	    STATUS,RP0
    BCF	    STATUS,RP1
    MOVLW   0x20
    MOVWF   NUMA
    MOVLW   0x40
    MOVWF   NUMB
    MOVLW   0x60
    MOVWF   NUMC
    
    ;PRIMERO REALIZO C - B
    
    MOVF    NUMB,W
    SUBWF   NUMC,W
    ADDWF   NUMA,W
    MOVWF   RESP
    BTFSC   STATUS,C
    GOTO    CARRYON

CARRYON
    
    MOVLW   0x01
    MOVWF   CARRY
    
    NOP
    END
    