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
mov cx, 55
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
mov si,320*80+95
fon2:
mov al, $03
mov cx, 65
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
mov cx, 84
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
left7 :
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

;правое ухо
mov dx,10
mov si,320*50+145
rightU1:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightU1

mov dx,5
mov si,320*45+150
rightU2:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightU2

mov dx,5
mov si,320*40+155
rightU3:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightU3

mov dx,5
mov si,320*35+160
rightU4:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightU4

mov dx,5
mov si,320*30+165
rightU5:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightU5

mov dx,5
mov si,320*25+170
rightU6:
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightU6

;правая окаймовка

mov dx,5
mov si,320*65+145
right1 :
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop right1

mov dx,5
mov si,320*70+150
right2 :
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop right2

mov dx,5
mov si,320*75+155
right3 :
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop right3

mov dx,5
mov si,320*80+160
right4 :
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop right4

mov dx,80
mov si,320*85+165
right5 :
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop right5

mov dx,5
mov si,320*165+160
right6 :
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop right6

mov dx,5
mov si,320*170+155
right7 :
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop right7

;глаз
mov dx,5
mov si,320*70+110
glaz1 :
mov al, $00
mov cx, 5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop glaz1

mov dx,10
mov si,320*75+115
glaz2 :
mov al, $00
mov cx,20
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop glaz2

mov dx,5
mov si,320*70+135
glaz3 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop glaz3

mov dx,20
mov si,320*85+135
glaz4 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop glaz4

mov dx,20
mov si,320*85+110
glaz5 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop glaz5

mov dx,5
mov si,320*105+115
glaz6 :
mov al, $00
mov cx,20
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop glaz6

mov dx,20
mov si,320*85+115
glaz7 :
mov al, $2C
mov cx,20
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop glaz7

mov dx,10
mov si,320*90+120
glaz8 :
mov al, $28
mov cx,10
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop glaz8

;рот
mov dx,5
mov si,320*115+105
rot1 :
mov al, $00
mov cx,40
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot1

mov dx,20
mov si,320*120+105
rot2 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot2

mov dx,20
mov si,320*120+140
rot3 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot3

mov dx,5
mov si,320*140+135
rot4 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot4

mov dx,5
mov si,320*140+110
rot5 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot5

mov dx,5
mov si,320*145+115
rot6 :
mov al, $00
mov cx,20
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot6

mov dx,10
mov si,320*130+110
rot7 :
mov al, $28
mov cx,30
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot7

mov dx,5
mov si,320*135+115
rot8 :
mov al, $00
mov cx,20
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot8

mov dx,5
mov si,320*125+110
rot9 :
mov al, $00
mov cx,30
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot9

mov dx,5
mov si,320*120+110
rot10 :
mov al, $0f
mov cx,30
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot10

mov dx,5
mov si,320*140+115
rot11 :
mov al, $0f
mov cx,20
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rot11

;руки
mov dx,10
mov si,320*90+65
leftR1 :
mov al, $00
mov cx,10
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftR1

mov dx,10
mov si,320*100+65
leftR2 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftR2

mov dx,5
mov si,320*110+70
leftR3 :
mov al, $00
mov cx,10
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftR3

mov dx,5
mov si,320*115+75
leftR4 :
mov al, $00
mov cx,10
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftR4

mov dx,5
mov si,320*120+80
leftR5 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop leftR5

;правая рука
mov dx,10
mov si,320*110+170
rightR1 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightR1

mov dx,10
mov si,320*105+175
rightR2 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightR2

mov dx,25
mov si,320*85+175
rightR3 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightR3

mov dx,10
mov si,320*85+180
rightR4 :
mov al, $00
mov cx,5
mov di,si
@@:
stosb
loop @B
add si,320
mov cx,dx
sub dx,1
loop rightR4




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