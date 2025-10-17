section .text
	global ft_strcmp

ft_strcmp:
	mov rax, 0              ; clear rax to use as return value

.loop:
	mov dl, byte [rdi]      ; load byte from s1
	mov bl, byte [rsi]      ; load byte from s2 bl is the lowest byte of rbx

	cmp dl, bl              ; compare bytes
	jne .not_equal          ; if not equal, jump to not_equal

	cmp dl, 0               ; check if null terminator
	je .done                ; if zero, strings are equal

	inc rdi                 ; move to next byte in s1
	inc rsi                 ; move to next byte in s2
	jmp .loop               ; repeat

.not_equal:
	movzx rax, dl         ; zero-extend dl to rax
	movzx rdx, bl         ; zero-extend bl to rdx
	sub rax, rdx          ; rax = dl - bl
	ret				      ; return difference in rax

.done:
	ret                     ; return 0 in rax (strings are equal)

; This section tells the linker the stack doesn't need to be executable
section .note.GNU-stack noalloc noexec nowrite progbits