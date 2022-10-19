        include 'macro\proc16.inc' ;используем макросы



alLeft    =0
alCenter  =1
alRight   =2

        org 100h

Start:
        cld
        push $0013
        stdcall Screen.SetMode
        mov bx,ax    ;Т к используем stdcall, то принято, что bx,dx и cx можно использовать вне подпрограмм
                     ; в противном случае при входе в подпрограмму нужно сохранить значения этих регистров



        stdcall Screen.WriteString, strHello,12,alLeft
        stdcall Keyboard.ReadKey
        push bx
        stdcall Screen.SetMode, bx
        ret

proc Screen.WriteString uses es si di,\
        ofsString,nLine,alAlign

        push $B800  ;настройка на нужный сегмент
        pop es
        mov di,80*2
        imul di,[nLine] ; оступ от начала строки для нахождения середины

        mov si, [ofsString]
        lodsb ; считываем длину строки и перемещаем si
        movzx cx,al
        mov ax,[alAlign]
        cmp ax,alLeft
        je .alLeft

        mov dx,80
        sub dx,cs
        cmp
        cmp ax,alCenter
        je .alCenter
        cmp ax, alRight
        je .alRight

.alCenter:
.alRight:

.alLeft:
        ret
endp

proc Screen.SetMode uses si di,\
        wModeInfo   ;изменяет режим на заданный, то сразу возвращает режим, который был до этого
                  ; По соглашению stdcall пушим эти все регистры
        push si
        push di

                  ; будем сохранять номер страницы и номер режима
        mov ah,$0F ;номер режима возвращает в al, номер страницы в bh
        int 10h
        mov dl,al
        mov dh,bh

        movzx ax,byte[wModeInfo] ;переключаем режим
        mov ah, [bp+4] ; так как в стеке будет адрес возврата + параметр + старый bp
        int 10h ; так как у нас little endian, то по адресу bp+4 будет сладний байт
        mov ah,$05
        mov al, byte [wModeInfo+1]
        int 10h

        mov ax,dx
        ret

endp

proc Keyboard.ReadKey
        mov ax, $0C08
        int 21h
        movzx cx,al ;обнуляем старшую часть и записываем в сладшую
        test al, al ; если была нажата расширенная клавиша,то будет 0 в al
        jnz @F
        mov ah, $08 ;поэтому вызываем еще раз в таком случае
        int 21h
        mov ch,al  ;если была нажата расширенная клавиша, то сохраняем в старший байт занчение

@@:
        mov ax,cx ; так как по соглашение std call нужно результат в ax для вывода пихать

        ret
endp

strHello     db 13,'Hello,world!'