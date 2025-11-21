format ELF64 executable
segment readable executable

macro print msg  {
    mov rsi, msg
    mov rdx, ($-msg) ; len
    call printstr
}

_start:
   ; lets write an string into the console
   ;mov rax, 1       ; write(
   ;mov rdi, 1       ;       stdout,
   ;mov rsi, msg00   ;       msg00,
   ;mov rdx, msg00len;       msg00len
   ;syscall          ; );
 
   ;mov rax, 1       ; write(
   ;mov rdi, 1       ;       stdout,
   ;mov rsi, msg01   ;       msg01,
   ;mov rdx, msg01len;       msg01len
   ;syscall          ; );
   print msg00
   ; exit from our program
   mov rax, 60      ; exit(
   mov rdi, 0       ;       0
   syscall          ; );
   
printstr:
    push rsi
    xor rdx, rdx

.loop:
    cmp byte [rsi], 0
    je .end
    inc rsi
    inc rdx
    jmp .loop

.end:
    pop rsi
    
    mov rax, 1
    mov rdi, 1
    syscall

    ret

segment readable
msg00: db "Hello world",0dh,0ah,0
msg00len = $ - msg00
msg01: db "message 01",0dh,0ah,0
msg01len = $ - msg01
