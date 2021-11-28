	.section .data

data_items:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0 # length 14

	.section .text

	.globl _start
_start:
	movl $0, %edi
	movl data_items(,%edi,4), %ebx

start_loop:
	incl %edi
	cmpl $14, %edi # check that we do not pass index 13
	je loop_exit

	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax
	jle start_loop

	movl %eax, %ebx
	jmp start_loop

loop_exit:
	movl $1, %eax
	int $0x80
