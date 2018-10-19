

ORG 7c00h

add dh, 2
mov dl, 10
mov bh, 0
mov ah, 2
int 10h 

mov cx, 0
mov di, 0

mov al, 0      
mov ah, 0eh
start_loop:
int 10h

call InFormOfTable
 
inc al

cmp al, 0
jne start_loop

end_loop:

ret

InFormOfTable:
   push ax
    mov al, 32
    int 10h
    int 10h
    int 10h
    pop ax
ret


