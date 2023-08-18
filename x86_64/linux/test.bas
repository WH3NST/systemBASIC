%include "sysBASICx64_linux.4.asm"

START_
DIM_ incer, 1
DIM_ limit, 3
STRING_ string, "iteration!"
STRING_ newline, 10
DIM_ counter, 0
DIM_ testvar, 0
WHILE_
	COMPARE_neq testvar, limit
	ARITH_add counter, incer
	STORE_ counter
	ARG_i counter
	GOSUB_ testsub
	STORE_ testvar
	PRINT string
	PRINT newline
	CONTINUE_
END_

testsub:
	DIM_ myvar, 0
	ARG_o myvar
	RETURN_ myvar
