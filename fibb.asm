.model small
.data
.code

mov dh,0h
mov dl,01h
call imprimeChar
push dx ;--------------
mov dl,20h  ;--------------
call imprimeHex ;--------------
pop dx  ;--------------
mov cl,11
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
and ah,0    ;and con 0 = 0--------------
mov al,dl
mov bl,100
div bl
cmp al,0  ;compara si es cero----------------
jz L2
mov dl,al
call imprimeChar
L2:
xchg al,ah
and ah,0    ;and con 0 = 0---------------
mov bl,10
div bl
cmp al,0  ;compara si es cero-------------
jz L3
mov dl,al
call imprimeChar
L3:
mov dl,ah
call imprimeChar
mov dl,20h  ;------------------
call imprimeHex ;------------
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
imprimeHex: ;---------------
push ax
mov ah,02h
int 21h
pop ax
ret

fin:
mov ah,4ch
int 21H
end