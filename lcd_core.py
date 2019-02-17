from migen import *
from litex.soc.interconnect.csr import *

class _LCD_i80(Module, AutoCSR):
    def __init__(self):

        self.data=data=Signal(16)
        self.gdatar=gdatar=Signal(16)
        self.gdatag=gdatag=Signal(16)
        self.gdatab=gdatab=Signal(16)
        self.addr=addr=Signal(8)
        self.busy=busy=Signal()
        self.start=start=Signal(2)
        self.config=config=Signal()

        self.db=Signal(8)
        self.cs=Signal()
        self.rs=Signal()
        self.rd=Signal()
        self.wr=Signal()
        self.rst=Signal()

        count=Signal(24)
        #camvio
        manage=Signal(4)
        count2=Signal(4)
        count3=Signal(24)
        count4=Signal(24)
        countwr=Signal(2)

        fsm=FSM(reset_state="START")
        self.submodules+=fsm

        fsm.act("START",  
	        NextValue(self.cs,1),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,1),
            NextValue(self.db,0x00),
            busy.eq(0),
            NextValue(count2,0x0),
            NextValue(count,0x0),
            NextValue(self.rst,1),
#
            NextValue(manage,0x0),
#
            If(start==0b01,NextState("MANAGER")),
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
#
            NextValue(manage,0x1),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )
        fsm.act("INDEX",  
	        NextValue(self.cs,0),
            NextValue(self.rs,0),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,addr),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0x2),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )
        fsm.act("Hdata",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,data >> 8),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0x3),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )
        fsm.act("Ldata",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,data),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0x4),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )


        fsm.act("HdataR",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,gdatar >> 8),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0x5),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )
        fsm.act("LdataR",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,gdatar),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0x6),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )

        fsm.act("HdataG",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,gdatag >> 8),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0x7),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )
        fsm.act("LdataG",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,gdatag),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0x8),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )


        fsm.act("HdataB",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,gdatab >> 8),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0x9),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )
        fsm.act("LdataB",  
	        NextValue(self.cs,0),
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,~self.wr),
            NextValue(self.db,gdatab),
            busy.eq(1),
            NextValue(self.rst,1),
#
            NextValue(manage,0xA),
#
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )




        fsm.act("MANAGER",
            NextValue(count2,count2+1),
            If(count2<15,NextState("MANAGER")),
            If(count2>=15,
                If(manage==0x0,NextState("HEAD")),
                If(manage==0x1,NextState("INDEX")),
                If(manage==0x2,
                    If(config==0,NextState("Hdata")),
                    If(config==1,NextState("HdataR")),
                ),
                If(manage==0x3,NextState("Ldata")),
                If(manage==0x4,NextState("START")),
                If(manage==0x5,NextState("LdataR")),
                If(manage==0x6,NextState("HdataG")),
                If(manage==0x7,NextState("LdataG")),
                If(manage==0x8,NextState("HdataB")),
                If(manage==0x9,NextState("LdataB")),
                If(manage==0xA,NextState("START"))
            ),
        )

        fsm.act("MANAGERWR",
            NextValue(countwr,countwr+1),
            If(countwr<3,NextState("MANAGERWR")),
            If(countwr>=3,
                If(manage==0x1,NextState("HEAD")),
                If(manage==0x2,NextState("INDEX")),
                If(manage==0x3,NextState("Hdata")),
                If(manage==0x4,NextState("Ldata")),
                If(manage==0x5,NextState("HdataR")),
                If(manage==0x6,NextState("LdataR")),
                If(manage==0x7,NextState("HdataG")),
                If(manage==0x8,NextState("LdataG")),
                If(manage==0x9,NextState("HdataB")),
                If(manage==0xA,NextState("LdataB")),
            ),
        )
#        fsm.act("MANAGER",
#            NextValue(count2,count2+1),
#            If(count2<15,NextState("MANAGER")),
#            If(count2>=15,
#                If(manage==0,NextState("HEAD")),
#                If(manage==1,
#                    If(self.wr==1,NextState("HEAD")),
#                    If(self.wr==0,NextState("INDEX")),
                    
#                ),
#                If(manage==2,
#                    If(self.wr==1,NextState("INDEX")),
#                    If(self.wr==0,NextState("Hdata")),
                    
#                ),
#                If(manage==3,
#                    If(self.wr==1,NextState("Hdata")),
#                    If(self.wr==0,NextState("Ldata")),
                    
#                ),
#                If(manage==4,
#                    If(self.wr==1,NextState("Ldata")),
#                    If(self.wr==0,NextState("START")),
                    
#                ),
#            ),
#        )

##
        fsm.act("RESET0",
            busy.eq(1),
            NextValue(self.rst,1),
            NextValue(count,count+1),
            NextValue(count3,0x0),
            If(count<1000,NextState("RESET0")),
            If(count>=1000,
                NextState("RESET1")
            )
        )
        fsm.act("RESET1",
            busy.eq(1),
            NextValue(self.rst,0),
            NextValue(count3,count3+1),
            If(count3<10000,NextState("RESET1")),
            If(count3>=10000,
                NextValue(count4,0),
                NextState("RESET2")
            )
        )
        fsm.act("RESET2",
            busy.eq(1),
            NextValue(self.rst,1),
            NextValue(count4,count4+1),
            If(count4<50000,NextState("RESET2")),
            If(count4>=50000,
                NextValue(count,0),
                NextState("START")
            )
        )

class LCD_i80(Module, AutoCSR):
    def __init__(self):

        # # # Control Registers
        self.DATA=CSRStorage(16)
        self.GDATAR=CSRStorage(16)
        self.GDATAG=CSRStorage(16)
        self.GDATAB=CSRStorage(16)
        self.ADDR=CSRStorage(8)
        self.busy=CSRStatus()
        self.start=CSRStorage(2)
        self.Config=CSRStorage()

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
            _lcd.gdatar.eq(self.GDATAR.storage),
            _lcd.gdatag.eq(self.GDATAG.storage),
            _lcd.gdatab.eq(self.GDATAB.storage),
            _lcd.addr.eq(self.ADDR.storage),
            self.busy.status.eq(_lcd.busy),
            _lcd.start.eq(self.start.storage),
            _lcd.config.eq(self.Config.storage),
            self.db_.eq(_lcd.db),
            self.cs_.eq(_lcd.cs),
            self.rs_.eq(_lcd.rs),
            self.rd_.eq(_lcd.rd),
            self.wr_.eq(_lcd.wr),
            self.rst_.eq(_lcd.rst),
        ]

# First simulation

DBs=Signal(8)
CSs=Signal()
RSs=Signal()
RDs=Signal()
WRs=Signal()
RSTs=Signal()
clk_s=Signal()

dut=LCD_i80()

def test_bench(dut):
    yield from dut.DATA.write(0x55FF)
    yield from dut.GDATAR.write(0x1234)
    yield from dut.GDATAG.write(0x5678)
    yield from dut.GDATAB.write(0x9ABC)
    yield from dut.ADDR.write(0x2f)
    yield from dut.busy.read()
    yield from dut.start.write(1)
    yield from dut.Config.write(0)
    yield DBs
    yield CSs
    yield RSs
    yield RDs
    yield WRs
    yield RSTs
    for i in range(10000):
        yield

print ("init simulation 1")
run_simulation(dut, test_bench(dut), vcd_name="lcd.vcd")
print ("end simulation 1")
"""
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
