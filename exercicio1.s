    .section .data
texto:
    .asciz "Hello World 123"

vogais:        .long 0
consoantes:    .long 0
digitos:       .long 0
espacos:       .long 0

vogal_lista:
    .asciz "aeiouAEIOU"

fmt_vogais:       .asciz "Vogais: %d\n"
fmt_consoantes:   .asciz "Consoantes: %d\n"
fmt_digitos:      .asciz "Digitos: %d\n"
fmt_espacos:      .asciz "Espacos: %d\n"

    .section .text
    .globl main
    .extern printf, isalpha, isdigit, isspace, tolower

main:
    pushl %ebp
    movl %esp, %ebp

    movl $texto, %esi   # ponteiro para texto

loop:
    movzbl (%esi), %eax
    cmpb $0, %al
    je fim

    # checa se espaço
    pushl %eax
    call isspace
    addl $4, %esp
    testl %eax, %eax
    je check_digit
    addl $1, espacos
    jmp next

check_digit:
    movzbl (%esi), %eax
    pushl %eax
    call isdigit
    addl $4, %esp
    testl %eax, %eax
    je check_alpha
    addl $1, digitos
    jmp next

check_alpha:
    movzbl (%esi), %eax
    pushl %eax
    call isalpha
    addl $4, %esp
    testl %eax, %eax
    je next

    # converter para lowercase
    movzbl (%esi), %eax
    pushl %eax
    call tolower
    addl $4, %esp
    movb %al, %bl

    # verificar se é vogal
    movl $vogal_lista, %edi
check_vogal:
    movb (%edi), %al
    cmpb $0, %al
    je nao_vogal
    cmpb %al, %bl
    je eh_vogal
    incl %edi
    jmp check_vogal

eh_vogal:
    addl $1, vogais
    jmp next

nao_vogal:
    addl $1, consoantes

next:
    incl %esi
    jmp loop

fim:
    pushl vogais
    pushl $fmt_vogais
    call printf
    addl $8, %esp

    pushl consoantes
    pushl $fmt_consoantes
    call printf
    addl $8, %esp

    pushl digitos
    pushl $fmt_digitos
    call printf
    addl $8, %esp

    pushl espacos
    pushl $fmt_espacos
    call printf
    addl $8, %esp

    movl $0, %eax
    leave
    ret
