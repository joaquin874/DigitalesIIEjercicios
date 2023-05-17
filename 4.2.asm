    LIST P=16F887
    #INCLUDE    <P16F887.INC>
    
    T1	EQU	0x30
    T2	EQU	0x31
	
    ORG	    0x00
    GOTO    MAIN
    ORG	    0x05
    
MAIN
    ; TRISA 00010000	10
    ; TRISB 00000001	01
    ; RA4 VA A PRENDER RB2
    ; RB0 VA A PRENDER RB3
    ; LIMPIAMOS EL PORTA Y PORTB
    BANKSEL PORTA
    CLRF    PORTA
    CLRF    PORTB
    
    ; CONFIGURAMOS COMO I/O DIGITAL A LOS 2 PUERTOS
    BANKSEL ANSEL
    CLRF    ANSEL
    CLRF    ANSELH
    
    ; CONFIGURAMOS LOS PUERTOS A Y B
    BANKSEL TRISA
    MOVLW   0x10
    MOVWF   TRISA
    
    MOVLW   0x01
    MOVWF   TRISB
    ; SIEMPRE ES MEJOR DEJAR COMO SALIDA A LOS PINES QUE NO VAMOS A UTILIZAR
    ; POR ESO TRISB SE SETEA EN 0x00
    
LOOP
    
    BANKSEL PORTA
    ; COMO SIEMPRE ESTA EN 1 LA ENTRADAS ENTONCES TESTEO
    ; QUE PARA QUE SE SALTEEN EL GOTO CUANDO LOS PULSADORES ESTEN EN 1
    BTFSS   PORTA,4
    GOTO    LEDRB2
    
    BTFSS   PORTB,0
    GOTO    LEDRB3
    
    GOTO    LOOP
    
LEDRB2
    
    BSF	    PORTB,2
    CALL    DELAY
    BCF	    PORTB,2
    GOTO    LOOP
    
LEDRB3
    
    BSF	    PORTB,3
    CALL    DELAY
    BCF	    PORTB,3
    GOTO    LOOP

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