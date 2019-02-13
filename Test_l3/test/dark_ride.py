import time
import random

import sys
sys.path.insert(0,'/opt')

from litex.soc.tools.remote import RemoteClient

wb = RemoteClient()
wb.open()
print (wb.regs.leds_out.write)

while True:

   #wb.regs.leds_out.write(wb.regs.switches_in.read())

    for i in range(15):
        wb.regs.leds_out.write(2**i)
        time.sleep(0.01)
    for i in reversed(range(1,17)):
        wb.regs.leds_out.write(2**i)
        time.sleep(0.01)
