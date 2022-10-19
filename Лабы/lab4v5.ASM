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

        mov dl,10
        mov al,bl
        movzx ax,al
        div dl

        mov dl,al
        add dl,48
        mov cl,ah
        add cl,48
        mov ah,$02
        int 21h

        mov dl,cl
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

        mov dl,10
        mov al,bh
        movzx ax,al
        div dl

        mov dl,al
        add dl,48
        mov cl,ah
        add cl,48
        mov ah,$02
        int 21h

        mov dl,cl
        mov ah,$02
        int 21h

        mov ah, $08
        int 21h

        ret


mas db 10,1,10,15,10,8
str1 db 'Sum Chet $'
str2 db 'SumNeChet $'