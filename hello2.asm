.model small
.stack
.data

hola db 31h,32h,33h,"Hola Mundo!$"

.code

mov ax,@data
mov ds,ax

lea dx,hola
mov ah,09h
int 21H

fin:
mov ah,4ch
int 21H
end