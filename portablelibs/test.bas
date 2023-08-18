%include "sysBASICx64_linux.asm"
%include "stringstuff.bas"

;COMPSTRING test program
START_
	STRING_ a, "TAST"
	STRING_ br, "TEST"
	STRING_ truest, "TRUE!"
	STRING_ falsest, "FALSE!"
	DIM_ ap, .a
	DIM_ brp, .br
	DIM_ retval, 0
	DIM_ zerome, 0
	ARG_i ap
	ARG_i brp
	GOSUB_ compstring
	STORE_ retval
	IFTRUE_ trueme
	COMPARE_neq retval, zerome
	CONTINUE_
	PRINT falsest
	END_
	LOCALSUB_ trueme
	PRINT truest
	END_

;NOTAUX_ verification
;START_
;	STRING_ loopmsg, "Hello Dickwads!"
;	DIM_ a, 1
;	DIM_ b, 1
;	WHILE_
;	COMPAREAUX_neq a, b
;	PRINT loopmsg
;	NOTAUX_
;	END_
	
;NAND_ verification
;START_
;	STRING_ loopmsg, "Hello Dickwads!"
;	DIM_ a, 1
;	DIM_ b, 2
;	WHILE_
;	COMPAREAUX_eq a, b
;	COMPARE_eq a, b
;	PRINT loopmsg
;	NAND_
;	END_
