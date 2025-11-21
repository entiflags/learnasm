format ELF64 executable
segment readable executable

_start:
   ; lets write an string into the console =)
   mov rax, 1       ; write(
   mov rdi, 1       ;       stdout,
   mov rsi, msghello;       msghello,
   mov rdx, msghellolen;    msghellolen
   syscall          ; );
   ; exit from our program
   mov rax, 60      ; exit(
   mov rdi, 0       ;       0
   syscall          ; );

segment readable
msghello: db "Hello world",0dh,0ah,0
msghellolen = $ - msghello
