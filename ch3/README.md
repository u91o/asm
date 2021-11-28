# Review
## Know the Concepts
* What does if mean if a line in the program starts with the ’#’ character?

	The line is a comment.

* What is the difference between an assembly language file and an object code
  file?

	Assembly code is human readable source code, while object code is assembly
    code that has been transformed to machine code (albeit incomplete) by an
    assembler.

* What does the linker do?

	The linker puts object files together and adds information to it that
    allows the kernel to know how to load and run them.

* How do you check the result status code of the last program you ran?

	You can check it by doing <code>echo $?</code>, which is a special shell
    parameter that expands to the exit status of the most recently executed
    foreground command.

* What is the difference between <code>movl $1, %eax</code> and <code>movl 1,
  %eax</code>?

	<code>movl $1, %eax</code> moves the number 1 into <code>%eax</code>,
	while <code>movl 1, %eax</code> moves the contents of the memory address
	12 into <code>%eax</code>.

* Which register holds the system call number?

  <code>%eax</code>

* What are indexes used for?

	Indexes are used to iterate over and access blocks of memory addresses.
	
* Why do indexes usually start at 0?

	An index of 0 allows us to cancel out the multiplier and start iterating
	from the base memory address.
	
* If I issued the command <code>movl data_items(,%edi,4), %eax</code> and
data_items was address 3634 and <code>%edi</code> held the value 13, what
address would you be using to move into <code>%eax</code>?

	3634+13*4 = 3638
	

* List the general-purpose registers.

	<code>%eax, %ebx, %ecx, %edx, %edi, %esi</code>

* What is the difference between <code>movl</code> and <code>movb</code>?

	<code>movl</code> copies a word of data from one memory address to
	another, while <code>movb</code> operates on individual bytes.

* What is flow control?

	Flow control instructs the computer on which steps to follow and which
	paths to take during program execution.

* What does a conditional jump do?

	A conditional jump changes paths based on the results of a previous
    comparison or calculation.

* What things do you have to plan for when writing a program?

	+ The storage of data.
	+ The procedures required to perform computation on the data.
	+ Storage needed to carry out the procedures.
	+ Is additional memory (excluding registers) required?

* Go through every instruction and list what addressing mode is being used for
each operand.

	<code>movl $0, %edi</code> - immediate mode
	
	<code>movl data_items(,%edi,4), %eax</code> - indexed addressing mode
	
	<code>movl %eax, %ebx</code> - register addressing mode
	
	<code>cmpl $0, %eax</code> - immediate addressing mode
	
	<code>incl %edi</code> - register addressing mode
	
	<code>cmpl %ebx, %eax</code> - register addressing mode

	<code>movl $1, %eax</code> - immediate addressing mode

	<code>int $0x80</code> - immediate addressing mode

## Use the Concepts
* Modify the first program to return the value 3.

	See <code>exit-3.s</code>

* Modify the maximum program to find the minimum instead.

	See <code>minimum.s</code>

* Modify the maximum program to use the number 255 to end the list rather than
the number 0

	See <code>maximum-255.s</code>
	
* Modify the maximum program to use an ending address rather than the number
0 to know when to stop.

	See <code>maximum-addr.s</code>
	
* Modify the maximum program to use a length count rather than the number 0 to
know when to stop.

	See <code>maximum-len.s</code>

* What would the instruction <code>movl _start, %eax</code> do? Be specific,
based on your knowledge of both addressing modes and the meaning of
<code>_start</code>. How would this differ from the instruction <code>movl
$_start, %eax</code>?

    <code>movl $_start, %eax</code> loads the address of the
    <code>_start</code> symbol into <code>%eax</code>, while <code>movl
    _start, %eax</code> would load 4 bytes of memory at the address of
    <code>_start</code> into <code>%eax</code>.

## Going Further

* Modify the first program to leave off the int instruction line. Assemble,
link, and execute the new program. What error message do you get. Why do you
think this might be?

	Leaving off the int instruction causes a segmentation fault. This is
    because the program has no idea where to stop execution and continues to
	execute whatever bytes are in the memory after the program. The segfault
	occurs when the program runs into unmapped memory or memory that is does
	not have access to.
	
* So far, we have discussed three approaches to finding the end of the list -
using a special number, using the ending address, and using the length
count. Which approach do you think is best? Why? Which approach would you use
if you knew that the list was sorted? Why?

	To determine which approach is best, I think that listing the
	disadvantages of each approach would be more appropriate. The use of a
	special number means that said number would not be able to be used in the
	middle of the list as it would risk terminating the loop
	prematurely. Using a length counter runs the risk of user error if the
	programmer sets an incorrect length, allowing the program to read past the
	buffer. There are no real disadvantages to using a symbol to mark the
	ending address of the buffer as the program would calculate it
	dynamically, thus making it the best approach.

	With a sorted list, I would still use the address approach as it is the
	most reliable. However, if speed were the priority, I believe the length
	approach would be better as it requires less instructions.
