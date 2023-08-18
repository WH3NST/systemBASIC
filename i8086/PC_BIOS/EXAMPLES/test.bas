%include "sysBASICi8086_bootablePC.asm"
START_
DIM_ myVAR, 0
DIM_ incrementer, 1
DIM_ limit, 10
DIM_ mychar, 0
IFTRUE_ hdrzvtgjpwzecpzghz
COMPARE_geq myVAR,  limit
CONTINUE_
WHILE_ 
COMPARE_les myVAR,  limit
ARG_i myVAR
ARG_i incrementer
GOSUB_ myfunc
STORE_  myVAR
ARG_i myVAR
GOSUB_ inttochar
STORE_  mychar
PRINT mychar
CONTINUE_
LOCALSUB_ hdrzvtgjpwzecpzghz
END_


FUNCTION_ myfunc
DIM_ arg2, 0
ARG_o arg2
DIM_ arg1, 0
ARG_o arg1
ARITH_add arg1,  arg2 
STORE_ arg1
RETURN_ arg1


%include "stringtoint.bas"
