; NOME : Othavio Frison Pedretti
; MATRICULA : 210075

%include '../util.asm'

N equ 5                    ; Define o número de iterações do loop (N=5)

section .text
global _start

_start:
    mov	 r12, N            ; r12 = 5 (contador do loop)
    lea	 rdi, [msg_inicio]
    call	 printstr
    call	 endl
    call	 readint
    mov	 r13, rax         ; r13 - Maior
    mov	 r14, rax         ; r14 - Menor
    dec	 r12
    .loop:
        cmp	 r12, 0
        je	 fim
        call readint
        cmovg r13, rax      ; Se rax > r13, atualiza r13 para o MAIOR
        cmovl r14, rax      ; Se rax < r14, atualiza r14 para o MENOR
        dec r12
        jmp .loop
    fim:
        mov rdi, r13
        mov rsi , r14
        mov rdi , [msg_dif]
        call printstr
        call dif
        mov rdi, rax
        call printint
        call exit0
    dif:
        sub	 rdi, rsi
        mov rax, rdi
        ret

section .data
msg_inicio: db 'Insira ', N, ' numeros, um de cada vez: ', 0
msg_dif:    db 'Diferenca entre o menor e o maior: ', 0