org 100h
start:
mov bx,mas
mov cx,5
mov al,0


apelsin:
        cmp byte [bx],0
        jg afterzamena

        mov byte [bx],0
        add al,1
        add bx,1
afterzamena:
        add bx,1
        loop apelsin

        add al, 48
        mov dl, al
        mov ah, $02
        int 21h


        mov ah,$02
        mov dl,13
        int 21h

        mov ah,$02
        mov dl,10
        int 21h




        mov bx,mas
        mov cx,5
vivod:
        mov byte dl,[bx]
        add dl, 48
        mov ah, $02
        add bx,1
        int 21h
        loop vivod



        mov ah, $08
        int 21h

        ret



mas db -1,-2,3,-4,-5