 %include "sysBASICx64_linux.asm"

 %include "stringtoint.bas"

 START_

DIM_ mychar, 0
DIM_ myint, 0

DIM_ vtwirwcfzpuhsn, 8
IFTRUE_ iuwynxbwnezondmghq
COMPARE_geq myint,  vtwirwcfzpuhsn 
CONTINUE_
WHILE_ 
COMPARE_les myint,  vtwirwcfzpuhsn 

 MOVE_global myfunc.arg1, _start.myint


DIM_ aevpisaxtpsjwy, 1
ARG_i myint
GOSUB_ myfunc

ARG_i myint
GOSUB_ inttochar
STORE_  mychar

 PRINT mychar

CONTINUE_
LOCALSUB_ iuwynxbwnezondmghq

 END_





FUNCTION_  myfunc
DIM_ arg2, 0
ARG_o arg2
DIM_ arg1, 0
ARG_o arg1

ARITH_add  arg1 ,  arg2 
STORE_ arg1

RETURN_ arg1

