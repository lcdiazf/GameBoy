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
"""
_io = [
   
    ("display_cs_n",  0, Pins("N6 M6 N5 N2 L1 M1 M3 N4"), IOStandard("LVCMOS33")),
    ("display_abcdefg",  0, Pins("L3 N1 L5 L4 K3 M2 L6 M4"), IOStandard("LVCMOS33")),

    ("clk100", 0, Pins("E3"), IOStandard("LVCMOS33")),

    ("cpu_reset", 0, Pins("C12"), IOStandard("LVCMOS33")),

    ("serial", 0,
        Subsignal("tx", Pins("D4")),
        Subsignal("rx", Pins("C4")),
        IOStandard("LVCMOS33"),
    ),
    ("cs",0, Pins("E6"),IOStandard("LVCMOS33")),
    ("rs",0, Pins("E7"),IOStandard("LVCMOS33")),
    ("rd",0, Pins("J3"),IOStandard("LVCMOS33")),
    ("wr",0, Pins("J2"),IOStandard("LVCMOS33")),
    ("rst",0, Pins("K2"),IOStandard("LVCMOS33")),
    ("db",0, Pins("F3 G3 H2 H4 G4 H1 G2 G1"),IOStandard("LVCMOS33")),
    ("clk_1",0, Pins("J4"),IOStandard("LVCMOS33")),

    ("l1",0, Pins("G14"),IOStandard("LVCMOS33")),
    ("l2",0, Pins("P15"),IOStandard("LVCMOS33")),
    ("l3",0, Pins("V11"),IOStandard("LVCMOS33"))
]"""

_io = [

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
            platform.request("rst").eq(self.lcd_test.rst_)
        ]
        

soc = BaseSoC(platform)

#
# build
#
builder = Builder(soc, output_dir="build", csr_csv="test/csr.csv")
builder.build()
