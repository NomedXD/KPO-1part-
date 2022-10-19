        org 100h
        include 'MACRO/PROC16.INC'

;color enum
ColorBlue = $09
ColorLazure = $03
ColorBlack = $00
ColorDarkBlue = $01
ColorWhite = $0F
ColorPink = $26

Start:

        ;draw white phone
        mov ah,0fh
        int 10h
        mov [bOldMode],al
        mov [bOldPage],bh
 
        mov ax,$0013
        int 10h
 
        push $a000
        pop es
        mov al,$0f
        xor di,di
        mov cx,320*200
.colloop:
        stosb
        loop .colloop

        ;-----------------------------------------------
        ;draw head
        stdcall DrawRect, 10, 100, 60, 10, ColorBlue
        stdcall DrawRect, 20, 90, 80, 10, ColorBlue
        stdcall DrawRect, 30, 80, 100, 10, ColorBlue
        stdcall DrawRect, 40, 70, 120, 70, ColorBlue
        stdcall DrawRect, 100, 70, 10, 10, ColorLazure
        stdcall DrawRect, 100, 180, 10, 10, ColorLazure
        stdcall DrawRect, 110, 80, 100, 10, ColorLazure

        ;------------------------------------------------
        ;draw nose
        stdcall DrawRect, 80, 110, 40, 15, ColorDarkBlue
        stdcall DrawRect, 73, 120, 20, 10, ColorDarkBlue

        ;-------------------------------------------------
        ;draw eyes
        ;1-st eye
        stdcall DrawRect, 50, 80, 30, 30, ColorLazure
        stdcall DrawRect, 40, 86, 17, 50, ColorLazure
        stdcall DrawRect, 50, 85, 20, 30, ColorBlack

        ;2-nd eye
        stdcall DrawRect, 50, 150, 30, 30, ColorLazure
        stdcall DrawRect, 40, 156, 17, 50, ColorLazure
        stdcall DrawRect, 50, 155, 20, 30, ColorBlack


        ;--------------------------------------------
        ;zrachki
        ;1-st zrachok
        stdcall DrawRect, 55, 85, 10, 10, ColorWhite

        ;2-nd zrachok
        stdcall DrawRect, 55, 155, 10, 10, ColorWhite


        ;--------------------------------------------
        ;ears
        ;1-st ear
        stdcall DrawRect, 50, 60, 10, 70, ColorBlue
        stdcall DrawRect, 60, 50, 10, 70, ColorBlue
        stdcall DrawRect, 60, 40, 10, 70, ColorBlue
        stdcall DrawRect, 65, 30, 10, 60, ColorBlue
        stdcall DrawRect, 75, 40, 20, 40, ColorPink

        ;2-nd ear
        stdcall DrawRect, 50, 190, 10, 70, ColorBlue
        stdcall DrawRect, 60, 200, 10, 70, ColorBlue
        stdcall DrawRect, 60, 210, 10, 70, ColorBlue
        stdcall DrawRect, 65, 220, 10, 60, ColorBlue
        stdcall DrawRect, 75, 200, 20, 40, ColorPink


        ;----------------------------------------------
        ;body
        stdcall DrawRect, 120, 90, 80, 30, ColorBlue
        stdcall DrawRect, 150, 100, 60, 15, ColorBlue
        stdcall DrawRect, 160, 90, 80, 10, ColorBlue

        ;hands
        ;hand1
        stdcall DrawRect, 125, 80, 10, 25, ColorBlue

        ;hand2
        stdcall DrawRect, 125, 170, 10, 25, ColorBlue


        ;-----------------------------------------------
        ;stomach
        stdcall DrawRect, 125, 105, 50, 25, ColorLazure
        stdcall DrawRect, 130, 95, 70, 10, ColorLazure
        stdcall DrawRect, 140, 115, 30, 15, ColorLazure



        ;wait
        mov ax, $0C08
        int 21h
        test al, al
        jnz @F
        mov ah, $08
        int 21h
@@:

        ret
proc DrawRect uses bx si di bp,\
                   Line, Displacement, Width, Height, Color
        mov dx, [Height]
        mov si, 320
        imul si,[Line]
        add si, [Displacement]
        fon:
        mov ax, [Color]
        mov cx, [Width]
        mov di,si
        @@:
        stosb
        loop @B
        add si,320
        mov cx,dx
        sub dx,1
        loop fon

        ret
endp

bOldMode  db  ?
bOldPage  db  ?
