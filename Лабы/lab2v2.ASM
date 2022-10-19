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
        cmp al, 'A'
        jb error
        cmp al, 'Z'
        ja error


        mov al, [buffer + 1]     ;Проверка последнего символа
        mov bx, buffer+1
        movzx ax, al
        add bx,ax
        mov al,[bx]
        cmp al,'A'
        jb error
        cmp al,'Z'
        ja error

finish:
        mov ah,$09
        mov dx,str3
        int 21h
        jmp finishmain

error:
        mov ah,$09
        mov dx,str2
        int 21h

finishmain:
        mov ah,$08
        int 21h
        ret


str1 db "Input string",13,10,'$'
buffer db 7,0,7 dup (?)
str2 db "NO$"
str3 db "YES$"