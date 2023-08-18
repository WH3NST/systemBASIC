section .data
mystring: db "Hello world", 10, 0
extern printf
section .text

global _start
	_start
	mov rdi, mystring
	mov rsi, 2
	call printf
	
