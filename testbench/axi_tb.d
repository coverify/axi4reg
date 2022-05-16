module axi_tb;

import esdl;
import esdl.intf.verilator.trace;
import uvm;

class AxiIntf(int DW, int AW): VlInterface
{
  Port!(Signal!(ubvec!1)) clk;
  Port!(Signal!(ubvec!1)) rst;
  
  VlPort!AW      araddr;
  VlPort!8	 arid;
  VlPort!8	 arlen;
  VlPort!3	 arsize;
  VlPort!1	 arvalid;
  VlPort!1	 arready;

  VlPort!AW      awaddr;
  VlPort!8	 awid;
  VlPort!8	 awlen;
  VlPort!3	 awsize;
  VlPort!1	 awvalid;
  VlPort!1	 awready;

  VlPort!1	 bready;
  VlPort!8	 bid;
  VlPort!2	 bresp;
  VlPort!1	 bvalid;

  VlPort!1	 rready;
  VlPort!DW      rdata;
  VlPort!8	 rid;
  VlPort!1       rlast;
  VlPort!2	 rresp;
  VlPort!1	 rvalid;

  VlPort!DW      wdata;
  // VlPort!8	 wid;
  VlPort!1	 wlast;
  VlPort!4	 wstrb;
  VlPort!1	 wvalid;
  VlPort!1       wready;

}

class Top: Entity
{
  import Vaxi_regs_euvm;
  import esdl.intf.verilator.verilated;

  VerilatedVcdD _trace;

  Signal!(ubvec!1) rst;
  Signal!(ubvec!1) clk;

  DVaxi_regs dut;

  AxiIntf!(32, 32) axiIntf;
  
  void opentrace(string vcdname) {
    if (_trace is null) {
      _trace = new VerilatedVcdD();
      dut.trace(_trace, 99);
      _trace.open(vcdname);
    }
  }

  void closetrace() {
    if (_trace !is null) {
      _trace.close();
      _trace = null;
    }
  }

  override void doConnect() {
    import std.stdio;

    axiIntf.clk(clk);
    axiIntf.rst(rst);

    axiIntf.araddr(dut.s_axi_araddr);
    axiIntf.arid(dut.s_axi_arid);
    axiIntf.arlen(dut.s_axi_arlen);
    axiIntf.arsize(dut.s_axi_arsize);
    axiIntf.arvalid(dut.s_axi_arvalid);
    axiIntf.arready(dut.s_axi_arready);

    axiIntf.awaddr(dut.s_axi_awaddr);
    axiIntf.awid(dut.s_axi_awid);
    axiIntf.awlen(dut.s_axi_awlen);
    axiIntf.awsize(dut.s_axi_awsize);
    axiIntf.awvalid(dut.s_axi_awvalid);
    axiIntf.awready(dut.s_axi_awready);

    axiIntf.bready(dut.s_axi_bready);
    axiIntf.bid(dut.s_axi_bid);
    axiIntf.bresp(dut.s_axi_bresp);
    axiIntf.bvalid(dut.s_axi_bvalid);

    axiIntf.rready(dut.s_axi_rready);
    axiIntf.rdata(dut.s_axi_rdata);
    axiIntf.rid(dut.s_axi_rid);
    axiIntf.rlast(dut.s_axi_rlast);
    axiIntf.rresp(dut.s_axi_rresp);
    axiIntf.rvalid(dut.s_axi_rvalid);

    axiIntf.wdata(dut.s_axi_wdata);
    // axiIntf.wid(dut.s_axi_wid);
    axiIntf.wlast(dut.s_axi_wlast);
    axiIntf.wstrb(dut.s_axi_wstrb);
    axiIntf.wvalid(dut.s_axi_wvalid);
    axiIntf.wready(dut.s_axi_wready);

  }

  override void doBuild() {
    dut = new DVaxi_regs();
    traceEverOn(true);
    opentrace("axi_regs.vcd");
  }
  
  Task!stimulateClk stimulateClkTask;
  Task!stimulateRst stimulateRstTask;

  void stimulateClk() {
    import std.stdio;
    clk = false;
    while (true) {
      // writeln("clk is: ", clk);
      dut.axi_aclk = false;
      dut.eval();
      if (_trace !is null)
	_trace.dump(getSimTime().getVal());
      clk = false;
      wait (10.nsec);
      dut.axi_aclk = true;
      dut.eval();
      if (_trace !is null) {
	_trace.dump(getSimTime().getVal());
	_trace.flush();
      }
      clk = true;
      wait (10.nsec);
    }
  }

  void stimulateRst() {
    rst = true;
    dut.axi_aresetn = false;
    wait (100.nsec);
    rst = false;
    dut.axi_aresetn = true;
  }
  
}


class axi_tb: uvm_tb
{
  Top top;
}

void main(string[] args) {
  import std.stdio;

  auto tb = new axi_tb;
  tb.multicore(0, 1);
  tb.elaborate("tb", args);
  tb.set_seed(1);
  // tb.setAsyncMode();

  tb.initialize();

  tb.exec_in_uvm_context({
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.ar_driver", "vif", tb.top.axiIntf);
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.aw_driver", "vif", tb.top.axiIntf);
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.dw_driver", "vif", tb.top.axiIntf);
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.dr_driver", "vif", tb.top.axiIntf);
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.b_driver", "vif", tb.top.axiIntf);

      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.ar_collector", "vif", tb.top.axiIntf);
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.aw_collector", "vif", tb.top.axiIntf);
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.w_collector", "vif", tb.top.axiIntf);
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.r_collector", "vif", tb.top.axiIntf);
      uvm_config_db!(AxiIntf!(32, 32)).set(null, "uvm_test_top.env.agent.b_collector", "vif", tb.top.axiIntf);
    });
			   
  tb.start();
  
}
