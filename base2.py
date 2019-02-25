import sys
sys.path.insert(0,'/opt')

from migen import *

from migen.genlib.io import CRG

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform

from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores import dna, xadc
from litex.soc.cores.spi import SPIMaster


from ios import Led, RGBLed, Button, Switch
from display import Display
from lcd_core import *

#
# platform
#

_io = [   
    ("display_cs_n",  0, Pins("J17 J18 J14 P14 K2 U13 T9 T14"), IOStandard("LVCMOS33")),
    ("display_abcdefg",  0, Pins("T10 R10 K16 K13 P15 T11 L18 H15"), IOStandard("LVCMOS33")),

    ("clk100", 0, Pins("E3"), IOStandard("LVCMOS33")),

    ("cpu_reset", 0, Pins("C12"), IOStandard("LVCMOS33")),

    ("serial", 0,
        Subsignal("tx", Pins("D4")),
        Subsignal("rx", Pins("C4")),
        IOStandard("LVCMOS33")),

    ("cs",0, Pins("H1"),IOStandard("LVCMOS33")),
    ("rs",0, Pins("G4"),IOStandard("LVCMOS33")),
    ("rd",0, Pins("H2"),IOStandard("LVCMOS33")),
    ("wr",0, Pins("H4"),IOStandard("LVCMOS33")),
    ("rst",0, Pins("G2"),IOStandard("LVCMOS33")),
    ("db",0, Pins("K1 E7 G6 E6 J2 J4 F6 J3"),IOStandard("LVCMOS33")),

    ("csa",0, Pins("F16"),IOStandard("LVCMOS33")),
    ("rsa",0, Pins("F13"),IOStandard("LVCMOS33")),
    ("rda",0, Pins("E16"),IOStandard("LVCMOS33")),
    ("wra",0, Pins("D14"),IOStandard("LVCMOS33")),
    ("rsta",0, Pins("G13"),IOStandard("LVCMOS33")),
    ("dba",0, Pins("C17 D17 G17 G18 E18 F18 D18 E17"),IOStandard("LVCMOS33")),
    ("busy",0, Pins("F3"),IOStandard("LVCMOS33"))

]

"""
    ("db",0, Pins("E6 E7 J2 J3 G6 J4 K1 K2"),IOStandard("LVCMOS33"))
    ("db",0, Pins("J3 F6 J4 J2 E6 G6 E7 K1"),IOStandard("LVCMOS33"))


PMOD JC
analizador          nexys4      DDR
                    DB:
0 ->                1   K2      K1
1                   7   K1      E7
2                   4   J4      G6
3                   10  G6      E6
4                   3   J3      J2
5                   9   J2      J4
6                   2   E7      F6
7                   8   E6      J3


PMOD JD
8                   3   G1      G1  N.C 
9                   9   G2      G2  rst 
10                  2   H1      H1  cs  
11                  8   G4      G4  rs  
12                  1   H4      H4  wr  
13                  7   H2      H2  rd  
14                  N.C

PMOD JA
PANTALLA          nexys4      DDR
                    DB:
0 ->                1   C17      K1
1                   7   D17      E7
2                   4   G17      G6
3                   10  G18      E6
4                   3   E18      J2
5                   9   F18      J4
6                   2   D18      F6
7                   8   E17      J3


PMOD JB
8                   3   G16      G1  N.C 
9                   9   G13      G2  rst 
10                  2   F16      H1  cs  
11                  8   F13      G4  rs  
12                  1   D14      H4  wr  
13                  7   E16      H2  rd  
14                  N.C




    ),
    ("cs",0, Pins("E7"),IOStandard("LVCMOS33")),
    ("rs",0, Pins("E6"),IOStandard("LVCMOS33")),
    ("rd",0, Pins("K1"),IOStandard("LVCMOS33")),
    ("wr",0, Pins("K2"),IOStandard("LVCMOS33")),
    ("rst",0, Pins("J2"),IOStandard("LVCMOS33")),
    ("db",0, Pins("H4 H2 G3 F3 G1 G2 H1 G4"),IOStandard("LVCMOS33")),



_io = [

    ("display_cs_n",  0, Pins("N6 M6 N5 N2 L1 M1 M3 N4"), IOStandard("LVCMOS33")),
    ("display_abcdefg",  0, Pins("L3 N1 L5 L4 K3 M2 L6 M4"), IOStandard("LVCMOS33")),

    ("display_cs_n",  0, Pins("J17 J18 J14 P14 K2 U13 T9 T14"), IOStandard("LVCMOS33")),
    ("display_abcdefg",  0, Pins("T10 R10 K16 K13 P15 T11 L18 H15"), IOStandard("LVCMOS33")),

    ("clk100", 0, Pins("E3"), IOStandard("LVCMOS33")),

    ("cpu_reset", 0, Pins("C12"), IOStandard("LVCMOS33")),

    ("serial", 0,
        Subsignal("tx", Pins("D4")),
        Subsignal("rx", Pins("C4")),
        IOStandard("LVCMOS33"),
    ),
    ("cs",0, Pins("F6"),IOStandard("LVCMOS33")),
    ("rs",0, Pins("J3"),IOStandard("LVCMOS33")),
    ("rd",0, Pins("E7"),IOStandard("LVCMOS33")),
    ("wr",0, Pins("K1"),IOStandard("LVCMOS33")),
    ("rst",0, Pins("J4"),IOStandard("LVCMOS33")),
    ("db",0, Pins("H4 H2 G3 F3 G1 G2 H1 G4"),IOStandard("LVCMOS33"))
]
"""



class Platform(XilinxPlatform):
    default_clk_name = "clk100"
    default_clk_period = 10.0

    def __init__(self):
        XilinxPlatform.__init__(self, "xc7a100t-CSG324-1", _io, toolchain="ise")

    def do_finalize(self, fragment):
        XilinxPlatform.do_finalize(self, fragment)


def csr_map_update(csr_map, csr_peripherals):
    csr_map.update(dict((n, v)
        for v, n in enumerate(csr_peripherals, start=max(csr_map.values()) + 1)))

# create our platform (fpga interface)
platform = Platform()

# create our soc (fpga description)
class BaseSoC(SoCCore):
    # Peripherals CSR declaration
    csr_peripherals = [
        "dna",
        "xadc",
        "display",
        "lcd_test"
    ]
    csr_map_update(SoCCore.csr_map, csr_peripherals)

    def __init__(self, platform):
        sys_clk_freq = int(100e6)
        
        SoCCore.__init__(self, platform,
            cpu_type="lm32",
            clk_freq=100e6,
            ident="CPU Test SoC", ident_version=True,
            integrated_rom_size=0x8000,
            integrated_main_ram_size=16*1024,
        )

        # Clock Reset Generation
        self.submodules.crg = CRG(platform.request("clk100"), ~platform.request("cpu_reset"))


        # FPGA identification
        self.submodules.dna = dna.DNA()

        # FPGA Temperature/Voltage
        self.submodules.xadc = xadc.XADC()

        # Display
        self.submodules.display = Display(sys_clk_freq)
        self.comb += [
            platform.request("display_cs_n").eq(~self.display.cs),
            platform.request("display_abcdefg").eq(~self.display.abcdefg)
        ]
        # LCD parallel
        self.submodules.lcd_test = LCD_i80()
        self.comb += [
            platform.request("db").eq(self.lcd_test.db_),
            platform.request("cs").eq(self.lcd_test.cs_),
            platform.request("rs").eq(self.lcd_test.rs_),
            platform.request("rd").eq(self.lcd_test.rd_),
            platform.request("wr").eq(self.lcd_test.wr_),
            platform.request("rst").eq(self.lcd_test.rst_),
            platform.request("dba").eq(self.lcd_test.db_),
            platform.request("csa").eq(self.lcd_test.cs_),
            platform.request("rsa").eq(self.lcd_test.rs_),
            platform.request("rda").eq(self.lcd_test.rd_),
            platform.request("wra").eq(self.lcd_test.wr_),
            platform.request("rsta").eq(self.lcd_test.rst_),
            platform.request("busy").eq(self.lcd_test.BUSY.status)
        ]

        

soc = BaseSoC(platform)

#
# build
#
builder = Builder(soc, output_dir="build", csr_csv="test/csr.csv")
builder.build()
