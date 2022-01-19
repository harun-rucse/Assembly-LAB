; Input a single character and print it

.MODEL SMALL

.STACK 100H

.DATA

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H ;input a character and put it in AL
    
    MOV AH,2 
    MOV DL,AL ;copy AL into DL for print
    INT 21H ;print from DL
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN