%include	'../util.asm'

section		.text
global		_start

_start:
    xor r15, r15
.loop:
    call readint
    mov [vet+r15*8] , rax
    inc r15
    cmp r15, 10
    jl .loop
.print:
    dec r15
    mov rdi , [vet+r15*8]
    call printint
    call endl
    cmp r15 , 0
    jg .print
    call exit0

section     .bss
vet:    resq 10
