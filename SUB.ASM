ASSUME CS:CODE,DS:DATA
DATA SEGMENT
MSG1 DB 0AH,0DH,"ENTER FIRST NUMBER:$"
MSG2 DB 0AH,0DH,"ENTER SECOND NUMBER:$"
MSG3 DB 0AH,0DH,"DIFFERENCE IS:$"
MSG4 DB 0AH,0DH,"DIFFERENCE IS NEGATIVE:$"
DATA ENDS
CODE SEGMENT
START:
MOV AX,DATA
MOV DS,AX

LEA DX,MSG1
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
MOV BH,AL;////
MOV AH,01H
INT 21H
MOV BL,AL

LEA DX,MSG2
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
MOV CH,AL;//
MOV AH,01H
INT 21H
MOV CL,AL

CMP CX,BX;cx-bx=value=0 annel equal annu
JZ ZERO
JNC NEGATIVE;jumpif not carry
CLC;clear carry flag
MOV AH,00H
MOV AL,BL
SUB AL,CL
AAS
MOV CL,AH
ADD AL,30H
MOV BL,AL
MOV AH,00H
SUB BH,CH
MOV AL,BH
AAS
ADD AL,CL
ADD AL,30H
MOV BH,AL
JMP DISPO
NEGATIVE:
                MOV AL,CL
                MOV AH,00H
                SUB AL,BL
                AAS
                MOV BL,AH
                ADD AL,30H
                MOV CL,AL
                MOV AH,00H
                SUB CH,BH
                MOV AL,CH
                AAS
                ADD AL,BL
                ADD AL,30H
                MOV CH,AL
                LEA DX,MSG4
                MOV AH,09H
                INT 21H
                MOV DL,CH
                MOV AH,02H
                INT 21H
                MOV DL,CL
                MOV AH,02H
                INT 21H
                JMP FULL
ZERO:
        LEA DX,MSG3
        MOV AH,09H
        INT 21H
        
        MOV AX,BX
        SUB AX,CX
        MOV BH,AH
        ADD AL,30H
        MOV DL,AL
        MOV AH,02H
        INT 21H
        ADD BH,30H
        MOV DL,BH
        MOV AH,02H
        INT 21H
        JMP FULL
DISPO:
LEA DX,MSG3
MOV AH,09H
INT 21H
MOV AH,02H

MOV DL,BH
INT 21H
MOV AH,02H

MOV DL,BL
INT 21H
MOV AH,02CH

INT 21H
FULL:

MOV AH,4CH
INT 21H
CODE ENDS
END START