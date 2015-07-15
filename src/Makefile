# Makefile for JamesM's kernel tutorials.
# The C and C++ rules are already setup by default.
# The only one that needs changing is the assembler 
# rule, as we use nasm instead of GNU as.

SOURCES=start.o kernel.o

CFLAGS=-c -I ../include/
LDFLAGS=-Tlink.ld
ASFLAGS=-f elf
CC=tcc

all: $(SOURCES) link

clean:
	-rm *.o kernel

link:
	i386-elf-ld $(LDFLAGS) -o kernel $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<
