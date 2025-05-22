section .text
    global ft_strlen

ft_strlen:
    ; rdi = pointer to the string
    mov rax, 0          ; length counter = 0

.loop:
    mov al, byte [rdi]  ; load byte at address in rdi into al
    cmp al, 0           ; check if null terminator sets ZF if al == 0 zf == cpu flag
    je .done            ; if zero, we're done checks ZF and executes if zf == TRUE 

    inc rdi             ; move to next char
    inc rax             ; increment length
    jmp .loop           ; repeat

.done:
    ret
