.model small
.data
.code

mov ax,122
mov bl,100
div bl
add ah,30h

mov dl,ah
mov ah,02h
int 21h

add al,30h
mov dl,al
mov ah,02h
int 21h

fin:
mov ah,4ch
int 21H
end