; STRING CASE CONVERSION UPPERCASE->LOWERCASE AND VICE VERSA

.MODEL SMALL

.STACK 100H

.DATA

STR DB 'hI aSSEMBLY lAnGUAGE 2022$'

.CODE   

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DI,0
    MOV AH,2
    
    ITERATE:
        MOV DL,STR[DI]
        CMP DL,'$'
        JE EXIT
        
        CMP DL,'A'
        JL NEXT
        
        CMP DL,'Z'
        JG LOWER_CASE
        
        ADD DL,32
        JMP NEXT
        
        LOWER_CASE:
            CMP DL,'a'
            JL NEXT
            
            CMP DL,'z'
            JG NEXT
            
            SUB DL,32
        
        NEXT:
            INT 21H
            INC DI
            JMP ITERATE
        
        
    EXIT:   
    
    ; DOC MODE TO WINDOWS MODE
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN