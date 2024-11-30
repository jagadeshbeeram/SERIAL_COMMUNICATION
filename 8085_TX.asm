MVI A, 0B0H;A as input and B as output
OUT 083H
LOOP2: MVI A, 009H
       OUT 083H
       MVI A, 0EH
       SIM
       EI
       JMP LOOP2

OUTPUT: IN 080H
        OUT 081H
	OUT 20H
        MVI B, 000H
        STA 0FE75H
        CALL 00578H
TX_LOOP: IN 21H
        ANI 01H
        JZ TX_LOOP      
RET