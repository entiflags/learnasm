# main syscalls
This file will be introduce the main syscalls using in linux (sorry for bad english).

## write
- the `write` syscall is priting to the screen.
```bash
cdef: size_t write(unsigned int fd, const char *buf, size_t count);
```
- `fd`: the file descriptor. For the console, you typically use `1`
 (stdout) or `2` (stderr).
- `buf`: a pointer to the buffer containing the data to write.
- `count`: the number of bytes to write from the buffer.
**syscall number**
the syscall number for `write` is architecture-dependent:
- on **x86_64** syscall number is `1`.
- on older **i386** the number is `4`.
```bash
syntax:
mov rax, 1          ; the syscall number for 'write', which is 1
mov rdi, 1          ; file descriptor (e.g., '1' for stdout/console)
mov rsi, buf        ; pointer to the buffer (the string to write)
mov rdx, 14         ; number of bytes to write, '14' for hello world, orelse
                    ; create msglen for getting length for buffer
syscall             ; call the syscall
```

## exit/exit_group
- the `exit_group` used for exiting a program. A related, older is
`exit`.
```bash
cdef: void exit_group(int status);
```
- `status`: the exit status code of the program (e.g., `0` for success,
non-zero for error).
**syscall number**
the syscall number for `exit_group` is architecture-dependent:
- on **x86_64** syscall number is `231`.
- on older **i386** the number is `252`.
- the older `exit` syscall number is `60` on **x86_64** and `1` on **i386**.
```bash
syntax for exit_group:
mov rax, 231        ; the syscall number for `exit_group`, which is 231
mov rdi, 0          ; exit status cpde (e.g., '0' for success)
syscall             ; call the syscall
```
```bash
syntax for exit:
mov rax, 60         ; the syscall number for 'exit', which is 60
mov rdi, 0          ; exit status code (e.g., '0' for success)
syscall             ; call the syscall
```
