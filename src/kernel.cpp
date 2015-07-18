#include <types.hpp>
#include <stddef.hpp>
#include <screen.hpp>
/*
uint8_t cursor_x = 0;
uint8_t cursor_y = 0;

uint16_t cursor_position = 0;

uint8_t* vidmem = (uint8_t*)0xB8000;

 

void screen_init()
{
	cursor_x = 0;
	cursor_y = 0;
}

void screen_set_color(uint8_t color)
{
	for(size_t i = 0; i<25*80; i=i+2)
	{
		vidmem[i+1] = color;	// kolor, w tym wypadku szary na czarnym tle
	}
}


*/

class kernel_c
{
public:

};

uint32_t main()
{
	screen_c screen;

	screen.clear();

	screen.write("Hello world!");
}