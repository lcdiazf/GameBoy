#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>
static void spi_writter(int value)
{
        I2C_mosi_data_write(value);
        I2C_start_write(1);
        while(SD_pending_read() &&  0x1);
}

static void InitConfig(void){
	printf("Confifurando I2C...\n");        
        I2C_config_write(0x10100000);
        I2C_xfer_write(0x080001);
        printf("Listo...\n");    
}

static void Write_I2C(int data){
	InitConfig();
	spi_writter(0xC2);
	spi_writter(0x10+data>>32);
	spi_writter(data);
}
