#!/usr/bin/env python3

import time
import os
import random

from litex.soc.tools.remote import RemoteClient

wb = RemoteClient()
wb.open()

# # #

# config mapping
OFFLINE      = (1 << 0)
CS_POLARITY  = (1 << 3)
CLK_POLARITY = (1 << 4)
CLK_PHASE    = (1 << 5)
LSB_FIRST    = (1 << 6)
HALF_DUPLEX  = (1 << 7)
DIV_READ     = (1 << 16)
DIV_WRITE    = (1 << 24)

# xfer mapping
WRITE_LENGTH = (1 << 16)
READ_LENGTH  = (1 << 24)

class ADXL362SPI:
    def __init__(self, regs):
        self.regs = regs

    def configure(self):
        config = 0*OFFLINE
        config |= 0*CS_POLARITY | 0*CLK_POLARITY | 0*CLK_PHASE
        config |= 0*LSB_FIRST | 0*HALF_DUPLEX
        config |= 16*DIV_READ | 16*DIV_WRITE
        self.regs.adxl362_config.write(config)

    def write(self, addr, byte):
        self.configure()
        val = (0b00001010 << 16) | ((addr & 0xff) << 8) | (byte & 0xff)
        self.regs.adxl362_xfer.write(0b1 | 24*WRITE_LENGTH)
        self.regs.adxl362_mosi_data.write(val << (32-24))
        self.regs.adxl362_start.write(1)
        while (self.regs.adxl362_pending.read() & 0x1):
            pass

    def read(self, addr):
        self.configure()
        val = (0b00001011 << 16) | ((addr & 0xff) << 8)
        self.regs.adxl362_xfer.write(0b1 | 16*WRITE_LENGTH | 8*READ_LENGTH)
        self.regs.adxl362_mosi_data.write(val << (32-24))
        self.regs.adxl362_start.write(1)
        while (self.regs.adxl362_pending.read() & 0x1):
            pass
        return self.regs.adxl362_miso_data.read() & 0xff

def display_write(sel, value):
    wb.regs.display_sel.write(sel)
    wb.regs.display_value.write(value)
    wb.regs.display_write.write(1)

def display_time(hour, minute, second):
    display_write(0, second)
    display_write(1, (second>>4))
    display_write(2, minute)
    display_write(3, (minute>>4))
    display_write(4, hour)
    display_write(5, (hour>>4))

# Configura el acelerómetros

adxl362 = ADXL362SPI(wb.regs)
print("reg status 0x{:02x}: 0x{:02x}".format(0x0B,adxl362.read(0x0B)))
print("reg control 0x{:02x}: 0x{:02x}".format(0x2D, adxl362.read(0x2D)))
print("reg contact 0x{:02x}: 0x{:02x}".format(0x27, adxl362.read(0x27)))
adxl362.write(0x20,0xFA)
adxl362.write(0x21,0x00)
adxl362.write(0x23,0x96)
adxl362.write(0x24,0x00)
adxl362.write(0x25,0x1E)
adxl362.write(0x27,0x3F)
adxl362.write(0x2B,0x40)
adxl362.write(0x2D,0x0A)
print("reg status 0x{:02x}: 0x{:02x}".format(0x0B, adxl362.read(0x0B)))
print("reg control 0x{:02x}: 0x{:02x}".format(0x2D, adxl362.read(0x2D)))
print("reg contact 0x{:02x}: 0x{:02x}".format(0x27, adxl362.read(0x27)))

#Activa el led RGB

wb.regs.rgbled_r_enable.write(1)
wb.regs.rgbled_g_enable.write(1)
wb.regs.rgbled_b_enable.write(1)



while True:
    X=adxl362.read(0x08)
    Y=adxl362.read(0x09)
    Z=adxl362.read(0x0A)

    display_time(X, Y, Z)

    brightness=0.01
    wb.regs.rgbled_r_width.write(int(X*1024*brightness/100))
    wb.regs.rgbled_g_width.write(int(Y*1024*brightness/100))
    wb.regs.rgbled_b_width.write(int(Z*1024*brightness/100))

    print("reg status 0x{:02x}: 0x{:02x}".format(0x0B, adxl362.read(0x0B)))
    print("reg Xaxis 0x{:02x}: 0x{:02x}".format(0x08, X))
    print("reg Yaxis 0x{:02x}: 0x{:02x}".format(0x09, Y))
    print("reg Zaxis 0x{:02x}: 0x{:02x}".format(0x0A, Z))
    time.sleep(0.1)
    os.system('clear')

#print("reg status".format(0x0b, adxl362.read(0x0b)))
#for i in range(64):
#	print("reg status 0x{:02x}: 0x{:02x}".format(i, adxl362.read(i)))

# # #

wb.close()
