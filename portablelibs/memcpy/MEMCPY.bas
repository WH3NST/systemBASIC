%include "stringtoint.bas";asd
START_
$var arrayptr = .array
$var counter = 0
$var thing = 69
$var test = "looping"
while | counter < 4 |
	extract( arrayptr, counter ) >> thing
	counter + 1 >> counter
	PRINT thing
]]]
END_
LOCALSUB_ array
db "HELLO!", 10, 0;
db "FUCK!!", 10, 0;
db "LOLOL!", 10, 0;

memcpy[in, out, size]
	$var mybyte = 0
	$var limiter = 0
	$var test = "looping"
	out + size >> limiter
	limiter - 1 >> limiter
	while | out < limiter |
		mybyte = 0
		PEEK_ in, mybyte
		POKE_ out, mybyte
		in + 1 >> in
		out + 1 >> out
	]]]
	return limiter
	
extract[ptr, element]
	$var ptrsize = 8
	$var retval = 0
	$var retptr = .retval
	element * ptrsize >> element
	element + ptr >> ptr
	memcpy( ptr, retptr, ptrsize )
	return retval
	
emplace[ptr, element, value]
	$var ptrsize = 8
	$var retptr = .value
	element * ptrsize >> element
	element + ptr >> ptr
	memcpy( retptr, ptr, ptrsize )
	return 0
