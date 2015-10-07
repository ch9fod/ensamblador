.model small
.data
.code
mov ax,00ffh
push ax
mov ax,01h
pop ax
fin:
mov ah,4ch
int 21H
end