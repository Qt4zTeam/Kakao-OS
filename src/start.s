format elf

use32



MULTIBOOT_HEADER_MAGIC = 0x1BADB002
MULTIBOOT_HEADER_FLAGS = 00000000000000010000000000000000b
CHECKSUM = -(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)

LOADBASE = 0x00100000
STACK_SIZE = 0x4000

public _start
_start:
	jmp multiboot_entry

	align 4

multiboot_header:
	dd MULTIBOOT_HEADER_MAGIC
	dd MULTIBOOT_HEADER_FLAGS
	dd CHECKSUM
	dd LOADBASE + multiboot_header 	; header adress
	dd LOADBASE 			; multiboot header adress
	dd 00
	dd 00
	dd LOADBASE + multiboot_entry 	; entry adress
	db 'hello'

multiboot_entry:
	mov esp, (stack_buffer + STACK_SIZE) ; stack
	push 0 ; eflags
	popf
	push ebx
	push ebx

	mov byte [fs:0xB80F0], "G"
	mov byte [fs:0xB80F2], "D"
	mov byte [fs:0xB80F4], "T"

	extrn test_main
	call test_main

	cli
	hlt

_data:
stack_buffer:
	times STACK_SIZE db 0
_end: