%include "sysBASICx64_linux.asm"
%include "stringtoint.bas"
START_
$var mychar = 0
$var myint = 0
while | myint < 8 |
MOVE_global myfunc.arg1 TO _start.myint
\myfunc myint AND 1
\inttochar myint >> mychar
PRINT mychar
]]]
END_


myfunc[arg1, arg2]
arg1 + arg2 >> arg1
return arg1
