MVI A, 0B0H           ; A as input and B as output
OUT 083H              ; send to control word
LOOP2: MVI A, 009H    
       OUT 083H       ;send to control word
       MVI A, 0EH     ;masking all other interrupt except 5.5
       SIM
       EI             ;interrupt enable
       JMP LOOP2

;display routinue that should be wriiten at 9000H in 8085
OUTPUT: IN 080H       ;input from port A
        OUT 081H      ;output on port B
	OUT 20H		;output on serial terminal
        MVI B, 000H	;for making DP point not display
        STA 0FE75H      ;storing A for showing ascii value on 8085 display
        CALL 00578H
TX_LOOP: IN 21H         ;checking loop for a full byte is transmitted
        ANI 01H
        JZ TX_LOOP      
RET
