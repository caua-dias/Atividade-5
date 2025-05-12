.intel_syntax noprefix
.global main
.extern printf

.section .data
fmt:        .asciz "%d "
newline_str:.asciz "\n"
msgA:       .asciz "Matriz A:\n"
msgB:       .asciz "Matriz B:\n"
msgSoma:    .asciz "Matriz Soma:\n"

mtzA:       .long 1,2,3,4,5,6,7,8,9
mtzB:       .long 1,2,3,4,5,6,7,8,9
mtzSoma:    .zero 36

.section .text
main:
    push ebp
    mov ebp, esp

    # Mostrar Matriz A
    push offset msgA
    call printf
    add esp, 4
    call print_matrizA

    # Mostrar Matriz B
    push offset msgB
    call printf
    add esp, 4
    call print_matrizB

    # Calcular Soma das Matrizes
    xor ecx, ecx           # linha
soma_linhas:
    cmp ecx, 3
    jge mostra_soma
    xor edx, edx           # coluna
soma_colunas:
    cmp edx, 3
    jge proxima_linha

    mov eax, ecx
    imul eax, 3
    add eax, edx           # eax = índice linear

    mov esi, [mtzA + eax*4]
    mov edi, [mtzB + eax*4]
    add esi, edi
    mov [mtzSoma + eax*4], esi

    inc edx
    jmp soma_colunas
proxima_linha:
    inc ecx
    jmp soma_linhas

mostra_soma:
    push offset msgSoma
    call printf
    add esp, 4
    call print_matrizSoma

    mov esp, ebp
    pop ebp
    mov eax, 0
    ret

print_newline:
    push offset newline_str
    call printf
    add esp, 4
    ret

# Imprimir matriz genérica
# Entradas via label de dados
print_matriz_generic:
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx

    mov esi, 0             # linha
print_linha:
    cmp esi, 3
    jge fim_print

    mov edi, 0             # coluna
print_coluna:
    cmp edi, 3
    jge prox_linha

    mov eax, esi
    imul eax, 3
    add eax, edi           # índice linear

    mov ebx, [ebp+8]       # ponteiro para a matriz
    mov eax, [ebx + eax*4]

    push eax
    push offset fmt
    call printf
    add esp, 8

    inc edi
    jmp print_coluna

prox_linha:
    call print_newline
    inc esi
    jmp print_linha

fim_print:
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret

# Wrapper para mtzA
print_matrizA:
    push offset mtzA
    call print_matriz_generic
    add esp, 4
    ret

# Wrapper para mtzB
print_matrizB:
    push offset mtzB
    call print_matriz_generic
    add esp, 4
    ret

# Wrapper para mtzSoma
print_matrizSoma:
    push offset mtzSoma
    call print_matriz_generic
    add esp, 4
    ret
