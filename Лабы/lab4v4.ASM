org 100h
start:
        mov dl,2
        mov bh,0
        mov bl,0
        mov cx,6
        mov si,mas
apelsin:
        mov al,[si]
        div dl
        cmp ah,0
        je addifchet
        jg addifnechet



addifchet:
        add bh,[si]
        add si,1
        jmp afteradd

addifnechet:
        add bl,[si]
        add si,1

afteradd:
        loop apelsin

        mov ah, $09
        mov dx, str2
        int 21h

        add bh, '0'
        mov dl,bh
        mov ah,$02
        int 21h

        mov ah,$02
        mov dl,13
        int 21h

        mov ah,$02
        mov dl,10
        int 21h

        mov ah, $09
        mov dx, str1
        int 21h

        add bl, '0'
        mov dl,bl
        mov ah,$02
        int 21h

        mov ah, $08
        int 21h

        ret


mas db 12,13,16,10,4,8
str1 db 'Sum Chet $'
str2 db 'SumNeChet $'