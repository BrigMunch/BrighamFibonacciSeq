;Brigham Muench's Fib Sequence
.586
.MODEL FLAT

INCLUDE io.h           

.STACK 4096

.DATA
number1 DWORD   ?
prompt1 BYTE    "Enter an integer: ", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The value is", 0
sum     BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, string, 40      
        atod    string          
        mov     number1, eax	
		mov		ebx,1
		mov		ecx,3
		mov		edx,1

		cmp eax,0
		je	EqualZero

		cmp eax,1
		je	EqualOne

		cmp eax,2
		je	EqualTwo
		
		cmp eax,3
		jge	GreaterTwo

EqualZero: mov eax,0   
	dtoa		sum, eax
	output	resultLbl, sum
	jmp endProgram	

EqualOne: mov	eax,1
		dtoa    sum, eax        
		output	resultLbl,sum
		jmp  endProgram

EqualTwo: mov	eax,1
		dtoa    sum, eax        
		output	resultLbl,sum
		jmp	endProgram	

GreaterTwo: cmp ecx, number1
		jg endLoop
		
		mov eax,ebx
		add eax,edx

		mov ebx,edx
		mov edx,eax

		inc ecx
		jmp GreaterTwo

endLoop:
		mov	eax,edx
		dtoa    sum, eax        
		output	resultLbl,sum
		jmp	endProgram	

endProgram:
        mov     eax, 0 
        ret
_MainProc ENDP
END                             

