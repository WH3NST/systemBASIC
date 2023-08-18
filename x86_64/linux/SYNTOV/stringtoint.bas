FUNCTION_ chartoint
	DIM_ myARG1, 0
	DIM_ retval, 0
	ARG_o myARG1
	DIM_ offset, 48
	ARITH_sub myARG1, offset
	STORE_ retval
	RETURN_ retval
	
FUNCTION_ inttochar
	DIM_ myARG1, 0
	ARG_o myARG1
	DIM_ offset, 48
	ARITH_add myARG1, offset
	STORE_ myARG1
	RETURN_ myARG1

FUNCTION_ compstring
	DIM_ incrementer, 1
	DIM_ zerome, 0
	DIM_ ARG_1, 0
	DIM_ ARG_2, 0
	DIM_ char1, 0
	DIM_ char2, 0
	ARG_o ARG_2
	ARG_o ARG_1
	WHILE_
	MOVE_ zerome, char1
	MOVE_ zerome, char2
	PEEK_ ARG_1, char1
	PEEK_ ARG_2, char2
	COMPARE_eq char1, zerome
		COMPAREAUX_neq char1, char2
		ARITH_add ARG_1, incrementer
		STORE_ ARG_1
		ARITH_add ARG_2, incrementer
		STORE_ ARG_2
	NAND_
	IFTRUE_ ret1
	NOTAUX_
	RETURN_ zerome
	LOCALSUB_ ret1
	RETURN_ incrementer
