section .text
	global ft_read
	extern __errno_location

ft_read:
	mov rax, 0            ; syscall number for sys_read
	syscall               ; invoke kernel

	cmp rax, 0            ; check if return value is negative
	jl .error             ; if rax < 0, handle error
	ret                   ; success: return number of bytes read

.error:
	neg rax               ; convert negative error code to positive
	mov rdi, rax          ; save error code
	call __errno_location ; get address of errno int register rax
	mov [rax], rdi        ; store error code in errno
	mov rax, -1           ; return -1 to indicate error
	ret

; This section tells the linker the stack doesn't need to be executable
section .note.GNU-stack noalloc noexec nowrite progbits