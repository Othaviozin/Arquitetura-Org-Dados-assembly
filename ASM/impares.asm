%include	'../util.asm'

section		.text
global		_start

_start:
    xor rdi , rdi
    xor rax, rax
    xor r10, r10
main:
	lea rdi, [msg]
    call printstr
    call readint
    test rax, rax
    jz endP
    test rax, 1
    jnz impar
    jmp main
impar:
    inc r10,
    jmp main
endP:
    mov rdi, r10
    call printint
    call endl
    xor rdi , rdi
    xor rax, rax
    xor r10, r10
    call exit0

section		.data
msg:		db	'informe um valor (digite 0 para sair:) ' , 0
