#### WORK IN PROGRESS ####
This was implemented really quickly and a few opcodes need to be added to the **TASM16.TAB** and a lot is still untested!!

# Suite-16-Assembler
Assembler for the Suite-16 CPU
Suite-16 is being developed by Ken Boak.
See his repository at: https://github.com/monsonite/Suite-16

# TASM
You can download the TASM assembler package from: https://www.ticalc.org/pub/dos/asm/tasm32.zip

# Suite-16 tab file
To be able to assemble a .asm file for the Suite-16 cpu you need to use put the file: TASM16.tab in the tasm directory.
To create a object file type: **tasm -t16 filename.asm**

-t16 specifies that you want to use the **TASM16.TAB** file that is used for the Suite-16 cpu
**filename.asm** is the source file you want to assemble

# Example assembling hello.asm
run command: **tasm -s -h -c -g0 -t16 hello.asm out.hex**

see at bottom of listfile hello.lst for generated table of bytes <br/>
0000  11 00 00 07 41 00 0C 00 E1 00 01 02 00 00 48 65 <br/>
0010  6C 6C 6F 20 57 6F 72 6C 64 21 0A 00 00 00 00 00 <br/>

**generated opcodes are:** <br/>
 11 00 <br/>
 00 07 <br/>
 41 00 <br/>
 0C 00 <br/>
 E1 00 <br/>
 etc..
