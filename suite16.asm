.org	$0000
start:
	BRA getnum
	
	
.org	$0020
decimate:
	SUB R1
	
	

	
.org	$0080	
getnum:
	NOP
	SET R0, $3E
	OUT
	IN
	SET R1, $200
	LD R0, @R1
	
	OUT
	INC R1
	
.end
	
	
