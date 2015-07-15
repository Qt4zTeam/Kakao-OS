#include <types.h>
#include <stddef.h>


void cpuid()
{

}



int32_t kernel_main()
{
	uint8_t* vidmem = (uint8_t*)0xb8000;
	vidmem[0] = 'C';
	vidmem[1] = 0x07; /* Light grey on black */
	vidmem[2] = 'B';
	vidmem[4] = 'A';

	for(size_t i; i<25*80; i=i+2)
	{
		vidmem[i] = 0x20;
	}
}