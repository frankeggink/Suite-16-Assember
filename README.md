#### WORK IN PROGRESS ####
This was implemented really quickly and a few opcodes need to be added to the **TASM16.TAB** and a lot is still untested!!

# NOTE
For best viewing of file binToMem.c append **?ts=3** to the url <br/>
https://github.com/frankeggink/Suite-16-Assember/blob/master/binToMem.c?ts=3 <br/>
This sets the used tabsize to 3 <br/>

# Suite-16-Assembler
Assembler for the Suite-16 CPU <br/>
Suite-16 is being developed by **Ken Boak**. <br/>
See his repository at: **https://github.com/monsonite/Suite-16** <br/>
And for more info see: **https://hackaday.io/project/168025-suite-16** <br/>
<br/>
# TASM
You can download the TASM assembler package from: https://www.ticalc.org/pub/dos/asm/tasm32.zip

# Suite-16 tab file
To be able to assemble an .asm file for the Suite-16 cpu you need to use put the file: TASM16.tab in the tasm directory. <br/>
To create a object file type: **tasm -t16 filename.asm**<br/>

-t16 specifies that you want to use the **TASM16.TAB** file that is used for the Suite-16 CPU <br/>
**filename.asm** is the source file you want to assemble<br/>

# Example assembling hello.asm<br/>
run command: **tasm -s -h -c -g0 -t16 hello.asm out.hex**<br/>

see at bottom of listfile **hello.lst** for generated table of bytes <br/>
0000  11 00 00 07 41 00 0C 00 E1 00 01 02 00 00 48 65 <br/>
0010  6C 6C 6F 20 57 6F 72 6C 64 21 0A 00 00 00 00 00 <br/>

**generated opcodes are:** <br/>
 11 00 <br/>
 00 07 <br/>
 41 00 <br/>
 0C 00 <br/>
 E1 00 <br/>
 etc..


**generate MEM array:**  <br/>
run command: **binToMem.exe < hello.lst > output** <br/>
the generated array with opcoded is placed in **output**

