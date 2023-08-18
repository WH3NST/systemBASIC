FUNCTION_ CCALL
DIM_ ARGNNUM, 0
DIM_ thefunction, 0
DIM_ ARGNUM, 0
DIM_ myvar1, 1
DIM_ myvar2, 2
DIM_ myvar3, 3
DIM_ myvar4, 4
DIM_ myvar5, 5
DIM_ myvar6, 6
DIM_ myvar7, 7

ARG_o ARGNNUM
ARG_o thefunction

IFTRUE_ next1
COMPARE_les ARGNNUM, myvar1
CONTINUE_
ARG_o myvar1
LOCALSUB_ next1

IFTRUE_ next2
COMPARE_les ARGNNUM, myvar2
CONTINUE_
ARG_o myvar2
LOCALSUB_ next2

IFTRUE_ next3
COMPARE_les ARGNNUM, myvar3
CONTINUE_
ARG_o myvar3
LOCALSUB_ next3

IFTRUE_ next4
COMPARE_les ARGNNUM, myvar4
CONTINUE_
ARG_o myvar4
LOCALSUB_ next4

IFTRUE_ next5
COMPARE_les ARGNNUM, myvar5
CONTINUE_
ARG_o myvar5
LOCALSUB_ next5

IFTRUE_ next6
COMPARE_les ARGNNUM, myvar6
CONTINUE_
ARG_o myvar6

LOCALSUB_ next6

mov rdi, qword [.myvar1 + rbx]

mov rsi, qword [.myvar2 + rbx]

mov rdx, qword [.myvar3 + rbx]

mov rcx, qword [.myvar4 + rbx]

mov r8, qword [.myvar5 + rbx]

mov r9, qword [.myvar6 + rbx]

mov rax, [.thefunction]
push rbx
call rax
pop rbx
STORE_ thefunction
RETURN_ thefunction
