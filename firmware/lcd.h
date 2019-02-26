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

static void lcd_write_reg(unsigned char address, unsigned short int value, unsigned char option)
{
    lcd_test_ADDR_write(address);
    lcd_test_DATA_write(value);
    lcd_test_OPTION_write(option);
    lcd_test_START_write(1);
    lcd_test_START_write(0);
    while(lcd_test_BUSY_read());
    busy_wait(1); //ojo con esto, demora mucho la vaina
}
static void lcd_write_ntimes(unsigned short int value, unsigned int times)
{
    lcd_test_ADDR_write(0x3c);
    lcd_test_DATA_write(value);
    lcd_test_NUMBER_write(times);
    lcd_test_OPTION_write(0);
    lcd_test_START_write(1);
    lcd_test_START_write(0);
    while(lcd_test_BUSY_read());
}

static void lcd_reset_initial(void) //esto puede ser innecesario
{
    lcd_test_START_write(3);
    lcd_test_START_write(0);
    while(lcd_test_BUSY_read()){}
}

static void lcd_initialize(void)
{
    lcd_write_reg(0x01, 0x00, 1); //no parameter
    busy_wait(0.06);
    lcd_write_reg(0x28, 0x00, 1); //no parameter driver output control ,the shift direction of outputs is from S720 to S1.
    lcd_write_reg(0xc0, 0x23, 1); // set gvdd level to 4.60 V
    lcd_write_reg(0xc1, 0x10, 1); // Sets the factor used in the step-up circuits. AVDD:VCIx2; VGH:VCIx7; VGL:VCIx4s 
    lcd_write_reg(0x00c5, 0x2b2b, 0); // VCOM CONTROL 1 two parameter 1: Set the VCOMH voltage. 3.775V   2:Set the VCOML voltage. -1.425V
    lcd_write_reg(0xc7, 0xc0, 1); // VCOM CONTROL 2 Set the VCOM offset voltage.
    lcd_write_reg(0x36, 0x88, 1); // MEMORY ACCESS CONTROL defines read/write scanning direction of frame memory. MY=1; BGR=1;  experimentar
    lcd_write_reg(0x3a, 0x55, 1); // set RGB Interface Format to 16bits/pixel and for MCU Interface Format 16bits/pixel 
    lcd_write_reg(0x00b1, 0x001b, 0); //division ratio for internal clocks when Normal mode: fosc. frame rate 70Hz 27 clocks per line
    lcd_write_reg(0xb7, 0x07, 1); // ENTRY MODE disable low voltaje and normal display and deep standby mode disable
    lcd_write_reg(0x11, 0x00, 1); // no parameter This command turns off sleep mode.
    busy_wait(1.5);
    busy_wait(5); // set gate scan control
}

