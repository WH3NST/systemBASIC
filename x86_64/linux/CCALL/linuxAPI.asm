%macro PRINT 1
	mov rcx, 0
	mov rsi, .%1
	add rsi, rbx
	%%BASICPRINT_stringlength_loop:
	inc rcx
	inc rsi
	cmp byte [rsi], 0
	jne %%BASICPRINT_stringlength_loop
	mov rax, 1
	mov rdi, 1
	mov rsi, .%1
	add rsi, rbx
	mov rdx, rcx
	syscall
	%endmacro
	
%macro READ 2
	mov rdi, 0
	mov rsi, .%1
	mov rdx, %2
	mov rax, 0
	syscall
	%endmacro
	
