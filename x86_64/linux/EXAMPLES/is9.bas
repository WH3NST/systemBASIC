%include "sysBASICx64_linux.asm"
%include "stringtoint.bas"
START_
	STRING_ isitnine, "this is not 9"
	DIM_ myARG1, 0
	DIM_string MYSTRING, 16
	DIM_ stringptr, .MYSTRING
	DIM_ offset, 48
	DIM_string teststring, 1
	DIM_ ptr2, .teststring
WHILE_
	READ MYSTRING, 16
	PEEK_ stringptr, myARG1
	ARG_i myARG1
	GOSUB_ chartoint
	STORE_ myARG1
	DIM_ checker, 9
	COMPARE_eq checker, myARG1
	CONTINUE_
	PRINT isitnine
END_
