; use ELF format
format ELF

; 32-bit code
use32

; external symbols
extrn 'kernel_main' as kernel_main ; kmain is defined in kmain.c

; symbols we're exporting
public start ; make entry point visible to the linker

; Multiboot header
MULTIBOOT_HEADER:
	.ALIGN    = 0x1                ; align loaded modules on page boundaries
	.MEMINFO  = 0x2                ; provide memory map
	.FLAGS    = 0x3                ; ALIGN | MEMINFO.  This is the Multiboot 'flag' field
	.MAGIC    = 0x1badb002         ; 'magic number' lets bootloader find the header
	.CHECKSUM = -(.MAGIC + .FLAGS) ; checksum required

section '.text' executable align 4

mboot:
	dd MULTIBOOT_HEADER.MAGIC
	dd MULTIBOOT_HEADER.FLAGS
	dd MULTIBOOT_HEADER.CHECKSUM

; reserve initial kernel space
STACKSIZE = 0x4000 ; 16k stack

start:
	mov esp, STACKSIZE 	; set up the stack
	push eax		; Multiboot magic number
	push ebx		; Multiboot info structure
	call kernel_main	; call the kernel
  
hang:
	cli

	hlt
	jmp hang