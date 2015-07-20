#include <types.h>
#include <stddef.h>
#include <asm/io.h>



uint8_t* video_memory = (uint8_t*)0xB8000;
uint8_t cursor_x = 0;
uint8_t cursor_y = 0;
uint16_t cursor_position = 0;
uint8_t color = 0x07;


void os_set_cursorxy(uint8_t x, uint8_t y);
void os_print_char(uint8_t c);
void os_print_string(uint8_t* c);
void os_clear_screen();
void os_scroll_up();



void os_set_cursorxy(uint8_t x, uint8_t y) 
{
	cursor_x = x;
	cursor_y = y;
	cursor_position = cursor_y * 80  + cursor_x;

	outb(0x3D4, 14);                  // Tell the VGA board we are setting the high cursor byte.
	outb(0x3D5, cursor_position >> 8); // Send the high cursor byte.
	outb(0x3D4, 15);                  // Tell the VGA board we are setting the low cursor byte.
	outb(0x3D5, cursor_position);      // Send the low cursor byte.

}

void os_print_char(uint8_t c) 
{
	uint16_t cell = cursor_position * 2;

	// backspace
	if(c == 0x08 && cursor_x) 
	{
		cursor_x--;
	} else if(c == '\n') {
		cursor_x = 0;
		cursor_y++;
	} else if(c == '\r') {
		cursor_x = 0;
	} else {
		video_memory[cell] = c;
		cursor_x++;
	}
	os_scroll_up();
	os_set_cursorxy(cursor_x, cursor_y);
}

void os_print_string(uint8_t* c) 
{
	size_t i = 0;
	while(c[i])
	{
		os_print_char(c[i++]);
	}
}

void os_clear_screen() 
{
	for(size_t i = 0; i < 80 * 25 * 2; i = i+2) 
	{
		video_memory[i] = ' ';
		video_memory[i+1] = color;
	}
	os_set_cursorxy(0, 0);
}

void os_scroll_up()
{
	if(cursor_y >= 25)
	{
		for(size_t i = 0; i < 25*80*2; i++)
		{
			video_memory[i] = video_memory[i+160]; 
		}
		

	cursor_y = 24;	
	}
	
}



void kernel_main() 
{
	os_clear_screen();

	for(size_t i = 0; i< 250; i++)
		os_print_string("hello world \n");




	for(;;);
}



