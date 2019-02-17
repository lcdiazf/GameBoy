#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>

static void lcd_write_reg(unsigned char address, unsigned char data)
{
    lcd_test_ADDR_write(address);
    lcd_test_DATA_write(data);
    lcd_test_Config_write(0);
    lcd_test_start_write(1);
    lcd_test_start_write(0);
    while(lcd_test_busy_read()){}
}

static void lcd_initialize(void)
{
    lcd_write_reg(0x01, 0x0100); // driver output control
    lcd_write_reg(0x02, 0x0200); // set inverion
    lcd_write_reg(0x03, 0x1030); // set entry mode
    lcd_write_reg(0x08, 0x0202); // set back & front porch
    lcd_write_reg(0x09, 0x0000); // set scan interval
    lcd_write_reg(0x0a, 0x0000); // set display control1
    lcd_write_reg(0x0c, 0x0000); // set RGB I/F display control
    lcd_write_reg(0x0d, 0x0000); // set frame mark position
    lcd_write_reg(0x60, 0x2700); // set gate scan control
    lcd_write_reg(0x61, 0x0001); // Normally White
    lcd_write_reg(0x6a, 0x0000); // set gate scan control    
}



static void lcd_write_gram(unsigned char dataR, unsigned char dataG, unsigned char dataB)
{
    lcd_test_ADDR_write(0X22);
    lcd_test_GDATAR_write(dataR);
    lcd_test_GDATAG_write(dataG);
    lcd_test_GDATAB_write(dataB);
    lcd_test_Config_write(1);
    lcd_test_start_write(1);
    lcd_test_start_write(0);
    while(lcd_test_busy_read()){}
}
