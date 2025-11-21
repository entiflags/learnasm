# macroses in fasm
1. **definition**: you define a macro using the `macro` directive, giving it a name and an
optional body enclosed in braces (`{}`)
```bash
macro pushregs {
    push rax rbx rcx rdx
}
```
2. **arguments**:
- 
