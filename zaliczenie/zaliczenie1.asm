%include "io64.inc"
section .data
    arr1    dq  8, 4, 3, 10, 9, 1, 6, 11, 2, 7
section .bss
    result  resq    1
section .text
global CMAIN
CMAIN:
    mov rbp, rsp
    mov rcx, 4
    mov rsi, 0
    mov rbx, 0
sumLoop:
    mov rax, qword [arr1+rsi*8]
    cmp rax, 9
    ja break
    cmp rax, 4
    jb break
    add rbx, rax
break:
    inc rsi
    loop sumLoop
    mov qword [result], rbx
_end:
    mov rax, 60
    mov rdi, 0
    syscall