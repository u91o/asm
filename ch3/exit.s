	.section .data
	.section .text
	.globl _start
_start:
	# exit syscall
	movl $1, %eax
	# set exit code
	movl $127, %ebx
	# interrupt
	int $0x80
