        org 100h


        mov ah,$09
        mov dx, str1
        int 21h

        mov ah, $01
        int 21h

        mov bl,al
        sub bl,'0'

        mov ah, $02
        mov dl, 10
        int 21h

        mov ah,$09
        mov dx,str2
        int 21h

        mov ah, $01
        int 21h

        mov bh, al




        mov di,strmain

apelsin:
        mov si,strmain
        mov cl,0

startIf:
        cmp byte [si],'$'
        jne aftercheck
        jmp endIf
aftercheck:
        inc cl
        inc si
        jmp startIf
endIf:
        mov si, strmain
        movzx cx,cl

apelsin2:
        mov al, bh
        scasb
        je GG
        jmp @F
GG:
        add [di - 1], bl
@@:
        loop apelsin2

        mov ah, $02
        mov dl, 10
        int 21h

        mov ah, $09
        mov dx, strmain
        int 21h

        mov ax,$0C08
        int 21h






        ret
str2 db 'Vvedite simvol s kotorim sravnit: $'
str1 db 'Vvedite chislo: $'
strmain db 'Privet iz vvv$'