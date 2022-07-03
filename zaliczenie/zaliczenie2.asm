%include "io64.inc"
section .data
    fn  db  "plik.txt", 0
section .bss
    fd  resb  1
    buf resb  20 
section .text

global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov rax, 2
    mov rdi, fn
    mov rsi, 0
    xor rdx, rdx
    syscall
    mov [fd], rax

    mov rax, 0
    mov rdi, [fd]
    mov rsi, buf
    mov rdx, 20
    syscall

    mov rax, 3
    mov rdi, [fd]
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, buf
    mov rdx, 20
    syscall
_end:
    mov rax, 60
    mov rdi, 0
    syscall