;
; start.s -- Kernel start location. Also defines multiboot header.
;

BITS 32                      ; All instructions should be 32-bit.

LOADBASE equ 0x100000


GLOBAL mboot, start
EXTERN code, bss, end                   ; End of the last loadable section.

mboot:
	dd  0x1BADB002		; GRUB will search for this value on each
				; 4-byte boundary in your kernel file
	dd  0x00010000		; How GRUB should load your file / settings
	dd  -(0x1BADB002 + 0x00010000)          ; To ensure that the above values are correct
    
	dd  mboot		; Location of this descriptor
	dd  code		; Start of kernel '.text' (code) section.
	dd  bss			; End of kernel '.data' section.
	dd  end			; End of kernel.
	dd  start		; Kernel entry point (initial EIP).

EXTERN kernel_main
start:
	mov esp, 0x400000

	push eax



	call kernel_main

	cli
	jmp $


