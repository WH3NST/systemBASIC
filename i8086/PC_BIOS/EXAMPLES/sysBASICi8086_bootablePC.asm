%include "PC_BIOS_API.asm"
%macro START_  0
bits 16
_start:
call %%BASICSTARTTEST
%%BASICSTARTTEST: pop bx
sub bx, 3
mov si, bx
add si, 512
mov ax, 0
cmp al, byte [si + bx]
jne %%end
mov si, %%BOOTSEGDAPACK
add si, bx
mov ah, 0x42					; AL is unused
mov dl, 0x80					; drive number 0 (OR the drive # with 0x80)
add [db_add + bx], bx
int 0x13
mov ax, 0
jmp %%ENDBOOTSEG
%%BOOTSEGDAPACK:
		db	0x10
		db	0
blkcnt:	dw	16		; int 13 resets this to # of blocks actually read/written
db_add:	dw	%%ENDBOOTSEG
		dw	0		; in memory page zero
d_lba:	dd	1		; put the lba to read in this spot
		dd	0		; more storage bytes only for big lba's ( > 4 bytes )
times 510 - ($ - $$) db 0
dw 0xAA55


%%ENDBOOTSEG:
jmp %%end
BASIC_RES_GLOBAL_GC_1: db 0
BASIC_RES_GLOBAL_GC_2: db 0
BASIC_CONTPOINTER_GLOBAL: dw 0
%%end:
%endmacro

%macro LABEL_ 1
%define ARG1 .%1
ARG1:
%endmacro

%macro LOCALSUB_ 1
%define ARG1 .%1
ARG1:
%endmacro
%macro END_ 0
	hlt
%endmacro

%macro MOVE_ 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov dx, ARG1
	mov ax, WORD [dx + bx]
	mov dx, ARG2
	mov WORD [dx + bx], ax
%endmacro

%macro STORE_ 1
	%define ARG1 .%1
	%define ARG2 .%2
	mov word [ARG1 + bx], ax
%endmacro

%macro CONTINUE_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	cmp al, 0
	je %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL + bx]
	jmp ax
	%%end:
%endmacro

%macro CONTINUEAUX_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_2 + bx]
	cmp al, 0
	je %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL + bx]
	jmp ax
	%%end:
%endmacro

%macro WHILE_ 0
%%whilepoint:
mov word [BASIC_CONTPOINTER_GLOBAL + bx], %%whilepoint
add [BASIC_CONTPOINTER_GLOBAL + bx], bx
%endmacro
%macro COMPARE_eq 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jne %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	%%end:
	%endmacro
	
%macro COMPARE_neq 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	je %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	%%end:
	%endmacro

%macro COMPARE_les 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jge %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	%%end:
	%endmacro

%macro COMPARE_gre 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jle %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	%%end:
	%endmacro
	
%macro COMPARE_leq 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jg %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	%%end:
	%endmacro
	
%macro COMPARE_geq 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jl %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + bx], al
	%%end:
	%endmacro
	
	
;==================================================================================================================================

%macro COMPAREAUX_eq 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jne %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	%%end:
	%endmacro
	
%macro COMPAREAUX_neq 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2]
	cmp ax, cx
	je %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	%%end:
	%endmacro

%macro COMPAREAUX_les 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jge %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	%%end:
	%endmacro

%macro COMPAREAUX_gre 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jle %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	%%end:
	%endmacro
	
%macro COMPAREAUX_leq 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jg %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	%%end:
	%endmacro
	
%macro COMPAREAUX_geq 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	cmp ax, cx
	jl %%false
	mov ax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	jmp %%end
	%%false:
	mov ax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + bx], al
	%%end:
	%endmacro

%macro NOT_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	cmp al, 1
	je %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL]
	jmp ax
	%%end:
%endmacro

%macro NOTAUX_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	cmp al, 1
	je %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL]
	jmp ax
	%%end:
%endmacro

%macro GOTO_dyn 1
	%define ARG1 .%1
	jmp [%1 + bx]
%endmacro

%macro LOCALSUB_ 1
%define ARG1 .%1
ARG1:
%endmacro

%macro GOTO_ 1
	%define ARG1 .%1
	jmp ARG1
%endmacro

%macro FUNCTION_ 1
%define ARG1 %1
ARG1:
%endmacro
%macro GOSUB_ 1
	call %1
%endmacro

%macro GOSUB_dyn 1
	%define ARG1 .%1
	mov ax, [ARG1 + bx]
	call ax
%endmacro

%macro RETURN_ 1
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	ret
%endmacro

%macro VAR_util 2

	jmp %%next
	%1: dw %2
	%%next:
%endmacro
%macro DIM_ 2
VAR_util .%1, %2
%endmacro
%macro STRING_util 2
	jmp %%next

	%1: db %2, 0

	%%next:
%endmacro

%macro STRING_ 2
STRING_util .%1, %2
%endmacro

%macro DATA_util 2
	jmp %%next

	%1: resb %2
	%%next:
%endmacro

%macro DATA_ 2
DATA_util .%1, %2
%endmacro

%macro DIM_string 2
RESSTRING_util .%1, %2
%endmacro

%macro RESSTRING_util 2
	jmp %%next

	%1: resb %2
	db 0

	%%next:
%endmacro


%macro ARITH_add 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	add ax, word [ARG2 + bx]
%endmacro

%macro ARITH_sub 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	sub ax, word [ARG2 + bx]
%endmacro

%macro ARITH_mul 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	mul cx
%endmacro

%macro ARITH_div 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cx, word [ARG2 + bx]
	div cx
%endmacro

%macro XOR_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + bx]
	xor al, cl
	cmp ax, 0
	je %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL]
	jmp ax
	%%end:
%endmacro

%macro AND_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + bx]
	and al, cl
	cmp ax, 0
	je %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL]
	jmp ax
	%%end:
%endmacro

%macro OR_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + bx]
	or al, cl
	cmp ax, 0
	je %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL]
	jmp ax
	%%end:
%endmacro

%macro NOR_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + bx]
	or al, cl
	cmp ax, 0
	jne %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL]
	jmp ax
	%%end:
%endmacro

%macro NAND_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + bx]
	and al, cl
	cmp ax, 0
	jne %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL]
	jmp ax
	%%end:
%endmacro

%macro NXOR_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + bx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + bx]
	xor al, cl
	cmp ax, 0
	jne %%end
	mov ax, word [BASIC_CONTPOINTER_GLOBAL]
	jmp ax
	%%end:
%endmacro

%macro IFTRUE_ 1
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1]
	mov word [BASIC_CONTPOINTER_GLOBAL], ax
%endmacro

%macro PEEK_ 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov ax, word [ARG1 + bx]
	mov cl, byte [ax]
	mov byte [ARG2 + bx], cl
	%endmacro
	
%macro POKE_ 2
	%define ARG1 .%1
	%define ARG2 .%2
	mov cl, byte [ARG2 + bx]
	mov di, [ARG1 + bx]
	mov byte [di + bx], cl
	
	%endmacro
	
%macro ARG_i 1
	%define ARG1 .%1
	%define ARG2 .%2
pop ax
mov cx, word [ARG1 + bx]
push cx
push ax
%endmacro

%macro ARG_o 1
	%define ARG1 .%1
	%define ARG2 .%2
jmp %%begin
%%begin:
pop ax
pop dx
pop word cx
mov [ARG1 + bx], cx
push dx
push ax
mov ax, [ARG1 + bx]
%endmacro
