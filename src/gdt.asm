gdt_install:
	lgdt [gdtr]
	mov ax, 0x10		; 0x10 is the offset in the GDT to our data segment
	mov ds, ax		; Load all data segment selectors
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	jmp 0x08:.flush		; 0x08 is the offset to our code segment: Far jump!
.flush:
	ret

;----------------------------------------------------------;
; BOS kernel                Christoffer Bubach, 2004-2005. ;
;----------------------------------------------------------;
;                                                          ;
;     Global Descriptor Table (GDT).                       ;
;                                                          ;
;----------------------------------------------------------;

;-------------------;
;  pointer to GDT   ;
;-------------------;
gdtr:
	.size		dw gdt_end - gdt - 1
	.address	dd gdt		      ; this is where we move
						      ; the gdt
;-----------------------------------;
;  Global Descriptor Table (GDT).   ;
;-----------------------------------;
gdt:
	.null		dw 0x0000, 0x0000, 0x0000, 0x0000 ; null desc.
	.code:		dw 0xFFFF, 0x0000, 0x9A00, 0x00CF ; 0x08 , was 9800 before.
	.data:		dw 0xFFFF, 0x0000, 0x9200, 0x00CF ; 0x10
	.16code:	dw 0xFFFF, 0x0000, 0x9A00, 0x0000 ; 0x18
	.16data:	dw 0xFFFF, 0x0000, 0x9200, 0x0000 ; 0x20

gdt_end:
