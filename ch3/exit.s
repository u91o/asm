	.section .data
	.section .text
	.globl _start
_start:
	movl $1, %eax      # exit syscall
	movl $127, %ebx    # set exit code
	int $0x80          # interrupt
