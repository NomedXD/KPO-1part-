org 100H
 
start: 
 mov ah,0fh 
 int 10h 
 mov [bOldMOde],al 
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

;рисуем зеленый квидрат
mov dx,100
mov si,320*75+100
fon:
mov al, $03
mov cx, 60
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop fon

;рисуем нижнюю полоску черную
mov dx,5
mov si,320*175+100
niz:
mov al, $00
mov cx, 60
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop niz
;рисуем остальные части зеленые
mov dx,94
mov si,320*79+95
fon2:
mov al, $03
mov cx, 72
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop fon2

mov dx,80
mov si,320*85+86
fon3:
mov al, $03
mov cx, 88
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop fon3

mov dx,6
mov si,320*70+105
fon4:
mov al, $03
mov cx, 46
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop fon4

mov dx,5
mov si,320*65+110
fon5:
mov al, $03
mov cx, 35
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop fon5

;рисуем ноги
mov dx,15
mov si,320*180+112
noga1:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop noga1

mov dx,15
mov si,320*180+143
noga2:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop noga2

;окаймовка слева
mov dx,5
mov si,320*170+95
left1:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop left1

mov dx,5
mov si,320*165+90
left2:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop left2

mov dx,80
mov si,320*85+85
left3:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop left3

mov dx,5
mov si,320*80+90
left4:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop left4

mov dx,5
mov si,320*75+95
left5:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop left5

mov dx,5
mov si,320*70+100
left6:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop left6

mov dx,5
mov si,320*65+105
left7:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop left7

;верхняя крышка)

mov dx,5
mov si,320*60+105
verh:
mov al, $00
mov cx, 45
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop verh

;левое ухо
mov dx,10
mov si,320*50+105
leftU1:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftU1

mov dx,5
mov si,320*45+100
leftU2:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftU2

mov dx,5
mov si,320*40+95
leftU3:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftU3

mov dx,5
mov si,320*35+90
leftU4:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftU4

mov dx,5
mov si,320*30+85
leftU5:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftU5

mov dx,5
mov si,320*25+80
leftU6:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftU6




      mov       ax,0c08h
      int       21h
      test      al,al
      jnz       @f
      mov       ah,08h
      int       21h
@@:
      movzx     ax, [bOldMOde]
      int       10h
      mov       ah,05h
      mov       al,[bOldPage]
      int       10h
 
      ret
bOldMOde:db      ?
bOldPage:db      ?