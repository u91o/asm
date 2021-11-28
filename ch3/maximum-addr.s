	.section .data

data_items:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
data_end:

	.section .text

	.globl _start
_start:
	movl $0, %edi
	movl data_items(,%edi,4), %ebx    # biggest
	leal data_end, %ecx               # load %ecx with ending address

start_loop:
	incl %edi                         # increment index
	leal data_items(,%edi,4), %eax    # get address
	cmpl %eax, %ecx                   # check if ending address
	je loop_exit

	movl (%eax), %eax                 # load value
	cmpl %ebx, %eax
	jle start_loop

	movl %eax, %ebx
	jmp start_loop

loop_exit:
	movl $1, %eax
	int $0x80
