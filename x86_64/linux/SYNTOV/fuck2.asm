%line 352+1 fuck.asm
chartoint:
%line 372+1 fuck.asm

 jmp ..@2.next
[section .data]
 .myARG1: dq 0
[section .text]
 ..@2.next:
%line 372+1 fuck.asm

 jmp ..@6.next
[section .data]
 .retval: dq 0
[section .text]
 ..@6.next:
%line 575+1 fuck.asm
jmp ..@9.begin
..@9.begin:
pop rax
pop rdx
pop qword rcx
mov [.myARG1 + rbx], rcx
push rdx
push rax
mov rax, [.myARG1 + rbx]
%line 372+1 fuck.asm

 jmp ..@11.next
[section .data]
 .offset: dq 48
[section .text]
 ..@11.next:
%line 442+1 fuck.asm
 mov rax, qword [.myARG1 + rbx]
 sub rax, qword [.offset + rbx]
%line 73+1 fuck.asm
 mov qword [.retval + rbx], rax
%line 367+1 fuck.asm
 mov rax, qword [.retval + rbx]
 ret
%line 12+1 fuck.asm

%line 352+1 fuck.asm
inttochar:
%line 372+1 fuck.asm

 jmp ..@19.next
[section .data]
 .myARG1: dq 0
[section .text]
 ..@19.next:
%line 575+1 fuck.asm
jmp ..@22.begin
..@22.begin:
pop rax
pop rdx
pop qword rcx
mov [.myARG1 + rbx], rcx
push rdx
push rax
mov rax, [.myARG1 + rbx]
%line 372+1 fuck.asm

 jmp ..@24.next
[section .data]
 .offset: dq 48
[section .text]
 ..@24.next:
%line 435+1 fuck.asm
 mov rax, qword [.myARG1 + rbx]
 add rax, qword [.offset + rbx]
%line 73+1 fuck.asm
 mov qword [.myARG1 + rbx], rax
%line 367+1 fuck.asm
 mov rax, qword [.myARG1 + rbx]
 ret
%line 20+1 fuck.asm

%line 352+1 fuck.asm
compstring:
%line 372+1 fuck.asm

 jmp ..@32.next
[section .data]
 .incrementer: dq 1
[section .text]
 ..@32.next:
%line 372+1 fuck.asm

 jmp ..@36.next
[section .data]
 .zerome: dq 0
[section .text]
 ..@36.next:
%line 372+1 fuck.asm

 jmp ..@40.next
[section .data]
 .ARG_1: dq 0
[section .text]
 ..@40.next:
%line 372+1 fuck.asm

 jmp ..@44.next
[section .data]
 .ARG_2: dq 0
[section .text]
 ..@44.next:
%line 372+1 fuck.asm

 jmp ..@48.next
[section .data]
 .char1: dq 0
[section .text]
 ..@48.next:
%line 372+1 fuck.asm

 jmp ..@52.next
[section .data]
 .char2: dq 0
[section .text]
 ..@52.next:
%line 575+1 fuck.asm
jmp ..@55.begin
..@55.begin:
pop rax
pop rdx
pop qword rcx
mov [.ARG_2 + rbx], rcx
push rdx
push rax
mov rax, [.ARG_2 + rbx]
%line 575+1 fuck.asm
jmp ..@56.begin
..@56.begin:
pop rax
pop rdx
pop qword rcx
mov [.ARG_1 + rbx], rcx
push rdx
push rax
mov rax, [.ARG_1 + rbx]
%line 95+1 fuck.asm
..@57.whilepoint:
mov qword [BASIC_CONTPOINTER_GLOBAL + rbx], ..@57.whilepoint
%line 55+1 fuck.asm
 mov rdx, .zerome
 mov rax, QWORD [rdx + rbx]
 mov rdx, .char1
 mov QWORD [rdx + rbx], rax
%line 55+1 fuck.asm
 mov rdx, .zerome
 mov rax, QWORD [rdx + rbx]
 mov rdx, .char2
 mov QWORD [rdx + rbx], rax
%line 549+1 fuck.asm
 mov rax, qword [.ARG_1 + rbx]
 mov cl, byte [rax]
 mov byte [.char1 + rbx], cl
%line 549+1 fuck.asm
 mov rax, qword [.ARG_2 + rbx]
 mov cl, byte [rax]
 mov byte [.char2 + rbx], cl
%line 101+1 fuck.asm
 mov rax, qword [.char1 + rbx]
 mov rcx, qword [.zerome + rbx]
 cmp rax, rcx
 jne ..@62.false
 mov rax, 0
 mov al, 1
 mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
 jmp ..@62.end
 ..@62.false:
 mov rax, 0
 mov al, 0
 mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
 ..@62.end:
%line 230+1 fuck.asm
 mov rax, qword [.char1 + rbx]
 mov rcx, qword [.char2 + rbx]
 cmp rax, rcx
 je ..@63.false
 mov rax, 0
 mov al, 1
 mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
 jmp ..@63.end
 ..@63.false:
 mov rax, 0
 mov al, 0
 mov byte [BASIC_RES_GLOBAL_GC_2 + rbx], al
 ..@63.end:
%line 435+1 fuck.asm
 mov rax, qword [.ARG_1 + rbx]
 add rax, qword [.incrementer + rbx]
%line 73+1 fuck.asm
 mov qword [.ARG_1 + rbx], rax
%line 435+1 fuck.asm
 mov rax, qword [.ARG_2 + rbx]
 add rax, qword [.incrementer + rbx]
%line 73+1 fuck.asm
 mov qword [.ARG_2 + rbx], rax
%line 508+1 fuck.asm
 mov rax, 0
 mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
 mov cl, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
 not al
 not cl
 and al, cl
 cmp rax, 254
 je ..@68.end
 mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
 jmp rax
 ..@68.end:
%line 542+1 fuck.asm
 mov rax, .ret1
 mov qword [BASIC_CONTPOINTER_GLOBAL + rbx], rax
%line 327+1 fuck.asm
 mov al, byte [BASIC_RES_GLOBAL_GC_2 + rbx]
 cmp al, 1
 je ..@70.end
 mov rax, qword [BASIC_CONTPOINTER_GLOBAL + rbx]
 jmp rax
 ..@70.end:
%line 367+1 fuck.asm
 mov rax, qword [.zerome + rbx]
 ret
%line 342+1 fuck.asm
.ret1:
%line 367+1 fuck.asm
 mov rax, qword [.incrementer + rbx]
 ret
%line 4+1 fuck.asm

[global _start]
[section .data]
BASIC_RES_GLOBAL_GC_1: db 0
BASIC_RES_GLOBAL_GC_2: db 0
BASIC_CONTPOINTER_GLOBAL: dq 0
[section .text]
 _start:



mov rbx, 0
%line 6+1 fuck.asm

%line 372+1 fuck.asm

 jmp ..@79.next
[section .data]
 .mychar: dq 0
[section .text]
 ..@79.next:
%line 372+1 fuck.asm

 jmp ..@83.next
[section .data]
 .myint: dq 0
[section .text]
 ..@83.next:
%line 9+1 fuck.asm

%line 372+1 fuck.asm

 jmp ..@87.next
[section .data]
 .vtwirwcfzpuhsn: dq 8
[section .text]
 ..@87.next:
%line 542+1 fuck.asm
 mov rax, .iuwynxbwnezondmghq
 mov qword [BASIC_CONTPOINTER_GLOBAL + rbx], rax
%line 191+1 fuck.asm
 mov rax, qword [.myint + rbx]
 mov rcx, qword [.vtwirwcfzpuhsn + rbx]
 cmp rax, rcx
 jl ..@91.false
 mov rax, 0
 mov al, 1
 mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
 jmp ..@91.end
 ..@91.false:
 mov rax, 0
 mov al, 0
 mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
 ..@91.end:
%line 77+1 fuck.asm
 mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
 cmp al, 0
 je ..@92.end
 mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
 jmp rax
 ..@92.end:
%line 95+1 fuck.asm
..@93.whilepoint:
mov qword [BASIC_CONTPOINTER_GLOBAL + rbx], ..@93.whilepoint
%line 137+1 fuck.asm
 mov rax, qword [.myint + rbx]
 mov rcx, qword [.vtwirwcfzpuhsn + rbx]
 cmp rax, rcx
 jge ..@94.false
 mov rax, 0
 mov al, 1
 mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
 jmp ..@94.end
 ..@94.false:
 mov rax, 0
 mov al, 0
 mov byte [BASIC_RES_GLOBAL_GC_1 + rbx], al
 ..@94.end:
%line 16+1 fuck.asm

%line 64+1 fuck.asm
 mov rdx, myfunc.arg1
 mov rax, QWORD [rdx + rbx]
 mov rdx, _start.myint
 mov QWORD [rdx + rbx], rax
%line 18+1 fuck.asm


%line 372+1 fuck.asm

 jmp ..@97.next
[section .data]
 .aevpisaxtpsjwy: dq 1
[section .text]
 ..@97.next:
%line 566+1 fuck.asm
pop rax
mov rcx, qword [.myint + rbx]
push rcx
push rax
%line 355+1 fuck.asm
 call myfunc
%line 23+1 fuck.asm

%line 566+1 fuck.asm
pop rax
mov rcx, qword [.myint + rbx]
push rcx
push rax
%line 355+1 fuck.asm
 call inttochar
%line 73+1 fuck.asm
 mov qword [.mychar + rbx], rax
%line 27+1 fuck.asm

%line 5+1 sysBASICx64_linux.asm
 mov rcx, 0
 mov rsi, .mychar
 add rsi, rbx
 ..@105.BASICPRINT_stringlength_loop:
 inc rcx
 inc rsi
 cmp byte [rsi], 0
 jne ..@105.BASICPRINT_stringlength_loop
 mov rax, 1
 mov rdi, 1
 mov rsi, .mychar
 add rsi, rbx
 mov rdx, rcx
 syscall
%line 77+1 fuck.asm
 mov al, byte [BASIC_RES_GLOBAL_GC_1 + rbx]
 cmp al, 0
 je ..@106.end
 mov rax, qword [BASIC_CONTPOINTER_GLOBAL]
 jmp rax
 ..@106.end:
%line 342+1 fuck.asm
.iuwynxbwnezondmghq:
%line 32+1 fuck.asm

%line 39+1 fuck.asm
 mov rax, 1
 mov rdi, 1
 mov rsi, ..@108.ENDINGBASIC_TERMINATIONMSG
 add rsi, rbx
 mov rdx, ..@108.ENDINGBASIC_TERMINATIONMSG_LENGTH
 syscall
 mov rax, 60
 mov rdi, 0
 syscall
 ..@108.ENDINGBASIC_TERMINATIONMSG: db "Program self-terminated.", 10, 0
 ..@108.ENDINGBASIC_TERMINATIONMSG_LENGTH: equ $ - ..@108.ENDINGBASIC_TERMINATIONMSG
%line 34+1 fuck.asm





%line 352+1 fuck.asm
myfunc:
%line 372+1 fuck.asm

 jmp ..@111.next
[section .data]
 .arg2: dq 0
[section .text]
 ..@111.next:
%line 575+1 fuck.asm
jmp ..@114.begin
..@114.begin:
pop rax
pop rdx
pop qword rcx
mov [.arg2 + rbx], rcx
push rdx
push rax
mov rax, [.arg2 + rbx]
%line 372+1 fuck.asm

 jmp ..@116.next
[section .data]
 .arg1: dq 0
[section .text]
 ..@116.next:
%line 575+1 fuck.asm
jmp ..@119.begin
..@119.begin:
pop rax
pop rdx
pop qword rcx
mov [.arg1 + rbx], rcx
push rdx
push rax
mov rax, [.arg1 + rbx]
%line 44+1 fuck.asm

%line 435+1 fuck.asm
 mov rax, qword [.arg1 + rbx]
 add rax, qword [.arg2 + rbx]
%line 73+1 fuck.asm
 mov qword [.arg1 + rbx], rax
%line 47+1 fuck.asm

%line 367+1 fuck.asm
 mov rax, qword [.arg1 + rbx]
 ret
%line 49+1 fuck.asm

