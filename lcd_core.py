from migen import *
from litex.soc.interconnect.csr import *

class _LCD_i80(Module, AutoCSR):
    def __init__(self):

        self.data=data=Signal(16)
        self.addr=addr=Signal(8)
        self.busy=busy=Signal()
        self.start=start=Signal(2)

        self.db=Signal(8)
        self.cs=Signal()
        self.rs=Signal()
        self.rd=Signal()
        self.wr=Signal()
        self.rst=Signal()

        count=Signal(24)

        fsm=FSM(reset_state="START")
        self.submodules+=fsm

        fsm.act("START",  
	        NextValue(self.cs,1),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,1),
            NextValue(self.db,0x00),
            busy.eq(0),
            NextValue(count,0x0),
            NextValue(self.rst,1),
            If(start==0b01,NextState("HEAD")),
            If(start==0b11,NextState("RESET0"))
        )
        fsm.act("HEAD",  
	        NextValue(self.cs,0),
            NextValue(self.rs,0),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,0x00),
            self.busy.eq(1),
            NextValue(self.rst,1),
            If(self.wr==1,NextState("HEAD")),
            If(self.wr==0,NextState("INDEX"))
        )
        fsm.act("INDEX",  
	        NextValue(self.cs,0),
            NextValue(self.rs,0),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,addr),
            busy.eq(1),
            NextValue(self.rst,1),
            If(self.wr==1,NextState("INDEX")),
            If(self.wr==0,NextState("Hdata"))
        )
        fsm.act("Hdata",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,data >> 8),
            busy.eq(1),
            NextValue(self.rst,1),
            If(self.wr==1,NextState("Hdata")),
            If(self.wr==0,NextState("Ldata"))
        )
        fsm.act("Ldata",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,data),
            busy.eq(1),
            NextValue(self.rst,1),
            If(self.wr==1,NextState("Ldata")),
            If(self.wr==0,NextState("START"))
        )
        fsm.act("RESET0",
            busy.eq(1),
            NextValue(self.rst,1),
            NextValue(count,count+1),
            If(count<100000,NextState("RESET0")),
            If(self.wr==100000,
                NextValue(count,0),
                NextState("RESET1")
            )
        )
        fsm.act("RESET1",
            busy.eq(1),
            NextValue(self.rst,0),
            NextValue(count,count+1),
            If(count<1000000,NextState("RESET1")),
            If(self.wr==1000000,
                NextValue(count,0),
                NextState("RESET2")
            )
        )
        fsm.act("RESET2",
            busy.eq(1),
            NextValue(self.rst,1),
            NextValue(count,count+1),
            If(count<5000000,NextState("RESET2")),
            If(self.wr==5000000,
                NextValue(count,0),
                NextState("START")
            )
        )

class LCD_i80(Module, AutoCSR):
    def __init__(self):

        # # # Control Registers
        self.DATA=CSRStorage(16)
        self.ADDR=CSRStorage(8)
        self.busy=CSRStatus()
        self.start=CSRStorage(2)

        # # #

        self.db_=Signal(8)
        self.cs_=Signal()
        self.rs_=Signal()
        self.rd_=Signal()
        self.wr_=Signal()
        self.rst_=Signal()

        # # #

        _lcd=_LCD_i80()

        self.submodules += _lcd

        self.comb += [
            _lcd.data.eq(self.DATA.storage),
            _lcd.addr.eq(self.ADDR.storage),
            self.busy.status.eq(_lcd.busy),
            _lcd.start.eq(self.start.storage),
            self.db_.eq(_lcd.db),
            self.cs_.eq(_lcd.cs),
            self.rs_.eq(_lcd.rs),
            self.rd_.eq(_lcd.rd),
            self.wr_.eq(_lcd.wr),
            self.rst_.eq(_lcd.rst),
        ]

# First simulation
"""
DBs=Signal(8)
CSs=Signal()
RSs=Signal()
RDs=Signal()
WRs=Signal()
RSTs=Signal()
clk_s=Signal()

dut=LCD_i80(DBs, CSs, RSs, RDs, WRs, RSTs, clk_s)

def test_bench(dut):
    yield from dut.DATA.write(0x55FF)
    yield from dut.ADDR.write(0x2f)
    yield from dut.busy.read()
    yield from dut.start.write(1)
    yield DBs
    yield CSs
    yield RSs
    yield RDs
    yield WRs
    for i in range(1000):
        yield

print ("init simulation 1")
run_simulation(dut, test_bench(dut), vcd_name="lcd.vcd")
print ("end simulation 1")

#Second simulation

DB2=Signal(8)
CS2=Signal()
RS2=Signal()
RD2=Signal()
WR2=Signal()
RST2=Signal()
clk=Signal()
lcdIns=_LCD_i80(DB2, CS2, RS2, RD2, WR2, RST2, clk)


def test_bench2(lcdIns):
    yield lcdIns.data.eq(0x55EA)
    yield lcdIns.addr.eq(0xff)
    yield lcdIns.start.eq(0)
    yield
    yield lcdIns.start.eq(0b11)
    for i in range(2):
        yield
    yield lcdIns.start.eq(0)
    for i in range(10):
        yield
print ("init simulation 2")
run_simulation(lcdIns, test_bench2(lcdIns), vcd_name="lcd1.vcd")
print ("end simulation 2")
"""
