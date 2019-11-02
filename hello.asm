
EOS:         .EQU    $0000            	;End of string


.org $0000
start:	
	SET R1, HELP_MSG_1
next:	
	LD R0, @R1
	OUT
	INC R1
	BGT next
	BRA start
	
.MSFIRST

HELP_MSG_1: .WORD "Hello World!\n",EOS
	
.end	
