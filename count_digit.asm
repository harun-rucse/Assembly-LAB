; COUNT NUMBER OF DIGIT IN THE STRING

.MODEL SMALL

.STACK 100H

.DATA

VAR DB 'HARUN2022$'
COUNT DB '0'

.CODE   

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DI,0 ;destination index initialize to 0
    
    ITERATE:
        CMP VAR[DI],'$'
        JE EXIT
        
        CMP VAR[DI],'0'
        JL NEXT
        
        CMP VAR[DI],'9'
        JG NEXT
        
        INC COUNT
        
        NEXT:
            INC DI
            JMP ITERATE
    
    EXIT:
    
    MOV AH,2
    MOV DL,COUNT
    INT 21H 
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN