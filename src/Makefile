# Makefile for JamesM's kernel tutorials.
# The C and C++ rules are already setup by default.
# The only one that needs changing is the assembler 
# rule, as we use nasm instead of GNU as.

SOURCES=test.o start.o 

CFLAGS=-c
LDFLAGS=-Tlink.ld
ASFLAGS=
CC=tcc

all: $(SOURCES) link

clean:
	-rm *.o kernel

link:
	i586-elf-ld $(LDFLAGS) -o kernel $(SOURCES)

.s.o:
	fasm $(ASFLAGS) $< $*.o
