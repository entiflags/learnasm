# lea instruction
the `LEA` (Load Effective Address): it used **to calculate a memory address and
store that calculated address into a general-purpose register**, without
actually accessing memory.

in C programming terms, `LEA` is essentially the equivalent of the address-of operator
(`&`).

## key characteristics of `LEA`
- **no memory access**: unlike `MOV` with a memory operand (e.g., `mov eax, [ebx]`),
which fetches the data stored at that location, `LEA` only performs the *address
calculation and stores the numerical result*.
- **arithmetic capabilities**: The x86 architecture's complex addressing modes allow 
LEA to perform a combination of addition and scaling in a single instruction. This
makes it highly efficient for complex arithmetic operations that don't involve memory
access, such as multiplication by small constants (2, 3, 4, 5, 8, 9).
- **does not affect flags**: `LEA` does not modify any CPU flags (like the Zero Flag, Carry
Flag, etc.), which allows for arithmetic calculations without disrupting the state set by a
previous comparison or test instruction.

## syntax & operation
the general syntax for `LEA` is:
```bash
lea destreg, [sourcememop]
```
the source operand follows the flexible x86 memory addressing format:
*base + (index * scale) + displacement*
where:
- **base** is a base register (e.g., `RBX`).
- **index** is an index register (e.g., `RCX`).
- **scale** is a constant factor of 1, 2, 4, or 8.
- **displacement** is a constant offset value.
