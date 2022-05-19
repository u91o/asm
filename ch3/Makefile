TARGETS = $(basename $(wildcard ./*.s))

all: $(TARGETS)

$(TARGETS):
	as --32 $@.s -o $@.o
	ld -m elf_i386 $@.o -o $@
	rm $@.o

clean:
	rm $(TARGETS)
