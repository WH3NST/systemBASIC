LABEL_ "chartoint"
	DIM_ myARG1, 0
	DIM_ retval, 0
	ARG_o myARG1
	DIM_ offset, 48
	ARITH_sub myARG1, offset
	STORE_ retval
	RETURN_ retval
	
LABEL_ "inttochar"
	DIM_ myARG1, 0
	ARG_o myARG1
	DIM_ offset, 48
	ARITH_add myARG1, offset
	STORE_ myARG1
	RETURN_ myARG1
