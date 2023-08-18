%include "sysBASICx64_linux.asm"
START_

STRING_ loopstr, "loopstring!"
DIM_ intermediate, 0
DIM_string numchar, 1
DIM_ numcharptr, .numchar
DIM_ limit, 8
DIM_ ccounter, 0
DIM_ incrementer, 1
WHILE_
	COMPARE_les ccounter, limit
	ARITH_add ccounter, incrementer
	STORE_ ccounter
	ARG_i ccounter
	GOSUB_ inttochar
	STORE_ intermediate
	POKE_ numcharptr, intermediate
	PRINT numchar
	CONTINUE_
	END_
	
	%include "stringtoint.bas"
