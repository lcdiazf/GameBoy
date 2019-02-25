from migen import *
from litex.soc.interconnect.csr import *

class _LCD_i80(Module, AutoCSR):
    def __init__(self):

        self.data=data=Signal(16)
        self.addr=addr=Signal(8)
        self.busy=busy=Signal()
        self.start=start=Signal(2)
        self.number=number=Signal(20)
        self.option=option=Signal(3)

        self.db=Signal(8)
        self.rs=Signal()
        self.rd=Signal()
        self.wr=Signal()
        self.rst=Signal()

        count=Signal(24)
        manage=Signal(4)
        count2=Signal(4)
        count3=Signal(24)
        count4=Signal(24)
        count5=Signal(4)
        count6=Signal(4)
        count7=Signal(3)
        countwr=Signal(4)
        manage_ant=Signal(3)
        counter_regs=Signal(20)

        fsm=FSM(reset_state="START")
        self.submodules+=fsm

        fsm.act("START",
            NextValue(self.rs,1),
            NextValue(self.rd,1),
            NextValue(self.wr,1),
            NextValue(self.db,0x00),
            NextValue(busy,0),
            NextValue(count2,0x0),
            NextValue(count,0x0),
            NextValue(counter_regs,0),
            NextValue(self.rst,1),
            NextValue(manage,0x0),
            If(start==0b01,NextState("MANAGER")),
            If(start==0b11,NextState("RESET0"))
        )
        fsm.act("SENDZERO",
            NextValue(self.rs,0),
            NextValue(self.db,0X00),
            NextValue(busy,1),
            NextValue(manage,0x5),
            NextValue(manage_ant,0x5),
            NextValue(count2,0x0),
            NextState("MANAGER")
        )
        fsm.act("SETADDR",
            NextValue(self.rs,0),
            NextValue(self.db,addr),
            NextValue(busy,1),
            NextValue(manage,0x1),
            NextValue(manage_ant,0x1),
            NextValue(count2,0x0),
            NextState("MANAGER")
        )
        fsm.act("WRSTROBE",
            NextValue(busy,1),
            NextValue(self.wr,~self.wr),
            NextValue(manage,0x2),
            NextValue(countwr,0x0),
            NextValue(count2,0x0),
            If(self.wr==1,NextState("MANAGERWR")),
            If(self.wr==0,NextState("MANAGER"))
        )
        fsm.act("Hdata",
            NextValue(busy,1),
            NextValue(self.rs,1),
            NextValue(self.db,data >> 8),
            NextValue(manage,0x3),
            NextValue(manage_ant,0x3),
            NextValue(count2,0x0),
            NextState("MANAGER")
        )
        fsm.act("Ldata",  
            NextValue(busy,1),
            NextValue(self.rs,1),
            NextValue(self.db,data),
            NextValue(manage,0x4),
            NextValue(manage_ant,0x4),
            NextValue(count2,0x0),
            NextValue(counter_regs,counter_regs+1),
            NextState("MANAGER")
        )
        
        fsm.act("MANAGER",
            NextValue(count2,count2+1),
            If(count2<10,NextState("MANAGER")),
            If(count2>=10,
                If(manage==0x0,
                    If(option==0x5,NextState("Hdata")),
                    If(option==0x1,NextState("SETADDR")),
                    If(option==0x3,NextState("SETADDR")),
                    If((option==0x0),NextState("SENDZERO")),
                    If((option==0x2),NextState("SENDZERO")),
                ),
                If(manage==0x1,NextState("WRSTROBE")),              
                If(manage==0x2,
                    If(manage_ant==0x1,
                        If(option==0,NextState("Hdata")),
                        If(option==2,NextState("START")),
                        If(option==1,NextState("Ldata")),
                        If(option==3,NextState("START")),
                    ),
                    If(manage_ant==0x3,NextState("Ldata")),
#                        If(option==1,NextState("WAIT_START")),
#                        If(option==0,NextState("Ldata"))
#                    ),
                    If(manage_ant==0x4,
                        If(counter_regs<number,
                            If(option==0,NextState("Hdata")),
                            If(option==1,NextState("Ldata")),
                            If(option==5,NextState("Hdata")),
                        ),
                        If(counter_regs>=number,NextState("WAIT_START")),
                    ),
                    If(manage_ant==0x5,NextState("SETADDR")),
                ),
                If(manage==0x3,NextState("WRSTROBE")),
                If(manage==0x4,NextState("WRSTROBE")),
                If(manage==0x5,NextState("WRSTROBE")),
            ),
        )
        fsm.act("WAIT_START",
            NextValue(countwr,countwr+1),
            If(countwr<3,NextState("WAIT_START")),
            If(countwr>=3,
                NextState("START"),
            )
        )
        fsm.act("MANAGERWR",
            NextValue(countwr,countwr+1),
            If(countwr<10,NextState("MANAGERWR")),
            If(countwr>=10,
                NextState("WRSTROBE"),
            )
        )
        fsm.act("RESET0",
            NextValue(busy,1),
            NextValue(self.rst,1),
            NextValue(self.wr,1),
            NextValue(self.rd,1),
            NextValue(count,count+1),
            NextValue(count3,0x0),
            If(count<5,NextState("RESET0")),
            If(count>=5,
                NextState("RESET1")
            )
        )
        fsm.act("RESET1",
            NextValue(busy,1),
            NextValue(self.rst,0),
            NextValue(count3,count3+1),
            If(count3<200000,NextState("RESET1")),
            If(count3>=200000,
                NextValue(count4,0),
                NextState("RESET2")
            )
        )
        fsm.act("RESET2",
            NextValue(busy,1),
            NextValue(self.rst,1),
            NextValue(self.rs,0),
            NextValue(self.db,0x00),
            NextValue(count4,count4+1),
            If(count4<10,NextState("RESET2")),
            If(count4>=10,
                NextValue(count5,0),
                NextValue(count6,0),
                NextState("RESET3")
            )
        )
        fsm.act("RESET3",
            NextValue(busy,1),
            NextValue(self.rst,1),
            NextValue(count5,count5+1),
            If(count5<5,NextState("RESET3")),
            If(count5>=5,
                NextValue(self.wr,~self.wr),
                NextValue(count6,count6+1),
                If(count6<5,
                    NextState("RESET3")
                ),
                If(count6>=5,
                    NextValue(count,0),
                    NextValue(count6,0),
                    NextValue(count7,0),
                    NextState("RESETEND")
                ),
            )
        )
        fsm.act("RESETEND",
            NextValue(count7,count7+1),
            If(count7<2,NextState("RESETEND")),
            If(count7>=2,
                NextState("START")
            )
        )
class LCD_i80(Module, AutoCSR):
    def __init__(self):

        # # # Control Registers
        self.DATA=CSRStorage(16)
        self.NUMBER=CSRStorage(32)
        self.ADDR=CSRStorage(8)
        self.BUSY=CSRStatus()
        self.START=CSRStorage(2)
        self.OPTION=CSRStorage(3)
        self.CS_=CSRStorage()

        # # #

        self.db_=Signal(8)
        self.rs_=Signal()
        self.rd_=Signal()
        self.wr_=Signal()
        self.rst_=Signal()
        self.cs_=Signal()

        # # #

        _lcd=_LCD_i80()

        self.submodules += _lcd

        self.comb += [
            _lcd.data.eq(self.DATA.storage),
            _lcd.option.eq(self.OPTION.storage),
            _lcd.addr.eq(self.ADDR.storage),
            _lcd.number.eq(self.NUMBER.storage),
            self.BUSY.status.eq(_lcd.busy),
            _lcd.start.eq(self.START.storage),
            self.db_.eq(_lcd.db),
            self.cs_.eq(self.CS_.storage),
            self.rs_.eq(_lcd.rs),
            self.rd_.eq(_lcd.rd),
            self.wr_.eq(_lcd.wr),
            self.rst_.eq(_lcd.rst),
        ]

# First simulation

DBs=Signal(8)
RSs=Signal()
RDs=Signal()
WRs=Signal()
RSTs=Signal()
clk_s=Signal()

dut=LCD_i80()

def test_bench(dut):
    yield from dut.DATA.write(0x28ab)
    yield from dut.ADDR.write(0x3c)
    yield from dut.OPTION.write(0)
    yield from dut.NUMBER.write(3)
    yield from dut.BUSY.read()
    yield from dut.START.write(1)
    yield from dut.START.write(0)
    yield DBs
    yield RSs
    yield RDs
    yield WRs
    yield RSTs
    for i in range(2000):
        yield

#print ("init simulation 1")
#run_simulation(dut, test_bench(dut), vcd_name="lcd.vcd")
#print ("end simulation 1")

