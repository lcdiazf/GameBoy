#!/usr/bin/env python3

import time
import random

import sys
sys.path.insert(0,'/opt')

from litex.soc.tools.remote import RemoteClient

wb = RemoteClient()
wb.open()

wb.regs.probe_PWM_period.write(2048)
wb.regs.probe_PWM_enable.write(1)

n = int(input('Enter your percentage of PWM:'))



wb.regs.probe_PWM_width.write(int(n * 2048 / 100))
