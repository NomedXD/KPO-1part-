        org 100h
Start:
        mov ah, $09
        mov dx, strMain
        int 21h

        mov ah, $02
        mov dl, 10
        int 21h

        mov ah, $09
        mov dx, strInput
        int 21h

        mov ah, $01
        int 21h
        mov ch, al

        mov ah, $02
        mov dl, 10
        int 21h

        mov bx, strMain
        mov cl, 0

        ;save string length in cl
startIf1:
        cmp byte [bx], '$'
        jne @F
        jmp endIf1
@@:
        inc cl
        inc bx
        jmp startIf1
endIf1:

        mov di, strMain
        mov al, ch
startIf2:
        scasb
        je @F
        jmp startIf2
@@:
        mov bx, 0
startIf3:
        scasb
        je @F
        inc bx
        jmp startIf3
@@:

endIf4:
        add bl, '0'
        mov ah, $02
        mov dl, bl
        int 21h


        mov ax, $0C08
        int 21h

        ret
strInput  db  'Input character: $'
strMain  db  'i aa le premiero$'