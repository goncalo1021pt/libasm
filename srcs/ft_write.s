section .text
	global ft_write
	extern __errno_location

ft_write:
	mov rax, 1            ; syscall number for sys_write (rax is a double pourpose register)
	syscall			      ; invoke kernel
	
	cmp rax, 0            ; check if return value is negative
	jl .error             ; if rax < 0, handle error
	ret                   ; success: return number of bytes written

.error:
	neg rax               ; convert negative error code to positive
	mov rdi, rax          ; save error code
	call __errno_location ; get address of errno int register rax
	mov [rax], rdi        ; store error code in errno
	mov rax, -1           ; return -1 to indicate error
	ret

; This section tells the linker the stack doesn't need to be executable
section .note.GNU-stack noalloc noexec nowrite progbits
