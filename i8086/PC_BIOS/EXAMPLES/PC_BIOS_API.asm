%macro PRINT 1
mov si, .%1
	%%printf_repeat:
	mov ah, 0xE
	mov al, [si + bx]
	int 0x10
	inc si
	cmp al, 0
	jne %%printf_repeat
%endmacro
