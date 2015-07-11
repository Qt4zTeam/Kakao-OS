# Makefile
# The C and C++ rules are already setup by default.
# The only one that needs changing is the assembler 
# rule, as we use nasm instead of GNU as.

#CC=i486-slackware-linux-gcc

KERNEL=kernel

all: kernel img test

clean:
	(cd src; rm *.o kernel)

kernel:
	(cd src; make)


img:
	mkdir -p /mnt/floppy
	
	mount -o loop floppy.img /mnt/floppy/
	cp src/$(KERNEL) /mnt/floppy/$(KERNEL)
	umount /mnt/floppy/

test:
	bochs -f bochsrc -q
