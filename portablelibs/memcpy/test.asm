%include "/etc/systemBASIC/sysBASICx64_linux.asm";asd
%include "/etc/systemBASIC/linuxAPI.asm";asd
 %include "stringtoint.bas";asd

 START_

DIM_ arrayptr, .array
DIM_ counter, 0
DIM_ thing, 69
STRING_ test, "looping"

DIM_ dkvrnzyeeuvuls, 4
IFTRUE_ okimqkfcdtkuptwvko
COMPARE_geq counter,  dkvrnzyeeuvuls 
CONTINUE_
WHILE_ 
COMPARE_les counter,  dkvrnzyeeuvuls 

ARG_i arrayptr
ARG_i counter
GOSUB_  	extract
STORE_  thing


DIM_ rfsnqxrdbgtsoc, 1
ARITH_add 	counter,  rfsnqxrdbgtsoc 
STORE_ counter

 	PRINT thing

CONTINUE_
LOCALSUB_ okimqkfcdtkuptwvko

 END_

 LOCALSUB_ array

 db "HELLO!", 10, 0;

 db "FUCK!!", 10, 0;

 db "LOLOL!", 10, 0;



FUNCTION_  memcpy
DIM_ size, 0
ARG_o size
DIM_ out, 0
ARG_o out
DIM_ in, 0
ARG_o in

DIM_ mybyte, 0
DIM_ limiter, 0
STRING_ test, "looping"
ARITH_add 	out,  size 
STORE_ limiter


DIM_ hqwwuanxbgavou, 1
ARITH_sub 	limiter,  hqwwuanxbgavou 
STORE_ limiter

IFTRUE_ jdbqlefghmwwrkzmuk
COMPARE_geq out,  limiter 
CONTINUE_
WHILE_ 
COMPARE_les out,  limiter 


DIM_ sczbcieydebgqm, 0
MOVE_ sczbcieydebgqm, 		mybyte

 		PEEK_ in, mybyte

 		POKE_ out, mybyte


DIM_ nainbjiyppopbz, 1
ARITH_add 		in,  nainbjiyppopbz 
STORE_ in


DIM_ sgaultrlqxzehx, 1
ARITH_add 		out,  sgaultrlqxzehx 
STORE_ out

CONTINUE_
LOCALSUB_ jdbqlefghmwwrkzmuk

RETURN_ limiter

 	

FUNCTION_  extract
DIM_ element, 0
ARG_o element
DIM_ ptr, 0
ARG_o ptr

DIM_ ptrsize, 8
DIM_ retval, 0
DIM_ retptr, .retval
ARITH_mul 	element,  ptrsize 
STORE_ element

ARITH_add 	element,  ptr 
STORE_ ptr

ARG_i ptr
ARG_i retptr
ARG_i ptrsize
GOSUB_  	memcpy

RETURN_ retval

 	

FUNCTION_  emplace
DIM_ value, 0
ARG_o value
DIM_ element, 0
ARG_o element
DIM_ ptr, 0
ARG_o ptr

DIM_ ptrsize, 8
DIM_ retptr, .value
ARITH_mul 	element,  ptrsize 
STORE_ element

ARITH_add 	element,  ptr 
STORE_ ptr

ARG_i retptr
ARG_i ptr
ARG_i ptrsize
GOSUB_  	memcpy


DIM_ wlnjenglmspxhu, 0
RETURN_ wlnjenglmspxhu

