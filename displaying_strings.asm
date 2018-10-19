
;include 'MACRO\PROC32.INC'

ORG 7c00h

jmp start

STR1 DB "Vlad has done this!", 0
strlength equ $ - STR1          

STR2 db "V", 007h, "l", 007h, "a", 007h, "d", 007h, " ", 007h, "h", 007h, "a", 007h, "s", 007h, " ", 007h, "d", 007h, "o", 007h, "n", 007h, "e", 007h, " ", 007h, "t", 007h, "h", 007h, "i", 007h, "s", 007h, "!", 007h


start:
   
mov dh, 2
mov dl, 10
mov bh, 0
mov ah, 2
int 10h       
   
mov cx, strlength          ; int 10h 0eh
mov di, 0
mov ah, 0eh
   
Test1Case1:
    mov al, [STR1 + di]
    int 10h
    inc di
loop Test1Case1  

;
;

mov ah, 2  
add dh, 2
mov dl, 10
int 10h

mov ah, 0EH                ; int 10h 0eh 
mov di, 0
Test1Case2:
    mov al, [STR1 + di]
    cmp al, 0
    JE Test1Case2end
    int 10h
    inc di
jmp Test1Case2
Test1Case2end:

;
;
;
;            
;           
;            
;            
;            
;            
;           

mov cx, strlength
mov di, 0


mov ah, 2  
add dh, 2
mov dl, 10
int 10h

Test2Case1:                ; int 10h 0ah
    
    mov ah, 2  
    int 10h
    inc dl
    
    push cx    
    mov cx, 1
    mov al, [STR1 + di] 
    mov ah, 0ah
    int 10h
    
    inc di    
    
    pop cx
    ;mov cx, di
loop Test2Case1  

;
;

mov ah, 2
mov dl, 10  
add dh, 2
int 10h


mov ah, 0eh                ; int 10h 0ah
mov di, 0

Test2Case2:
    mov al, [STR1 + di]
    cmp al, 0
    JE Test2Case2end
    int 10h
    inc di
jmp Test2Case2
Test2Case2end:

;
;
;
;
;
;
;
;
;
;

mov cx, strlength

mov ah, 2  
add dh, 2
mov dl, 10
int 10h 
mov di, 0

Test3Case1:                ; int 10h 09h
    
    mov ah, 2  
    int 10h
    inc dl
    
    push cx    
    mov cx, 1
    mov al, [STR1 + di] 
    mov bl, 0111b 
    mov ah, 09h
    int 10h
    
    inc di    
    
    pop cx
    ;mov cx, di
loop Test3Case1
 
;
;   
    
    mov ah, 2
    mov dl, 10 
    add dh, 2
    int 10h
    
    mov di, 0 
    mov cx, 1 
    
Test3Case2:                  ; int 10h 09h
	mov al,  [STR1 + di]

	cmp al, 0
	je Test3Case2end

	mov ah, 09h
	int 10h
        
	inc di
	inc dl
	mov ah, 2
	int 10h   
	
	jmp Test3Case2
Test3Case2end:
	
;
;
;
;
;
;
;
;
;
;   
   
    mov al, 1                   ; int 10h 13h
	mov bh, 0
	mov bl, 0111b
	mov cx, TMPend - offset TMP ; calculate message size. 
	mov dl, 10
	add dh, 2
	push cs
	pop es
	mov bp, offset TMP
	mov ah, 13h
	int 10h
	jmp TMPend
	TMP db "Vlad has done this!"
	TMPend:

;
;
;
;
;
;
;
;
;
;


    add dh, 2                  ; int 10h 1302h
    mov dl, 10
	mov bp, offset STR2
	mov ax, 1302h
	int 10h

;
;
;
;
;
;
;
;
;
;

	add dh, 2                 ; int 10h 1303h
	mov al, 10
	mov bp, offset STR2
	mov ax, 1303h
	int 10h

;
;
;
;
;
;
;
;
;


ret




