# Makefile for JamesM's kernel tutorials.
# The C and C++ rules are already setup by default.
# The only one that needs changing is the assembler 
# rule, as we use nasm instead of GNU as.

SOURCES=start.o kernel.o

CFLAGS=-c -I ../include/ -ffreestanding -O2 -Wall -Wextra
LDFLAGS=-Tlink.ld -ffreestanding -O2 -nostdlib -lgcc
ASFLAGS=-f elf
CC=tcc

all: $(SOURCES) link

clean:
	-rm *.o kernel

link:
	i386-elf-gcc $(LDFLAGS) -o kernel $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<

.c.o:
	$(CC) $(CFLAGS) $<
