section .text
	global ft_strdup
	extern malloc
	extern ft_strlen
	extern ft_strcpy

ft_strdup:
	test rdi, rdi           ; test if rdi (input string) is NULL
	jz .error               ; if NULL, return NULL

	push rdi                ; save original string on stack
	call ft_strlen          ; rax now contains the length
	
	inc rax                 ; add 1 for null terminator
	mov rdi, rax            ; move size to rdi (first argument for malloc)
	call malloc             ; call malloc, rax now contains pointer to allocated memory
	
	test rax, rax           ; test if malloc returned NULL
	jz .malloc_failed       ; if NULL, clean up and return NULL
	
	; Copy string using ft_strcpy
	mov rdi, rax            ; destination = allocated memory
	pop rsi                 ; source = original string (from stack)
	call ft_strcpy          ; copy string, rax contains destination pointer
	
	ret                     ; return pointer to duplicated string

.malloc_failed:
	pop rdi                 ; clean up stack (remove saved string pointer)
	mov rax, 0              ; return NULL
	ret

.error:
	mov rax, 0              ; return NULL
	ret

; This section tells the linker the stack doesn't need to be executable
section .note.GNU-stack noalloc noexec nowrite progbits