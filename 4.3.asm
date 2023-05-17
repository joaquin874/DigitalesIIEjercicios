    LIST	p=16f887
    #INCLUDE	<p16f887.inc>
    
    CONT    EQU	    0x20
    T1	    EQU	    0x30
    T2	    EQU	    0x31
    
    ORG	    0x00
    GOTO    MAIN
    ORG	    0x05
    
MAIN
    
    BANKSEL PORTA
    CLRF    PORTA
    CLRF    CONT
    
    BANKSEL ANSEL
    CLRF    ANSEL
    CLRF    ANSELH
    
    BANKSEL TRISB
    MOVLW   0xf0
    MOVFW   TRISB
    
    
;    CLRF    ANSEL
;    CLRF    ANSELH
    
    MOVLW   0xff
    MOVWF   TRISA
    CLRF    TRISB
    
ATRAS
    
    BTFSC   PORTA,4
    GOTO    ATRAS
    INCF    CONT
    CALL    DELAY
    MOVF    CONT,0
    MOVWF   PORTB
    
ATRAS2
    
    BTFSS   PORTA,4
    GOTO    ATRAS2
    GOTO    ATRAS
    
    
    
DELAY
    
    MOVLW   .2	    ;Valor p calculado
    MOVWF   T2

B2	
    MOVLW   .167	    ;Valor m calculado
    MOVWF   T1
			    ;Bucle 1
B1	
    DECFSZ  T1
    GOTO    B1
			    ;Bucle 2
    DECFSZ  T2
    GOTO    B2
	
    RETURN
    
    
    
    END