


ORG 7c00h    
    
 axRegister equ 09EFh
 cxRegister equ 0CACh
 dxRegister equ 0DDECh
 bxRegister equ 0AACEh
 bpRegister equ 00EFAh
 siRegister equ 0F0C3h
 diRegister equ 000BCh

    newLine equ 0Dh, 0Ah

    zeroASCII equ "0"
    limitHexa equ 0Fh
    DecimalBS equ 10
    
    	
	mov ax, 1003h ; int 10 03h
	mov bx, 0
	int 10h

	mov ax, axRegister
	mov cx, cxRegister
	mov dx, dxRegister
	mov bx, bxRegister
	mov bp, bpRegister
    mov si, siRegister
	mov di, diRegister
	
    call PrintRegistersProcedure
	    
ret

DefineAl:
    mov al, dl
	and al, limitHexa
	add al, zeroASCII
ret

DoLetterProcedure:
    cmp al, "9"
	jl is_letter	
	add al, 7
	is_letter:
ret

WriteInTheRegisterProcedure:
   shr dx, 4
   mov [ds:bx + di + str_ShowRegisters], al
   dec di
ret

FinalProcedure:
    mov bh, 0
	mov bl, 0F0h
	mov dx, 0
	push cs
	pop es
	mov bp, str_ShowRegisters
	mov cx, str_ShowRegisters_end - str_ShowRegisters
	mov ax, 1301h
	int 10h
ret

PrintRegistersProcedure:
	pusha
    mov cx, 8
	mov bx, (str_ShowRegisters_end - str_ShowRegisters - 5)
	POP_loop:
		pop dx
		mov di, 3
		hex_loop:
			
			call DefineAl
			
			call DoLetterProcedure

			call WriteInTheRegisterProcedure
			
		jns hex_loop ; (SF=0)

		sub bx, DecimalBS
	loop POP_loop

	call FinalProcedure
ret

str_ShowRegisters db "AX:0000h", newLine, "CX:0000h", newLine, "DX:0000h", newLine, "BX:0000h", newLine, "SP:0000h", newLine, "BP:0000h", newLine, "SI:0000h", newLine, "DI:0000h"
str_ShowRegisters_end:
