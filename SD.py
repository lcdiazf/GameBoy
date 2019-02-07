from migen import *
from litex.soc.interconnect.csr import *
from litex.soc.cores.spi import SPIMasterCore
from litex.soc.cores import *

class SD(Module, AutoCSR):
    def __init__(self, pads, button, interface):

        self.submodules.core = core = SPIMasterCore(pads)

        # # #

        if interface == "csr":
            self.config = CSRStorage(32)
            self.xfer = CSRStorage(32)
            self.start = CSR()
            self.active = CSRStatus()
            self.pending = CSRStatus()
            self.mosi_data = CSRStorage(32)
            self.miso_data = CSRStatus(32)

            self.comb += [
                core.config.raw_bits().eq(self.config.storage),
                core.xfer.raw_bits().eq(self.xfer.storage),
                core.start.eq(self.start.re & self.start.r),
                self.active.status.eq(core.active),
                self.pending.status.eq(core.pending),
                core.mosi_data.eq(self.mosi_data.storage),
                self.miso_data.status.eq(core.miso_data)
            ]
        else:
            raise NotImplementedError
        self._out = CSRStorage()
        self.comb += button.eq(self._out.storage)
