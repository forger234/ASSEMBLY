ASSUME CS:CODE,DS:DATA
DATA SEGMENT
NUMLIST DB 01H,4H,9H,5H,2H
MSG DB 0AH, 0DH, 'LARGEST:$'
DATA ENDS
CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX
    MOV CX,05H
    MOV SI,OFFSET NUMLIST
    MOV AL,[SI]
AGAIN:
    MOV BL,[SI]
    CMP AL,BL
    JG NXT
    MOV AL,BL
NXT:
    INC SI
    DEC CX
    JNZ AGAIN
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    AAA
    ADD AX,3030H
    ADD DL,AL
    MOV AH,02H
    INT 21H
    MOV AH,4CH
    INT 21H
CODE ENDS
END START
