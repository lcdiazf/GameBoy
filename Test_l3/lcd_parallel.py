from migen import *

from litex.soc.interconnect.csr import *
from litex.soc.cores import gpio

from pwm import PWM

class LCD(Module, AutoCSR):
    def __init__(self, D0_D8, CS, RS, RD, WR):
        self.D0_D8 = gpio.GPIOOut(Signal(8))
        self.CS = gpio.GPIOOut(Signal())
        self.RS = gpio.GPIOOut(Signal())
        self.RD = gpio.GPIOOut(Signal())
        self.WR = gpio.GPIOOut(Signal())

    

#class D1_D8(gpio.GPIOOut)
#    pass

#class LCD_Signals(gpio.GPIOOut)
#    pass
