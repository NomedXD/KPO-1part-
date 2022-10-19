org 100h
start:
        mov ah,$09
        mov dx,strInput
        int 21h

        mov ah, $0a
        mov dx,buffer
        int 21h

       mov al,[buffer+9]
       mov dl,[buffer+8]
       mov [buffer+9], dl
       mov [buffer+8], al

        mov al,[buffer+2]
        mov dl,[buffer+5]
        sub al,dl
        mov dl,[buffer+6]
        sub dl,al
        mov [buffer+4],dl

        mov ah,2
        mov dl,10
        int 21h

        mov ah,$09
        mov dx,buffer+2
        int 21h

        mov ah,$08
        int 21h

    ret
strInput db "Input string   $"
buffer db 10,0, 10 dup(?),13,10,"$"