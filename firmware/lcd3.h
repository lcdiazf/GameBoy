#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>

static void busy_wait(unsigned int ds)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(SYSTEM_CLOCK_FREQUENCY/10*ds);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}

static void lcd_write_reg(unsigned char address, unsigned short int value)
{
    lcd_test_ADDR_write(address);
    lcd_test_DATA_write(value);
    lcd_test_NUMBER_write(1);
    lcd_test_START_write(1);
    lcd_test_START_write(0);
    while(lcd_test_BUSY_read()){}
}

static void lcd_write_ntimes(unsigned short int value, unsigned int times)
{
    lcd_test_ADDR_write(0X22);
    lcd_test_DATA_write(value);
    lcd_test_NUMBER_write(times);
    lcd_test_START_write(1);
    lcd_test_START_write(0);
    while(lcd_test_BUSY_read()){}
}

static void lcd_reset_initial(void)
{
    lcd_test_START_write(3);
    lcd_test_START_write(0);
    while(lcd_test_BUSY_read()){}
}

static void lcd_initialize(void)
{
    lcd_write_reg(0x01, 0x0100);
    lcd_write_reg(0x10, 0x0000);
    lcd_write_reg(0x11, 0x0000);
    lcd_write_reg(0x12, 0x0000);
    lcd_write_reg(0x13, 0x0000);
    lcd_write_reg(0x14, 0x0000);
    busy_wait(0.4);
    lcd_write_reg(0x11, 0x0018); // power control 2
    lcd_write_reg(0x12, 0x6121); // power control 3
    lcd_write_reg(0x13, 0x006f); // power control 4
    lcd_write_reg(0x14, 0x495f); // power control 5
    lcd_write_reg(0x10, 0x0800); // power control 1
    busy_wait(0.1);
    lcd_write_reg(0x11, 0x103b); // power control 2
    busy_wait(0.5);
    lcd_write_reg(0x01, 0x011c); // driver output crtl
    lcd_write_reg(0x02, 0x0100); //LCD_AC_DRIVING_CTRL            
    lcd_write_reg(0x03, 0x1038); //ENTRY_MODE  
    lcd_write_reg(0x07, 0x0000); //DISP_CTRL1 
    lcd_write_reg(0x08, 0x0808);  //BLANK_PERIOD_CTRL1
    lcd_write_reg(0x0b, 0x1100); //FRAME_CYCLE_CTRL
    lcd_write_reg(0x0c, 0x0000);  //INTERFACE_CTRL    
    lcd_write_reg(0x0f, 0x0d01); //OSC_CTRL 
    lcd_write_reg(0x15, 0x0020);  //VCI_RECYCLING  
    lcd_write_reg(0x20, 0x0000); //RAM_ADDR_SET1
    lcd_write_reg(0x21, 0x0000);  //RAM_ADDR_SET2
    //============Gamma============
    lcd_write_reg(0x30, 0x0000);
    lcd_write_reg(0x31, 0x00db);
    lcd_write_reg(0x32, 0x0000);
    lcd_write_reg(0x33, 0x0000);
    lcd_write_reg(0x34, 0x00db);
    lcd_write_reg(0x35, 0x0000);
    lcd_write_reg(0x36, 0x00af);
    lcd_write_reg(0x37, 0x0000);
    lcd_write_reg(0x38, 0x00db);
    lcd_write_reg(0x39, 0x0000);
//    lcd_write_reg(0x3c, 0x0204);
//    lcd_write_reg(0x3d, 0x0004);
    //=============================
    lcd_write_reg(0x50, 0x0000); // set RAM address  horizontal start addres
    lcd_write_reg(0x51, 0x0808); //horizontal end addres
    lcd_write_reg(0x52, 0x080a); //vertical start addres
    lcd_write_reg(0x53, 0x000a); //vertical start addres
    lcd_write_reg(0x54, 0x0a08); //vertical start addres
    lcd_write_reg(0x55, 0x0808); //vertical start addres
    lcd_write_reg(0x56, 0x0000); //vertical start addres
    lcd_write_reg(0x57, 0x0a00); //vertical start addres
    lcd_write_reg(0x58, 0x0710); //vertical start addres
    lcd_write_reg(0x59, 0x070); //vertical end addres
//    busy_wait(0.80); //busy_wait 10ms
    lcd_write_reg(0x07, 0x0012); // display on
    busy_wait(0.5);
    lcd_write_reg(0x07, 0x1017); // display on
    lcd_write_reg(0x03, 0x1018); // display on
    lcd_write_reg(0x36, 0x00af); // display on
    lcd_write_reg(0x37, 0x0000); // display on
    lcd_write_reg(0x38, 0x00db); // display on
    lcd_write_reg(0x39, 0x0000); // display on
    lcd_write_reg(0x20, 0x0000); // display on
    lcd_write_reg(0x21, 0x0000);
}

