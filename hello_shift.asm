; ### NOTE ###
; to make this program compile correctly and work
; change .ino sketch: 		case 0x7:  addr = M[PC] ;  PC = addr ; break ;  // 16-bit JMP	(remove PC++)
; change TASM16.TAB: 		CALL *        08 2 NOP 1		(call uses lsb of opcode)									(call uses lsb of opcode)

EOS:         .EQU    $0000            	;End of string

.org $0000
start:	
	SET R15, 512-1			;setup stack
	SET R1, HELP_MSG_1		;R1 is start of message
next:	
	LD R0, @R1				;get first 2 bytes from message
	CALL shift_right		;shift 8 bits to right
	SET R2,$00FF			;R2 is used as helper reg
	AND R2					;only use lsb
	OUT						;output to console
	LD R0, @R1				;read first 2 bytes again
	AND R2					;only use lsb
	OUT						;output to console
	INC R1					;make R1 point to next word in msg (next 2 bytes)
	BGT next				;until 0 found
	BRA start				;while(1)
	NOP						;just a test
	
	
shift_right:
	ST R2, R0				;store R0 for later
	 
	SET R3, 8
	SET R4, 1				;R4 is mask1
	SET R5, 256				;R5 is mask2
	SET R6, 0				;R6 is result
	
cont:
	LD R0, R2				;load 16 bit value back in AC
	AND R5					;AC= AC & R5
	BNE store				;IF AC != 0	
	
no_store:	
	LD R0, R4				;mask1 += mask1;
	ADD R4						
	ST R4, R0
	
	LD R0, R5				;mask2 += mask2;
	ADD R5
	ST R5, R0

	DEC R3					;counter = counter - 1
	LD R0, R3				
	BEQ shift_done			;if counter is zero we are done
	
	JMP cont
store:
	LD R0, R6				;put result value in R0
	OR R4					;enable bit
	ST R6, R0				;store R6 (result)
	JMP no_store
	
shift_done:
	LD R0, R6				;return value
	RET
	
HELP_MSG_1: .BYTE "Hello World with pseudo bit shifting\n",EOS
	
	
.end	
