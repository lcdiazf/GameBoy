import time
import datetime
import random

import sys
sys.path.insert(0,'/opt')

from litex.soc.tools.remote import RemoteClient

wb = RemoteClient()
wb.open()

hours=0
minutes=0
seconds=0


def display_write(sel, value):
    wb.regs.display_sel.write(sel)
    wb.regs.display_value.write(value)
    wb.regs.display_write.write(1)

def display_time(hour, minute, second):
    display_write(0, second%10)
    display_write(1, (second//10)%10)
    display_write(2, minute%10)
    display_write(3, (minute//10)%10)
    display_write(4, hour%10)
    display_write(5, (hour//10)%10)

while True:    
    #print(datetime.time(hours,minutes,seconds).isoformat())
    display_time(hours,minutes,seconds)
    if wb.regs.buttons_in.read()==1:
        hours=0
        minutes=0
        seconds=0
    if seconds==59:
        seconds=0
        minutes+=1
    else:
        seconds+=1
    if minutes==59:
        minutes=0
        hours+=1
    if hours==23:
        hours=0
    if wb.regs.buttons_in.read()==4:
        hours+=1
    if wb.regs.buttons_in.read()==8:
        minutes+=1
    time.sleep(0.1)
