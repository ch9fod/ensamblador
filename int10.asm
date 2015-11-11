.model small
.stack 128
.data
cuadro1	dw 0014h,0014h,0015h,0010h ;ejemplo cuadro
cuadro2	dw 0015h,0080h,0015h,0020h ;ejemplo cuadro
cuadro3	dw 0019h,0100h,0015h,0030h ;ejemplo cuadro
;rec1	db 24h,100,100,20,30
orx		dw ? ;origen x
ory		dw ? ;origen y
finx	dw 0 ;fin x
finy	dw 0 ;fin y
color	db ? ;que color?
.code
.startup
main proc

mov ax,@data
mov ds,ax

mov ah,00			;set video mode http://stanislavs.org/helppc/int_10-0.html
mov al,12h			;modo grafico 640x480 pixeles 16 colores
int 10h                
;color de fondo
mov ah,0Bh			;set color pallet http://stanislavs.org/helppc/int_10-b.html
mov bh,00			;background or border 
mov bl,1100b		;color
int 10h  

xor cx,cx			;clear
xor dx,dx			;clear
xor ax,ax			;clear

lea bx,cuadro1		;dir de registro inicial cuadro1
call drawcuad		;rutina de dubujar cuadro

lea bx,cuadro2		;dir de registro inicial cuadro1 
call drawcuad		;rutina de dubujar cuadro

lea bx,cuadro3		;dir de registro inicial cuadro1
call drawcuad		;rutina de dubujar cuadro

jmp fin

drawcuad:
mov al,[bx] 		;toda esta seccion
push ax				;
and al,0fh			;lo unico que hace
mov color,al		;
pop ax				;es sacar los valores
inc bx				;
inc bx				;en memoria
mov cx,[bx]			;
mov orx,cx			;de el origen en x
mov finx,cx			;
inc bx				;y el origen en y
inc bx				;
mov cx,[bx]			;y tambien calcula
mov ory,cx			;
mov finy,cx			;los puntos finales
inc bx				;
inc bx				;en x Y y
mov cx,[bx]			;
add finx,cx			;
add finy,cx			;
xor cx,cx			;clear
xor dx,dx			;clear
mov cx,orx			;las coordenadas a dibujar deben estar en
mov dx,ory			;cx y dx 
dibuja:
call pixel 			;dibuja el pixel del color indicado
inc cx				;incrementa la direccion a dibujar en x
cmp cx,finx
jne dibuja
mov cx,orx
inc dx				;incrementa la direccion a dibujar en y
cmp dx,finy
jne dibuja
ret

drawrec:			;funcion vacia
fin:
mov ah,10h			;espera caracter
int 16h
mov ax,4c00h
int 21h

pixel:
mov ah,0Ch			;dibuja pixel
mov bh,00			;pagina
mov al,color 		;color a dibujar
int 10h				;las coordenandas ya estan guardadas en cx y dx
ret


main endp
end