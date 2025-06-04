ASSUME CS:CODE, DS:DATA 
DATA SEGMENT 
    STR1 DB "INITIAL LIST:$" 
    STR2 DB "SORTED LIST:$"
     STR DB '$' 
     LIST DB 9,1,8,2,7 
     SB DB 0DH,0AH,'$'  ; Define the line break 
     DISPLAY MACRO MSG
      LEA DX,MSG 
     MOV AH,09H 
     INT 21H 
     ENDM 
     DATA ENDS
      CODE SEGMENT
         START:
          MOV AX,DATA
           MOV DS,AX; Display initial list
            DISPLAY STR2
             MOV SI,0
              LIST_BEFORE_SORT: 
              MOV AL,[LIST+SI] 
              ADD AL,30H 
              MOV DL,AL
               MOV AH,02H
                INT 21H
                 LEA DX,SB 
                 MOV AH,09H 
                 INT 21H 
                 INC SI
                  CMP SI,5 
                  JL LIST_BEFORE_SORT; Bubble sort algorithm 
                  MOV CX,5 
  OUT_LOOP:
   MOV SI,0
    MOV BX,CX
     IN_LOOP:
      MOV AL,[LIST+SI] 
      MOV DL,[LIST+SI+1]
       CMP AL,DL
        JC NO_SWAP 
        XCHG [LIST+SI],DL
         XCHG [LIST+SI+1],AL
          NO_SWAP:
           INC SI
            DEC BX
             JNZ IN_LOOP
              DEC CX
               JNZ OUT_LOOP; Display sorted list 
               DISPLAY STR2 
               MOV SI,0
                LIST_AFTER_SORT:
                 MOV AL,[LIST+SI]
                  ADD AL,30H 
                  MOV DL,AL
                   MOV AH,02H
                    INT 21H
                     LEA DX,SB
                      MOV AH,09H
                       INT 21H
                        INC SI
                         CMP SI,5
                          JL LIST_AFTER_SORT; Exit program
                           MOV AH,4CH
                            INT 21H
                             CODE ENDS 
                             END START
