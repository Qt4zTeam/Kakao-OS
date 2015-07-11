; use ELF format
format ELF

; 32-bit code
use32

public kernel_main
kernel_main:
	mov ax, 0x10		; 0x10 is the offset in the GDT to our data segment
	mov ds, ax		; Load all data segment selectors
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	

	;call gdt_install
	mov byte [fs:0xB80F0], "G"
	mov byte [fs:0xB80F2], "D"
	mov byte [fs:0xB80F4], "T"
	ret

