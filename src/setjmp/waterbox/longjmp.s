# From midipix's mmglue
.global __longjmp
.global _longjmp
.global longjmp
.type __longjmp,@function
.type _longjmp,@function
.type longjmp,@function
__longjmp:
_longjmp:
longjmp:
	test %edx, %edx		# is val zero?
	jne  1f			# no:  return val
	xor  $1,   %edx		# yes: return one

1:
	mov  %edx, %eax		# return value

2:
	mov  0x10(%rcx), %rbx	# restore regs
	mov  0x18(%rcx), %rbp
	mov  0x20(%rcx), %rdi
	mov  0x28(%rcx), %rsi
	mov  0x30(%rcx), %r12
	mov  0x38(%rcx), %r13
	mov  0x40(%rcx), %r14
	mov  0x48(%rcx), %r15

	mov  0x08(%rcx), %rsp	# saved stack pointer
	mov  (%rcx),     %rdx	# return address
	jmp  *%rdx		# return
