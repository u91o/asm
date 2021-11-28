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
