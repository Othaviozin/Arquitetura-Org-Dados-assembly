%include	'../util.asm'

section		.text
global		_start

_start:
	lea		rdi, [msg]  
	call	printstr   
	call	endl
    call    readint
    mov     r12, rax
    call    readint
    cmp     r12, rax
    jg     maior
    call    else     
maior:
    mov     r14, rax
    lea     rdi, [msg2]
    call    printstr
    call    printint
    mov     rdi, r14
    call    printint
    call    endl
    call    exit0
else:
    mov     r14, r12
    lea     rdi, [msg2]
    call    printstr
    call    printint
    mov     rdi, r14
    call    printint
    call    endl
    call    exit0
    
section		.data
msg:		db	'informe dois valores: ' , 10, 0
msg2:		db	'maior: ', 0
