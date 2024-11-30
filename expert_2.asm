;ORG 0000H 
;LJMP MAIN 
;ORG 0023H ; serial port interrupt entry 
;LJMP SPISR
;ORG 3000H
;MAIN:  MOV DPTR,#09000H
;	  MOV TMOD,#20H 
;      MOV TH1, #-3
;      SETB TR1 
;      MOV SCON, #50H   
;      MOV IE, 90H 
;HERE: SJMP HERE
ORG 3000H
		MOV DPTR,#4000H
MAIN: 	

		LCALL 1A14H      ;for geting data onto accumulator from RS 232 port
		MOVX @DPTR,A
		MOV R0,#020
LOOP:   INC DPTR
		MOV A,#20H
		MOVX @DPTR,A
		DJNZ R0,LOOP
		MOV R0,#020
LOOP2: 	MOV A, DPL  
		CLR C
		SUBB A,#01
		MOV DPL, A       
		MOV A, DPH        
		SUBB A, #0        
		MOV DPH, A 
		DJNZ R0,LOOP2
		LCALL 0A3CH
		MOV R0,#019
LOOP3: 	MOV A, DPL  
		CLR C
		SUBB A,#01
		MOV DPL, A       
		MOV A, DPH        
		SUBB A, #0        
		MOV DPH, A 
		DJNZ R0,LOOP3
		LJMP MAIN
ORG 4000H
TB1: DB   20H,45H,20H,20H,20H,20H,20H,20H,20H,20H,20H,20H,20H, 20H,20H,20H,20H,20H,20H,20H
END
