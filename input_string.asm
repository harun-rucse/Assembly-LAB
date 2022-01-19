; SCAN STRING AND THEN PRINT THIS STRING

.MODEL SMALL

.STACK 100H

.DATA

MSG DB 50 DUP(?)

.CODE   

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    MOV DI,0
    
    ; SCAN THE STRING
    SCAN:
        INT 21H
        CMP AL,0DH
        JZ EXIT
        
        MOV MSG[DI],AL
        INC DI
        JMP SCAN 
        
    EXIT:
    ; ADD $ SO THAT WE CAN PRINT AS A STRING 
    MOV MSG[DI],'$'
    
    ; NEW LINE
    MOV AH,2
    MOV DL,0DH
    INT 21H
    
    MOV DL,0AH
    INT 21H 
    
    ; PRINT MSG STRING
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    ; DOC MODE TO WINDOWS MODE
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN