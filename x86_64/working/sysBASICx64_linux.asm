d
%include "linuxAPI.asm"
%macro START_  0
global _start
section .data
BASIC_RES_GLOBAL_GC_1: db 0
BASIC_RES_GLOBAL_GC_2: db 0
BASIC_CONTPOINTER_GLOBAL: dq 0
section .text
	_start:
;call BASICSTARTTEST
;BASICSTARTTEST: pop ebx
;sub ebx, 3
mov rbx, 0
%endmacro

%macro END_ 0
	mov rax, 1
	mov rdi, 1
	mov rsi, %%ENDINGBASIC_TERMINATIONMSG
	add rsi, rbx
	mov rdx, %%ENDINGBASIC_TERMINATIONMSG_LENGTH
	syscall
	mov rax, 60
	mov rdi, 0
	syscall
	%%ENDINGBASIC_TERMINATIONMSG: db "Program self-terminated.", 10, 0
	%%ENDINGBASIC_TERMINATIONMSG_LENGTH: equ $ - %%ENDINGBASIC_TERMINATIONMSG
%endmacro

%macro MOVE_ 2
	mov rdx, %1
	mov rax, QWORD [rdx + rbx]
	mov rdx, %2
	mov QWORD [rdx + rbx], rax
%endmacro

%macro STORE_ 1
	mov qword [%1 + rbx], rax
%endmacro

%macro CONTINUE_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	cmp al, 0
	je %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro CONTINUEAUX_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
	cmp al, 0
	je %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro WHILE_ 0
%%whilepoint:
mov qword [BASIC_CONTPOINTER_GLOBAL + rbx], %%whilepoint
%endmacro
%macro COMPARE_eq 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jne %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	%%end:
	%endmacro
	
%macro COMPARE_neq 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2]
	cmp rax, rcx
	je %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	%%end:
	%endmacro

%macro COMPARE_les 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jge %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	%%end:
	%endmacro

%macro COMPARE_gre 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jle %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	%%end:
	%endmacro
	
%macro COMPARE_leq 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jg %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	%%end:
	%endmacro
	
%macro COMPARE_geq 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jl %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
	%%end:
	%endmacro
	
	
;==================================================================================================================================

%macro COMPAREAUX_eq 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jne %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	%%end:
	%endmacro
	
%macro COMPAREAUX_neq 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2]
	cmp rax, rcx
	je %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	%%end:
	%endmacro

%macro COMPAREAUX_les 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jge %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	%%end:
	%endmacro

%macro COMPAREAUX_gre 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jle %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	%%end:
	%endmacro
	
%macro COMPAREAUX_leq 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jg %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	%%end:
	%endmacro
	
%macro COMPAREAUX_geq 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	cmp rax, rcx
	jl %%false
	mov rax, 0
	mov al, 1
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	jmp %%end
	%%false:
	mov rax, 0
	mov al, 0
	mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
	%%end:
	%endmacro

%macro NOT_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	cmp al, 1
	je %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro NOTAUX_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	cmp al, 1
	je %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro GOTO_ 1
	jmp [%1 + rbx]
%endmacro

%macro GOSUB_ 1
	call %1
%endmacro

%macro RETURN_ 1
	mov rax, qword [%1 + rbx]
	ret
%endmacro

%macro VAR_ 2
	jmp %%next
	section .data
	.%1: dq %2
	section .text
	%%next:
%endmacro

%macro STRING_ 2
	jmp %%next
	section .data
	.%1: db %2, 0
	section .text
	%%next:
%endmacro

%macro DATA_ 2
	jmp %%next
	section .data
	.%1: resb %2
	section .text
	%%next:
%endmacro

%macro RESSTRING_ 2
	jmp %%next
	section .data
	.%1: resb %2
	db 0
	section .text
	%%next:
%endmacro


%macro ARITH_add 2
	mov rax, qword [%1 + rbx]
	add rax, qword [%2 + rbx]
%endmacro

%macro ARITH_sub 2
	mov rax, qword [%1 + rbx]
	sub rax, qword [%2 + rbx]
%endmacro

%macro ARITH_mul 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	mul rcx
%endmacro

%macro ARITH_div 2
	mov rax, qword [%1 + rbx]
	mov rcx, qword [%2 + rbx]
	div rcx
%endmacro

%macro XOR_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
	xor al, cl
	cmp rax, 0
	je %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro AND_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
	and al, cl
	cmp rax, 0
	je %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro OR_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
	or al, cl
	cmp rax, 0
	je %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro NOR_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
	or al, cl
	cmp rax, 0
	jne %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro NAND_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
	and al, cl
	cmp rax, 0
	jne %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro NXOR_ 0
	mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
	mov cl, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
	xor al, cl
	cmp rax, 0
	jne %%end
	mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
	jmp rax
	%%end:
%endmacro

%macro IFTRUE_ 1
	mov rax, qword [%1]
	mov qword [BASIC_CONTPOINTER_GLOBAL], rax
%endmacro

%macro PEEK_ 2
	mov rax, qword [%1]
	mov cl, byte [rax]
	mov byte [%2], cl
	%endmacro
	
%macro POKE_ 2
	mov rax, qword [%1]
	mov cl, byte [%2]
	mov byte [rax], cl
	
	%endmacro
