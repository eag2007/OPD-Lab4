; Код ассемблер БЭВМ для доп задания 4 лабораторной
; Написать КП, реализующий сложение 3 знаковых чисел, где ПП их складывает, 
; а П их просто передает аргументы ПП.
; ВАЖНО: использоваться команды CALL и RET нельзя, из надо реализовать через 
; другие команды. Придумать как именно.


ORG 0x3FD
RESULT: WORD 0x1222
X:      WORD 0x1333
Y:      WORD 0x0008
Z:      WORD 0xFFFF

ORG 0x401
R1:     WORD 0x40B
R2:     WORD 0x410
R3:     WORD 0x415

ORG 0x404
START:  CLA
        ST $RESULT

        LD $R1
        PUSH
        LD $X
        PUSH
        JUMP $FUNC

        LD $R2
        PUSH
        LD $Y
        PUSH
        JUMP $FUNC

        LD $R3
        PUSH
        LD $Z
        PUSH
        JUMP $FUNC

ORG 0x600
FUNC:   POP
        ADD $RESULT
        ST $RESULT
        POP
        ST TMP
        JUMP (TMP)
TMP:    WORD 0x0000