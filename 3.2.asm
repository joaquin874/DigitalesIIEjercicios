    LIST    p=16f887
    #INCLUDE <p16f887.inc>
    
    NUM1    EQU	0x21
    NUM2    EQU	0x22
    CARRY   EQU	0x23
    SUM	    EQU	0x24
    
    
    ORG	    0x00  
    GOTO    MAIN
    ORG	    0x05
    
MAIN
    
    BCF	    STATUS,RP0
    BCF	    STATUS,RP1
    
    ;Cargo el numero 40h (64d) en la dirreccion 21h
    MOVLW   0x80
    MOVWF   NUM1
    ;Cargo el numero 20h (32d) en la dirreccion 22h
    MOVLW   0x90
    MOVWF   NUM2
    
    ;REALIZO LA OPERACION DE SUMA
    MOVFW   NUM1
    ADDWF   NUM2,W
    MOVWF   SUM
    MOVLW   0x01
    BTFSC   STATUS,C
    MOVWF   CARRY
    
    END