.model small
.stack
.data
.code

mov ah,01 ; espera un caracter del teclado
int 21h
mov bl,al ; guarda en bl el primer caracter
int 21h
mov bh,al ; guarda en bh el segundo
mov ah,02 ; comando de imprimir
mov dl,0ah ; ascii de nueva linea, lo mismo que 10
int 21h
mov dl,bl ; en dl va el caracter a imprimir
int 21h
mov dl,bh ; en dl va el caracter a imprimir
int 21h

fin:
mov ah,4ch
int 21H
end