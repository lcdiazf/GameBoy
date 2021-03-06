
import sys
sys.path.insert(0,'/opt')

from migen import *

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform

from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores.uart import UARTWishboneBridge
from litex.soc.cores import dna, xadc
from litex.soc.cores.spi import SPIMaster

from ios import Led, RGBLed, Button, Switch
from lcd_parallel import *
from display import Display
from pwm import *

#
# platform
#

_io = [
    ("out_probe", 0, Pins("B13"), IOStandard("LVCMOS33")),
    ("user_led",  0, Pins("T8"), IOStandard("LVCMOS33")),
    ("user_led",  1, Pins("V9"), IOStandard("LVCMOS33")),
    ("user_led",  2, Pins("R8"), IOStandard("LVCMOS33")),
    ("user_led",  3, Pins("T6"), IOStandard("LVCMOS33")),
    ("user_led",  4, Pins("T5"), IOStandard("LVCMOS33")),
    ("user_led",  5, Pins("T4"), IOStandard("LVCMOS33")),
    ("user_led",  6, Pins("U7"), IOStandard("LVCMOS33")),
    ("user_led",  7, Pins("U6"), IOStandard("LVCMOS33")),
    ("user_led",  8, Pins("V4"), IOStandard("LVCMOS33")),
    ("user_led",  9, Pins("U3"), IOStandard("LVCMOS33")),
    ("user_led", 10, Pins("V1"), IOStandard("LVCMOS33")),
    ("user_led", 11, Pins("R1"), IOStandard("LVCMOS33")),
    ("user_led", 12, Pins("P5"), IOStandard("LVCMOS33")),
    ("user_led", 13, Pins("U1"), IOStandard("LVCMOS33")),
    ("user_led", 14, Pins("R2"), IOStandard("LVCMOS33")),
    ("user_led", 15, Pins("P2"), IOStandard("LVCMOS33")),

    ("user_sw",  0, Pins("U9"), IOStandard("LVCMOS33")),
    ("user_sw",  1, Pins("U8"), IOStandard("LVCMOS33")),
    ("user_sw",  2, Pins("R7"), IOStandard("LVCMOS33")),
    ("user_sw",  3, Pins("R6"), IOStandard("LVCMOS33")),
    ("user_sw",  4, Pins("R5"), IOStandard("LVCMOS33")),
    ("user_sw",  5, Pins("V7"), IOStandard("LVCMOS33")),
    ("user_sw",  6, Pins("V6"), IOStandard("LVCMOS33")),
    ("user_sw",  7, Pins("V5"), IOStandard("LVCMOS33")),
    ("user_sw",  8, Pins("U4"), IOStandard("LVCMOS33")),
    ("user_sw",  9, Pins("V2"), IOStandard("LVCMOS33")),
    ("user_sw", 10, Pins("U2"), IOStandard("LVCMOS33")),
    ("user_sw", 11, Pins("T3"), IOStandard("LVCMOS33")),
    ("user_sw", 12, Pins("T1"), IOStandard("LVCMOS33")),
    ("user_sw", 13, Pins("R3"), IOStandard("LVCMOS33")),
    ("user_sw", 14, Pins("P3"), IOStandard("LVCMOS33")),
    ("user_sw", 15, Pins("P4"), IOStandard("LVCMOS33")),

    ("user_btn", 0, Pins("E16"), IOStandard("LVCMOS33")),
    ("user_btn", 1, Pins("V10"), IOStandard("LVCMOS33")),
    ("user_btn", 2, Pins("T16"), IOStandard("LVCMOS33")),
    ("user_btn", 3, Pins("R10"), IOStandard("LVCMOS33")),
    ("user_btn", 4, Pins("F15"), IOStandard("LVCMOS33")),

    ("user_rgb_led", 0,
        Subsignal("r", Pins("K6")),
        Subsignal("g", Pins("H6")),
        Subsignal("b", Pins("L16")),
        IOStandard("LVCMOS33"),
    ),

    ("display_cs_n",  0, Pins("N6 M6 N5 N2 L1 M1 M3 N4"), IOStandard("LVCMOS33")),
    ("display_abcdefg",  0, Pins("L3 N1 L5 L4 K3 M2 L6 M4"), IOStandard("LVCMOS33")),

    ("clk100", 0, Pins("E3"), IOStandard("LVCMOS33")),

    ("cpu_reset", 0, Pins("C12"), IOStandard("LVCMOS33")),

    ("serial", 0,
        Subsignal("tx", Pins("D4")),
        Subsignal("rx", Pins("C4")),
        IOStandard("LVCMOS33"),
    ),

    ("adxl362_spi", 0,
    	Subsignal("cs_n", Pins("C15")),
        Subsignal("clk", Pins("D15")),
        Subsignal("mosi", Pins("B14")),
        Subsignal("miso", Pins("D13")),
        IOStandard("LVCMOS33")
    ),
    ("SPIprueba", 0,
        Subsignal("cs_n", Pins("K2")),
        Subsignal("clk", Pins("E7")),
        Subsignal("mosi", Pins("J3")),
        Subsignal("miso", Pins("J4")),
        IOStandard("LVCMOS33")
    ),

    ("LCD_CS", 0, Pins("G14"), IOStandard("LVCMOS33")),
    ("LCD_RS", 0, Pins("P15"), IOStandard("LVCMOS33")),
    ("LCD_RD", 0, Pins("V11"), IOStandard("LVCMOS33")),
    ("LCD_WR", 0, Pins("V15"), IOStandard("LVCMOS33")),

    ("LCD_Parallel", 0, Pins("B13 F14 D17 E17 G13 C17 D18 E18"), IOStandard("LVCMOS33")),

#    ("LCD_Parallel", 0, Pins("B13"), IOStandard("LVCMOS33")),
#    ("LCD_Parallel", 1, Pins("F14"), IOStandard("LVCMOS33")),
#    ("LCD_Parallel", 2, Pins("D17"), IOStandard("LVCMOS33")),
#    ("LCD_Parallel", 3, Pins("E17"), IOStandard("LVCMOS33")),
#    ("LCD_Parallel", 4, Pins("G13"), IOStandard("LVCMOS33")),
#    ("LCD_Parallel", 5, Pins("C17"), IOStandard("LVCMOS33")),
#    ("LCD_Parallel", 6, Pins("D18"), IOStandard("LVCMOS33")),
#    ("LCD_Parallel", 7, Pins("E18"), IOStandard("LVCMOS33")),

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
        "rgbled",
        "leds",
        "switches",
        "buttons",
        "adxl362",
        "display",
        "probe_PWM",
        "probeSPI",
        "lcd_test"
    ]
    csr_map_update(SoCCore.csr_map, csr_peripherals)

    def __init__(self, platform, **kwargs):
        sys_clk_freq = int(100e6)
        
        SoCCore.__init__(self, platform, sys_clk_freq,
            cpu_type=None,
            csr_data_width=32,
            with_uart=False,
            with_timer=False,
            ident="My first System On Chip", ident_version=True,
        )

        # Clock Reset Generation
        self.submodules.crg = CRG(platform.request("clk100"), ~platform.request("cpu_reset"))

        # No CPU, use Serial to control Wishbone bus
        self.add_cpu_or_bridge(UARTWishboneBridge(platform.request("serial"), sys_clk_freq, baudrate=115200))
        self.add_wb_master(self.cpu_or_bridge.wishbone)

        # FPGA identification
        self.submodules.dna = dna.DNA()

        # FPGA Temperature/Voltage
        self.submodules.xadc = xadc.XADC()

        # Led
        user_leds = Cat(*[platform.request("user_led", i) for i in range(16)])
        self.submodules.leds = Led(user_leds)

        #LCD D0~D7 byte

#        LCD_parallel = Cat(*[platform.request("LCD_parallel", i) for i in range(16)])
        self.submodules.lcd_test = LCD(platform.request("LCD_Parallel",  0), platform.request("LCD_CS",  0), platform.request("LCD_RS",  0), platform.request("LCD_RD",  0), platform.request("LCD_WR",  0))

        # Switches
        user_switches = Cat(*[platform.request("user_sw", i) for i in range(16)])
        self.submodules.switches = Switch(user_switches)

        # Buttons
        user_buttons = Cat(*[platform.request("user_btn", i) for i in range(5)])
        self.submodules.buttons = Button(user_buttons)

        # RGB Led
        self.submodules.rgbled  = RGBLed(platform.request("user_rgb_led",  0))
        
        # Accelerometer
        self.submodules.adxl362 = SPIMaster(platform.request("adxl362_spi"))

        # Display
        self.submodules.display = Display(sys_clk_freq)
        self.comb += [
            platform.request("display_cs_n").eq(~self.display.cs),
            platform.request("display_abcdefg").eq(~self.display.abcdefg)
        ]
        # Probe PWM
        self.submodules.probe_PWM = PWM(platform.request("out_probe",  0))

        # Probe SPI
        self.submodules.probeSPI = SPIMaster(platform.request("SPIprueba"))
        


soc = BaseSoC(platform)

#
# build
#
builder = Builder(soc, output_dir="build", csr_csv="test/csr.csv")
builder.build()
