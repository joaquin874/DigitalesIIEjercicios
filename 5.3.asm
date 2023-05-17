    LIST	    P=16F887
    #INCLUDE	    <P16F887.INC>
    
    __CONFIG _CONFIG1, _FOSC_INTRC_NOCLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_ON
    
    __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    
    AUX	    EQU	    0x20
    CONT1   EQU	    0x21
    CONT2   EQU	    0x22
   
    ORG	    0x00
    GOTO    MAIN
    ORG	    0x04
    GOTO    ISR
    ORG	    0x05
    
MAIN
    
    BANKSEL TRISB
    MOVLW   0x06
    MOVFW   TRISB
    
    BANKSEL ANSELH
    CLRF    ANSELH
    
    BANKSEL PORTB
    CLRF    AUX
    MOVLW   .200
    MOVWF   CONT1
    CLRF    CONT2
    
    BANKSEL OPTION_REG
    MOVLW   0x87
    MOVWF   OPTION_REG
    
    MOVLW   0x20
    MOVWF   INTCON
    
    BANKSEL TMR0
    MOVLW   .61
    MOVWF   TMR0

BETA
    BTFSC   AUX,0
    GOTO    BETA
    
    BTFSS