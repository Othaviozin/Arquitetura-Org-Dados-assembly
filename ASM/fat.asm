%include	'../util.asm'

section		.text
global		_start

_start:
    xor r11, r11
main:
	lea rdi, [msg]
    call printstr
    call readint
    mov r11 , rax
    call fat
aux:
    mov rdi, r11
    call printint
    call exit0
fat:
    test rax, rax
    jz  aux
    dec rax
    test rax, rax
    jz  aux
    imul r11, rax
    jmp fat
zero:
    move r11, 1
    call aux

section		.data
msg:		db	'informe um valor ' , 0
