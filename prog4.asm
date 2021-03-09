.386
.model flat,stdcall
option casemap:none

include includes/windows.inc
include includes/user32.inc
include includes/kernel32.inc
includelib includes/user32.lib
includelib includes/kernel32.lib
 
include includes/msvcrt.inc        
includelib includes/msvcrt.lib         

.data

sTitle			db 		'Lab 2', 0
sAuthor			db 		'Author: Zaborskikh Artyom, group 717-1', 0dh, 0ah, 0ah
sTask			db 		'11. Task: determine the sum of array elements exceeding a given value B and the number of elements less than B.', 0dh, 0ah, 0ah
sArray			db 		'Array:', 0
sEnd			db 		0dh, 0ah, 0ah, 'By, by!', 0dh, 0ah
format	 		db 		"%d ", 0
formatNumber	db 		0dh, 0ah, 0ah, "Number: %d", 0
formatMore 		db 		0dh,0ah, "More sum: %d", 0
formatLess 		db 		0dh, 0ah, "Less count: %d", 0
array			db 		1, 2, 3, 4, 5, 6, 7, 8, 9, 10                 
number			db		7
moreSum			db 		0
lessCount		db		0

.code
MAIN proc
	LOCAL 	hStdout :DWORD	
	invoke 	SetConsoleTitle, offset sTitle
	invoke 	GetStdHandle, STD_OUTPUT_HANDLE
	mov 	hStdout, eax
	invoke 	WriteConsole, hStdout, offset sAuthor, sizeof sAuthor, NULL, NULL
	invoke 	WriteConsole, hStdout, offset sTask, sizeof sTask, NULL, NULL
	invoke 	WriteConsole, hStdout, offset sArray, sizeof sArray, NULL, NULL
	
	xor ebx, ebx
	
_arr: 
	cmp ebx, sizeof array
	je _close
	invoke crt_printf, addr format, [array+ebx]	
	mov al, [array+ebx]	
	inc ebx	
	cmp al, number 
	ja _more
	jb _less
	je _arr
	
_less:			
	inc lessCount	
	jmp _arr	
	
_more:	
	add moreSum, al
	jmp _arr
	
_close:
	invoke crt_printf, addr formatNumber, number
	invoke crt_printf, addr formatMore, moreSum
	invoke crt_printf, addr formatLess, lessCount
	invoke WriteConsole, hStdout, offset sEnd, sizeof sEnd, NULL, NULL
		
MAIN endp

end MAIN