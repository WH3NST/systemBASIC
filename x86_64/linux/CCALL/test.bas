%include "sysBASICx64_linux.asm"
%include "CCALL.bas"
extern printf
START_
CSTRING_ msg, "Hello C world"
DIM_ stringptr, .msg
DIM_ var2, 1
DIM_ myfunc, printf
ARG_i stringptr 
ARG_i myfunc
ARG_i var2
GOSUB_ CCALL
END_
