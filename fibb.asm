.model small
.data
.code

mov dh,0h
mov dl,01h
call imprimeChar
mov cl,10
L1:
call calcula
call imprime
dec cl
jnz L1
jmp fin
calcula:
mov ch,dl
add dl,dh
mov dh,ch
ret
imprime:
push dx
mov al,dl
mov bl,100
div bl
jz L2
mov dl,al
call imprimeChar
L2:
xchg al,ah
and ah,0    ;and con 0 = 0
mov bl,10
div bl
jz L3
mov dl,al
call imprimeChar
L3:
mov dl,ah
call imprimeChar
pop dx
ret
imprimeChar:
push dx
push ax
add dl,30h
mov ah,02h
int 21h
pop ax
pop dx
ret

fin:
mov ah,4ch
int 21H
end