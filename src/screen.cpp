#include <types.hpp>
#include <stddef.hpp>
#include <screen.hpp>

void screen_c::put_char(uint8_t c)
{
	uint32_t tmp = cursor_position * 2;
	this->vidmem[tmp] = c;
	this->cursor_position++;	
}

void screen_c::move_cursor()
{
	
}

void screen_c::clear()
{
	for(size_t i = 0; i<25*80; i=i+2)
	{
		this->vidmem[i] = ' ';	// znak, w tym wypadku spacja
		this->vidmem[i+1] = 0x07;	// kolor, w tym wypadku szary na czarnym tle
	}
}

void screen_c::write(int8_t *c)
{
	size_t i = 0;
	while(c[i])
	{
		this->put_char(c[i++]);
	}	
}