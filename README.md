# Logical Instructions Lab

## Objective

The purpose of this lab was to learn how to use logical instructions in Assembly language using NASM on a Linux x86 system.

## Flowchart

1. Start the program.
2. Load a value into a register.
3. Use `xor` to clear the register to zero.
4. Store the result.
5. Use `test` to check if a value is even or odd.
6. Store the second result.
7. End the program.

## Challenges

One challenge was understanding that `xor` can be used to quickly clear a register by XORing it with itself. Another challenge was learning how the `test` instruction checks bits without changing the original value.

## Task 1: XOR With Itself

The instruction `xor eax, eax` changes the value of `eax` to `0`.

Example:

```asm
mov eax, 25
xor eax, eax
mov [result], eax
```

## Task 2: TEST Instruction Example

A practical use of `test` is checking whether a number is even or odd.

The instruction:

```asm
test eax, 1
```

checks the last bit of the number. If the last bit is `0`, the number is even. If the last bit is `1`, the number is odd.

## Assembly Code

```asm
section .text
global _start

_start:
    ; Demonstrate XORing a value with itself
    mov eax, 25
    xor eax, eax
    mov [result], eax

    ; Practical TEST example: check if number is even or odd
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
```

## Expected Results

* `result = 0` because `xor eax, eax` clears the register.
* `test_result = 1` because `number = 7`, and 7 is odd.

## Compile and Run

```bash
nasm -f elf32 logical.asm -o logical.o
ld -m elf_i386 logical.o -o logical
./logical
```

## Debugging

Use these GDB commands:

```gdb
layout asm
layout regs
watch (int) result
break _start
run
stepi
```

You can also watch `test_result`:

```gdb
watch (int) test_result
```

## Files Included

* `README.md`
* `logical.asm`
