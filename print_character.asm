; Print a single character

.MODEL SMALL

.STACK 100H

.DATA
    NUMBER DB 'A'

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,2
    MOV DL,NUMBER
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN