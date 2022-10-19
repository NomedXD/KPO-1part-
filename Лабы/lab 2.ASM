org 100h
start:
        mov ah,$09
        mov dx,str1
        int 21h

        mov ah,$0a
        mov dx,buffer
        int 21h

        mov ah,$02
        mov dl,13
        int 21h

        mov ah,$02
        mov dl,10
        int 21h

        mov al,[buffer+1] ;Проверка на длину равной 6
        cmp al,6
        jnz error

        mov al,[buffer+4]  ; Проверка на равенство 3-го и 4-го символа
        mov bl,[buffer+5]
        cmp al,bl

        jnz error

        mov al, [buffer + 5] ;Проверка на буквы в 4 позиции
        cmp al, 65
        js error
        cmp al, 90
        jns error
next1:
        mov bx, buffer + 2     ;Проверка последнего символа
        add bl, [buffer + 1]
        movzx bx, bl
        cmp byte [bx],'A'
        jb error
        cmp byte [bx],'Z'
        ja lowcasebl
next2:
        mov ah,$09
        mov dx, str3
        int 21h
        jmp finish



lowcaseal:
        cmp al,'a'
        jb error
        cmp al, 'z'
        ja error
        jmp next1

lowcasebl:
        movzx bx, bl
        cmp byte [bx],'a'
        jb error
        cmp byte [bx], 'z'
        ja error
        jmp next2

finish:
        mov ah,$09
        mov dx,str3
        int 21h
        jmp finishmain

error:
        mov ah,$09
        mov dx,str2
        int 21h
        jmp  finishmain



finishmain:
        mov ah,$08
        int 21h

        ret


str1 db "Input string",13,10,'$'
buffer db 7,0,7 dup (?)
str2 db "NO$"
str3 db "YES$"