# systemBASIC
This is a language I made a while back while teaching myself assembly. I recently have decided to pick up the peices and resume work on it after forgetting about it for a long time. There is an intermediate language specified in SPECIFICATION.TXT, which is currently implemented using NASM macro's, but should be easy to re-implement using other means. To improve the syntax and expressability, there are several "layers" of lua processing. 

WARNING:
Currently, the NASM macro based intermediate language produces very bad machine code and the lua processor is severely unreadable. I hope it can get everything cleaned up and more efficient eventually. The project directory also doesn't really have a structure which I want to tackle first. There is some english I am pretty sure I wrote at 3 AM too so don't expect all of it to be understandable either.


FEATURES:
Mix assembly and language code freely (theoretically), I tried this and it works but you have to put ; at the end of
assembly statements or the lexer(?) freaks out.

Write intermediate code into your high level code too (necessary to use some features, not as bad as it sounds).

Unique syntax, learn it yourself! (I forgot to write its specification down).

Generates 16 bit DOS .COM executables that are also bootable without a filesystem if you dd them into a hard drive (Max size 32 kilobytes), last time I tried this it still works.

64 bit linux version.

Current assembly generator produces 100% position indipendent code. Uses RBX/BX as the base register.

Tree-style local variables. You can define functions within functions and then access the variables of those functions from your higher functions. Functions also preserve variable names between calls, and can serve as some limited kind of struct if you don't write code in them.


FUTURE PLANS:
Better intermediate > assembly translators, that generate better assembly code. Option for position dependent code, use of RIP releative addressing, and 32 bit support are also hoped for features. I think I will move away from purely using macro's to do this, and will move to a hybrid macro/script approach.

More stuff for the language, its a bit bare right now.

Rewrite of the high level syntax processor so it can be understood by something besides the lua interpreter.

Actual directory structure.
