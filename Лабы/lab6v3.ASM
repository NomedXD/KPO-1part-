;-------------------------------------------------------Ч
; Task : (X^2+Y^2) * Z арифмитический сдвиг вправо на Z битов
;-------------------------------------------------------Ч
format MZ

entry Main: Start

;----------------------------------------------Ч

segment Main

Start:
mov ax, Main  ;Ќастраиваем нужный сегмент данных на работу
mov ds, ax

mov ah, 09h       ;вывод сообщени€ о том, что сделать надо
mov dx, TaskString
int 21h

call CRLF_Proc
;--------------------------------------------Ч
; сохран€ем все в стек
mov di, word [X]
push di
mov di, word [Y]
push di
mov di, word [Z]
push di
xor di, di

; выполн€ем задачу с использованием стека
call Proc_with_Stack
call far Procedures: Out_Res_Proc
call CRLF_Proc

; восстанавливаем регистры
mov ax, word [X]
mov bx, word [Y]
mov cx, word [Z]

; выполн€ем задачу с помощью регистров
call far Procedures: Proc_Registers_Variables
call far Procedures: Out_Res_Proc
call CRLF_Proc

; выполн€ем задачу с помощью глобальных переменных
call far Procedures: Proc_Var_Variables
call far Procedures: Out_Res_Proc
call CRLF_Proc

; ожидание
mov ah, 08h
int 21h

mov ax, 4C00h
int 21h
ret



; процедура работы со стеком
Proc_with_Stack:
; достаем X Y из стека
push bp
mov bp, sp
mov ax, [bp+8]
mov bx, [bp+6]

;возведение в квадрат первого параметра
mul al

; возведение в квадрат второго параметра
mov dl, al
mov al, bl
mul al

; суммируем X Y
add al, dl

; достаем Z из стека
mov cx, [bp+4]

; умножаем XY на Z
mul cl

; производим арифмитический сдвиг на Z
sar al, cl

pop bp
ret 6

; процедура перевода курсора
CRLF_Proc:
mov ah, 02h
mov dl, 10
int 21h
ret

X db 4
Y db 2
Z db 4

TaskString db 'Task is (X^2 + Y^2) * Z SAR Z$'

;-------------------------------------------------------Ч
segment Procedures

; процедура - параметры через регистры
Proc_Registers_Variables:
mul al
mov dl, al
mov al, bl

mul al

add al,dl

mul cl

sar ax, cl
retf


; процедура - параметры через глобальные переменные
Proc_Var_Variables:
mov ax, word [X]
mov bx, word [Y]
mul al
mov dl, al
mov al, bl
mul al

add al, dl
mov cx,word [Z]
mul cl
sar al, cl
retf

; возвращаемое значение процедуры
Out_Res_Proc:
mov dx, ax
mov ah, 02h
add dl, '0'
int 21h
retf