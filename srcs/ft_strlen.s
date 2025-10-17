section .text
    global ft_strlen

ft_strlen:
    mov rax, 0                ; length counter = 0 also rax will hold the return value

.loop:
    mov dl, byte [rdi + rax]  ; load byte at rdi[rax] dl is the lowest byte of rdx
    cmp dl, 0                 ; check if null terminator
    je .done                  ; if prossor flag 0, we're done

    inc rax                   ; increment length counter
    jmp .loop                 ; repeat

.done:
    ret                       ; rax contains the length

; This section tells the linker the stack doesn't need to be executable
section .note.GNU-stack noalloc noexec nowrite progbits
