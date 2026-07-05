section .text
global _start

_start:
    ; XOR demonstration
    mov eax, 25
    xor eax, eax
    mov [result], eax

    ; TEST demonstration
    mov eax, [number]
    test eax, 1
    jz even_number

odd_number:
    mov dword [test_result], 1
    jmp end_program

even_number:
    mov dword [test_result], 0

end_program:
    mov eax, 1
    int 0x80

section .bss
result resd 1
test_result resd 1

section .data
number dd 7
