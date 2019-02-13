

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

class PSPI:
    def __init__(self, regs):
        self.regs = regs

    def configure(self):
        config = 0*OFFLINE
        config |= 0*CS_POLARITY | 0*CLK_POLARITY | 0*CLK_PHASE
        config |= 0*LSB_FIRST | 0*HALF_DUPLEX
        config |= 16*DIV_READ | 16*DIV_WRITE
        self.regs.probeSPI_config.write(config)

    def write(self, addr, byte):
        self.configure()
        val = (0x0a << 16) | ((addr & 0xff) << 8) | (byte & 0xff)
        self.regs.probeSPI_xfer.write(0b1 | 24*WRITE_LENGTH)
        self.regs.probeSPI_mosi_data.write(val << (32-24))
        self.regs.probeSPI_start.write(1)
        while (self.regs.probeSPI_pending.read() & 0x1):
            pass

    def read(self, addr):
        self.configure()
        val = (0b00001011 << 16) | ((addr & 0xff) << 8)
        self.regs.probeSPI_xfer.write(0b1 | 16*WRITE_LENGTH | 8*READ_LENGTH)
        self.regs.probeSPI_mosi_data.write(val << (32-24))
        self.regs.probeSPI_start.write(1)
        while (self.regs.probeSPI_pending.read() & 0x1):
            pass
        return self.regs.probeSPI_miso_data.read() & 0xff

pruebaSPI = PSPI(wb.regs)

while True:
    PSPI.write(50, 50)


