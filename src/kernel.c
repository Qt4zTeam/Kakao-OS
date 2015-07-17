#include <types.h>
#include <stddef.h>


typedef struct cursor_t 
{
	uint8_t x;
	uint8_t y;
	uint16_t position;
} cursor_t;

cursor_t cursor;
uint8_t* vidmem = (uint8_t*)0xB8000;

uint16_t cursor_position()
{
	cursor.position = cursor.y * 80 + cursor.x;
	return cursor.position;
}

void screen_init()
{
	cursor.x = 0;
	cursor.y = 0;

}

void screen_clear()
{
	for(size_t i = 0; i<25*80; i=i+2)
	{
		vidmem[i] = ' ';	// znak, w tym wypadku spacja
		vidmem[i+1] = 0x07;	// kolor, w tym wypadku szary na czarnym tle
	}
}




int32_t kernel_main()
{
	screen_clear();

	
	vidmem[0] = 'A';
	uint8_t znak = vidmem[0];
}