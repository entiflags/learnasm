# lodsb instruction
- the `LODSB` instruction is an x86 assembly mnemonic to **Load a String Byte**
from memory into the `AL` register.

It is a shorthand instruction that performs several steps implicitly:

1. **Reads a Byte**: it reads one byte of data from the memory address currently stored in
the `RSI` (Source Index) register.

2. **Stores in** `AL`: it copies that byte of data info the 8-bit `AL` register (the low byte of
`RAX`).

3. **Updates** `RSI`: it automatically increments or decrements the `RSI` register by 1,
preparing it to point to the next byte in the sequence.

## prerequisites for `LODSB`
to use `LODSB` effectively, you must set up two things beforehand:

1. `RSI `**must hold a valid memory address**: you must load the starting address of your
data (string or array) into `RSI`.
```bash
section .data readable writable
mydata: db 10h,20h,30h,40h

section .text writable
    lea rsi, [rel mydata]   ; RSI now points to 10h
```
2. **the direction flag (DF) determines the direction:**
    1. `CLD` (Clear Direction Flag) sets DF to 0, which makes `RSI` **increment** after the
    load (reading forward). This is standard behavior.
    2. `STD` (Set Direction Flag) sets DF to 1, which makes `RSI` **decrement** after the
    load (reading backward).

## example
lets trace how `LODSB` works with the Direction Flag cleared (`CLD`):
```bash
section .data readable writable
buffer db "ABCD"

section .text writable
    cld                     ; direction flag = 0 (RSI increments)
    lea rsi, [rel buffer]   ; RSI points to the memory of 'A'

    lodsb                   ; AL gets the ASCII value of 'A' (41h)
                            ; RSI increments to point to 'B'

    lodsb                   ; AL gets the ASCII value of 'B' (42h)
                            ; RSI increments to point to 'C'

    ; ... and so on
```
