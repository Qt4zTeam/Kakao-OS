# Makefile
# The C and C++ rules are already setup by default.
# The only one that needs changing is the assembler 
# rule, as we use nasm instead of GNU as.

#CC=i486-slackware-linux-gcc

KERNEL=kernel

all: kernel img test

clean:
	(cd main; rm *.o kernel)

kernel:
	(cd main/; make)


img:
	mkdir -p /mnt/floppy
	
	mount -o loop floppy.img /mnt/floppy/
	cp main/$(KERNEL) /mnt/floppy/$(KERNEL)
	umount /mnt/floppy/

test:
	qemu-system-i386 -fda floppy.img
