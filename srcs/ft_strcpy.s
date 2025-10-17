section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rdi        ; save destination pointer to return later

.loop:
	mov dl, byte [rsi]  ; load byte from source
	mov byte [rdi], dl  ; store byte to destination

	cmp dl, 0           ; check if null terminator
	je .done            ; if zero, we're done

	inc rdi             ; move to next byte in destination
	inc rsi             ; move to next byte in source

	jmp .loop           ; repeat

.done:
	ret                 ; return original destination pointer in rax

; This section tells the linker the stack doesn't need to be executable
section .note.GNU-stack noalloc noexec nowrite progbits