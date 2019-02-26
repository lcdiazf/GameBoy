#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>
#include "./lcd.h"

typedef struct {
	volatile uint32_t write;
	volatile uint32_t write2;

} led_t;


led_t  *ledf  = (led_t *)   0xe0005800;


static char *readstr(void)
{
	char c[2];
	static char s[64];
	static int ptr = 0;

	if(readchar_nonblock()) {
		c[0] = readchar();
		c[1] = 0;
		switch(c[0]) {
			case 0x7f:
			case 0x08:
				if(ptr > 0) {
					ptr--;
					putsnonl("\x08 \x08");
				}
				break;
			case 0x07:
				break;
			case '\r':
			case '\n':
				s[ptr] = 0x00;
				putsnonl("\n");
				ptr = 0;
				return s;
			default:
				if(ptr >= (sizeof(s) - 1))
					break;
				putsnonl(c);
				s[ptr] = c[0];
				ptr++;
				break;
		}
	}

	return NULL;
}

static char *get_token(char **str)
{
	char *c, *d;

	c = (char *)strchr(*str, ' ');
	if(c == NULL) {
		d = *str;
		*str = *str+strlen(*str);
		return d;
	}
	*c = 0;
	d = *str;
	*str = c+1;
	return d;
}

static void prompt(void)
{
	printf("RUNTIME>");
}

static void help(void)
{
	puts("Available commands:");
	puts("help                            - this command");
	puts("reboot                          - reboot CPU");
	puts("display                         - display test");
	puts("led                             - led test");
	puts("led2                            - led2 test");
	puts("spi                             - spi test");
    puts("LCD_FILLBLUE                    - LCD test");
    puts("t                               - LCD test");
}

static void reboot(void)
{
	asm("call r0");
}

static void display_test(void)
{
	int i;
	printf("display_test...\n");
	for(i=0; i<6; i++) {
		display_sel_write(i);
		display_value_write(i);
		display_write_write(1);
	}
}

static void LCD(void)
{
    lcd_test_CS__write(1);
    lcd_test_CS__write(0);
    lcd_reset_initial(); 
    lcd_initialize();
    //lcd_write_reg(0x21, 0x0000, 0);
    //lcd_write_reg(0x29, 0x0000, 0);
    lcd_write_ntimes(0x001F,76800);    
    lcd_test_CS__write(0);
}

static void console_service(void)
{
	char *str;
	char *token;

	str = readstr();
	if(str == NULL) return;
	token = get_token(&str);
	if(strcmp(token, "help") == 0)
		help();
	else if(strcmp(token, "reboot") == 0)
		reboot();
	else if(strcmp(token, "display") == 0)
		display_test();
    else if(strcmp(token, "LCD") == 0)
        LCD();
    else if(strcmp(token, "t") == 0)
        lcd_test_CS__write(1);
        lcd_test_CS__write(0);
        lcd_initialize();
        lcd_write_reg(0x21, 0x0000, 0); // no parameter inversion ON ???
        lcd_write_reg(0x29, 0x0000, 0); // no parameter display ON
        lcd_write_ntimes(0x00ff,76800);
        lcd_test_CS__write(1);
	prompt();
}

int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();

	puts("\nLab004 - CPU testing software built "__DATE__" "__TIME__"\n");
	help();
	prompt();

	while(1) {
		console_service();
	}

	return 0;
}

//--------------OTHERS VOIDS SAVED-------------//

/*static void out_test(void)
{
    int i=50;
    while(i>0){        
        SD_out_write(0);
        busy_wait(1);    
        SD_out_write(1);
        busy_wait(1);   
        i--;    
    }
}


static void led_test(void)
{
	int i;
	printf("led_test...\n");
	for(i=0; i<32; i++) {
		leds_out_write(i);
		busy_wait(1);
	}
}


//---------------------FALTANTE DE CONSOLE SERVICE--------------
	else if(strcmp(token, "led") == 0)
		led_test();
	else if(strcmp(token, "led2") == 0)
		led2_test();
//	else if(strcmp(token, "spi") == 0)
//		spi_test();
//	else if(strcmp(token, "out") == 0)
//		out_test();
	else if(strcmp(token, "I2C") == 0)
		I2C();
*/
