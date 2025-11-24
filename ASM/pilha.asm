%include	'../util.asm'

section		.text
global		_start

N: equ 5

_start:
    mov r15, N-1
.leitura:
    call readint
    push rax
    dec r15
    call endl
    jnz .leitura
    mov r15 , N-1
.exibe:
    pop rdi
    call printint
    call endl
    dec r15
    jnz .exibe
    call exit0

section     .bss
vet:    resq 10
