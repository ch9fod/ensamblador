.model small
.stack
.data
.code

mov dl,'H'
mov ah,02h
int 21h

fin:
mov ah,4ch
int 21H
end