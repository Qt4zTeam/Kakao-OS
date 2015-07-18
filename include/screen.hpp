#ifndef SCREEN_HPP
#define SCREEN_HPP

class screen_c
{
public:
	uint8_t cursor_x;
	uint8_t cursor_y;

	uint16_t cursor_position;

	uint8_t* vidmem;

	screen_c()
	{
		this->cursor_x = 0;
		this->cursor_y = 0;
		this->cursor_position = 0;
		this->vidmem = (uint8_t*)0xB8000;
	}
	
	void put_char(uint8_t c);
	void move_cursor();
	void clear();
	void write(int8_t *c);

	
};

#endif
