/*
 * Álvaro Iván Arcia González
 * Código pantalla LCD
 */


.include "m32def.inc" 
 
.CSEG 
.ORG $0000 

.def regEnvioInfor = r16
.def regUsoGeneral = r16
.def regDelay1 = r18
.def regDelay2 = r19
.def regDelay3 = r20

Start: 

	ldi regUsoGeneral,high(RAMEND)    
	out SPH, regUsoGeneral 
	ldi regUsoGeneral, low(RAMEND) 
	out SPL, regUsoGeneral 


	ldi regEnvioInfor, 0b11111111     
	out DDRA, regEnvioInfor
	; Establecemos el puerto C como salida
	; aunque solo será utilizado los 4 bits más 
	; significativos
	out DDRC, regUsoGeneral  
	out DDRD, regUsoGeneral 

 


ConfiguracionLCD: 

	rcall Loop50ms  
	ldi regEnvioInfor, 0b00110000   
	rcall SREnviarInfo  
	ldi regEnvioInfor, 0b00110000  
	rcall SREnviarInfo 
	rcall Loop100ms 
	ldi regEnvioInfor, 0b00110000 
	rcall SREnviarInfo 
	rcall Loop100ms    
	ldi regEnvioInfor, 0b00100000  
	rcall SREnviarInfo 
	ldi regEnvioInfor, 0b11000000 
	rcall SREnviarInfo 
	rcall Loop100ms 
	ldi regEnvioInfor, 0b00000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor, 0b10000000 
	rcall SREnviarInfo 
	 rcall Loop100ms 
	ldi regEnvioInfor, 0b00000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor, 0b00010000 
	rcall SREnviarInfo 
	rcall Loop100ms 
	ldi regEnvioInfor, 0b00000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor, 0b01100000 
	rcall SREnviarInfo 
	rcall Loop100ms 
	ldi regEnvioInfor, 0b00000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor, 0b11000000 
	rcall SREnviarInfo 
	rcall Loop100ms 


	 sbi PORTA,2  

Mensaje:      
	   
	
	/*T*/
	ldi regEnvioInfor,0b01010000  
	rcall SREnviarInfo
	ldi regEnvioInfor,0b01000000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*F*/
	ldi regEnvioInfor,0b01000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	rcall Loop100ms  
	
	/*G*/
	ldi regEnvioInfor,0b01000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b01110000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*Espacio*/
	ldi regEnvioInfor,0b00100000  
	rcall SREnviarInfo   
	ldi regEnvioInfor,0b00000000  
	rcall SREnviarInfo 
	rcall Loop100ms  

	/*A*/
	ldi regEnvioInfor,0b01000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00010000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*l*/
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b11000000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*v*/
	ldi regEnvioInfor,0b01110000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b01100000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*a*/
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00010000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*r*/
	ldi regEnvioInfor,0b01110000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00100000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*0*/
	ldi regEnvioInfor,0b01100000  
	rcall SREnviarInfo   
	ldi regEnvioInfor,0b11110000  ;
	rcall SREnviarInfo 
	rcall Loop100ms   

	/*Espacio*/
	ldi regEnvioInfor,0b00100000  
	rcall SREnviarInfo   
	ldi regEnvioInfor,0b00000000  
	rcall SREnviarInfo 
	rcall Loop100ms 
	 
	/*I*/
	ldi regEnvioInfor,0b01000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b10010000 
	rcall SREnviarInfo 
	rcall Loop100ms  
	
	/*v*/
	ldi regEnvioInfor,0b01110000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b01100000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*a*/
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00010000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	/*n*/
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b11100000  
	rcall SREnviarInfo 
	rcall Loop100ms 
	

	/****Limpiar pantalla****/

	cbi PORTA,2

	ldi regEnvioInfor,0b00000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00010000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	ldi regEnvioInfor,0b00000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00110000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	sbi PORTA,2

	/*Mensaje de nuevo*/

	/*T*/
	ldi regEnvioInfor,0b01010000  
	rcall SREnviarInfo
	ldi regEnvioInfor,0b01000000  
	rcall SREnviarInfo 
	rcall Loop500ms 

	/*F*/
	ldi regEnvioInfor,0b01000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	rcall Loop500ms 
	
	/*G*/
	ldi regEnvioInfor,0b01000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b01110000  
	rcall SREnviarInfo 
	rcall Loop500ms 

	/*Espacio*/
	ldi regEnvioInfor,0b00100000  
	rcall SREnviarInfo   
	ldi regEnvioInfor,0b00000000  
	rcall SREnviarInfo 
	rcall Loop500ms  

	/*A*/
	ldi regEnvioInfor,0b01000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00010000  
	rcall SREnviarInfo 
	rcall Loop500ms 

	/*l*/
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b11000000  
	rcall SREnviarInfo 
	rcall Loop500ms

	/*v*/
	ldi regEnvioInfor,0b01110000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b01100000  
	rcall SREnviarInfo 
	rcall Loop500ms 

	/*a*/
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00010000  
	rcall SREnviarInfo 
	rcall Loop500ms 

	/*r*/
	ldi regEnvioInfor,0b01110000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00100000  
	rcall SREnviarInfo 
	rcall Loop500ms

	/*0*/
	ldi regEnvioInfor,0b01100000  
	rcall SREnviarInfo  
	ldi regEnvioInfor,0b11110000  
	rcall SREnviarInfo 
	rcall Loop500ms
	
	/*Espacio*/
	ldi regEnvioInfor,0b00100000  
	rcall SREnviarInfo   
	ldi regEnvioInfor,0b00000000  
	rcall SREnviarInfo 
	rcall Loop500ms 
	 
	/*I*/
	ldi regEnvioInfor,0b01000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b10010000 
	rcall SREnviarInfo 
	rcall Loop500ms 
	
	/*v*/
	ldi regEnvioInfor,0b01110000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b01100000  
	rcall SREnviarInfo 
	rcall Loop500ms

	/*a*/
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00010000  
	rcall SREnviarInfo 
	rcall Loop500ms

	/*n*/
	ldi regEnvioInfor,0b01100000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b11100000  
	rcall SREnviarInfo 
	rcall Loop500ms
	
	rcall Loop1s
	/****Limpiar pantalla****/

	cbi PORTA,2

	ldi regEnvioInfor,0b00000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00010000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	ldi regEnvioInfor,0b00000000 
	rcall SREnviarInfo 
	ldi regEnvioInfor,0b00110000  
	rcall SREnviarInfo 
	rcall Loop100ms 

	sbi PORTA,2

	rjmp Mensaje   ;Bucle infinito 
 

SREnviarInfo:   

	sbi PORTD, 6  
	out PORTC, regEnvioInfor  
	cbi PORTD, 6 
	ret   
	



Loop100ms: 

		ldi  regDelay1, 130
		ldi  regDelay2, 222
	L1: dec  regDelay2
		brne L1
		dec  regDelay1
		brne L1
		nop
		ret 


Loop100us:  
       
		ldi  regDelay1, 33
	L2: dec  regDelay1
		brne L2
		nop
		ret

		


Loop500ms:

    ldi  regDelay1, 3
    ldi  regDelay2, 8
    ldi  regDelay3, 120
L3: dec  regDelay3
    brne L3
    dec  regDelay2
    brne L3
    dec  regDelay1
    brne L3
	ret

Loop1s:

    ldi  regDelay1, 6
    ldi  regDelay2, 19
    ldi  regDelay3, 174
L4: dec  regDelay3
    brne L4
    dec  regDelay2
    brne L4
    dec  regDelay1
    brne L4
    rjmp PC+1
	ret