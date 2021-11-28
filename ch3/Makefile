TARGETS = $(basename $(wildcard ./*.s))

all: $(TARGETS)

$(TARGETS):
	as $@.s -o $@.o
	ld $@.o -o $@
	rm $@.o

clean:
	rm $(TARGETS)
