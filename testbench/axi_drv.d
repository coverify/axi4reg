module axi_drv;

import esdl;
import axi_tb;
import axi_seq;
import uvm;

class axiar_driver(int DW, int AW): uvm_driver!(axia_seq_item!(DW, AW))
{

  AxiIntf!(DW, AW) vif;

  mixin uvm_component_utils;
   
  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void build_phase(uvm_phase phase) {
    super.build_phase(phase);
  }

  override void run_phase(uvm_phase phase) {
    uvm_info("INFO", "Called rd_driver::run_phase", UVM_NONE);
    super.run_phase(phase);

    fork( { get_and_drive(phase); },
	  { reset_signals(); }).join();
  }

  void get_and_drive(uvm_phase phase) {
      
    axia_seq_item!(DW, AW) req, rsp;

    wait(vif.clk.negedge());

    while (true) {
      seq_item_port.try_next_item(req);
      if (req is null) {
	wait(vif.clk.negedge());
      }
      else {
	rsp = cast (axia_seq_item!(DW, AW)) req.clone();
	assert (rsp !is null);
	rsp.set_id_info(req);
	drive_transfer(rsp);
	seq_item_port.item_done();
      }
    }
  }

  void reset_signals() {
    while (true) {
      while (vif.rst == false) wait(vif.clk.negedge());
      vif.araddr = 0.toubvec!AW;
      vif.arid = 0.toubvec!8;
      vif.arvalid = false;
      vif.arlen = 0.toubvec!8;
      vif.arsize = 0.toubvec!3;

      wait(vif.clk.negedge());
    }
  }

  void drive_transfer ( axia_seq_item!(DW, AW) trans ) {
    while (vif.rst == true) wait(vif.clk.negedge());
    vif.arvalid = true;
    vif.araddr = trans.addr;
    vif.arsize = trans.size;
    vif.arlen  = trans.length;

    wait(vif.clk.negedge());

    while (vif.arready != 1) wait(vif.clk.negedge());
    vif.arvalid = false;
    vif.araddr = 0.toubvec!AW;
    vif.arsize = 0.toubvec!3;
    vif.arlen  = 0.toubvec!8;

    for (size_t i=0; i!=trans.wait_cycles; ++i) {
      wait(vif.clk.negedge());
    }
  }
}

class axiaw_driver(int DW, int AW): uvm_driver!(axia_seq_item!(DW, AW))
{

  AxiIntf!(DW, AW) vif;

  mixin uvm_component_utils;
   
  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void build_phase(uvm_phase phase) {
    super.build_phase(phase);
  }

  override void run_phase(uvm_phase phase) {
    uvm_info("INFO", "Called rd_driver::run_phase", UVM_NONE);
    super.run_phase(phase);
    fork({get_and_drive(phase);},
	 {reset_signals();}).join();
  }

  void get_and_drive(uvm_phase phase) {
      
    axia_seq_item!(DW, AW) req, rsp;
    wait(vif.clk.negedge());

    while (true) { // forever begin
      seq_item_port.try_next_item(req);
      if (req is null) {
	wait(vif.clk.negedge());
      }
      else {
	rsp = cast (axia_seq_item!(DW, AW)) req.clone();
	assert (rsp !is null);
	rsp.set_id_info(req);
	drive_transfer(rsp);
	seq_item_port.item_done();
      }
    }
  }

  void reset_signals() {
    while (true) { // forever begin
      while (vif.rst == false) wait(vif.clk.negedge());
      vif.awaddr = 0.toubvec!AW;
      vif.awid = 0.toubvec!8;
      vif.awvalid = false;
      vif.awlen = 0.toubvec!8;
      vif.awsize = 0.toubvec!3;
      wait(vif.clk.negedge());
    }
  }

  void drive_transfer(axia_seq_item!(DW, AW) trans ) {
    while (vif.rst == true) wait(vif.clk.negedge());
    vif.awvalid = true;
    vif.awaddr = trans.addr;
    vif.awsize = trans.size;
    vif.awlen  = trans.length;
    wait(vif.clk.negedge());

    while (vif.awready != 1) {
      uvm_info("WAITFORREADY", "Waiting for AWREADY", UVM_DEBUG);
      wait(vif.clk.negedge());
    }

    vif.awvalid = false;
    vif.awaddr = 0.toubvec!AW;
    vif.awsize = 0.toubvec!3;
    vif.awlen  = 0.toubvec!8;
    for (size_t i=0; i!=trans.wait_cycles; ++i) {
      wait(vif.clk.negedge());
    }
  } // drive_transfer
   
} // axiaw_driver

class axib_driver(int DW, int AW): uvm_component
{
  AxiIntf!(DW, AW) vif;

  mixin uvm_component_utils;
   
  this(string name , uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void build_phase(uvm_phase phase) {
    super.build_phase(phase);
  }

  override void run_phase(uvm_phase phase) {
    uvm_info("INFO", "Called wr_driver::run_phase", UVM_NONE);
    super.run_phase(phase);
    reset_signals();
  }

  void reset_signals() {
    while (true) { // forever begin
      while (vif.rst == false) wait(vif.clk.negedge());
      vif.bready  = true;
      wait(vif.clk.negedge());
    }
  }

}

class axidr_driver(int DW, int AW): uvm_component
{
  AxiIntf!(DW, AW) vif;

  mixin uvm_component_utils;
   
  this(string name , uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void build_phase(uvm_phase phase) {
    super.build_phase(phase);
  }

  override void run_phase(uvm_phase phase) {
    uvm_info("INFO", "Called wr_driver::run_phase", UVM_NONE);
    super.run_phase(phase);
    reset_signals();
  }

  void reset_signals() {
    while (true) { // forever begin
      while (vif.rst == false) wait(vif.clk.negedge());
      vif.rready  = true;
      wait(vif.clk.negedge());
    }
  }
}

class axidw_driver(int DW, int AW): uvm_driver!(axid_seq_item!(DW, AW))
{
  AxiIntf!(DW, AW) vif;

  mixin uvm_component_utils;
   
  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void build_phase(uvm_phase phase) {
    super.build_phase(phase);
  }

  override void run_phase(uvm_phase phase) {
    uvm_info("INFO", "Called wr_driver::run_phase", UVM_NONE);
    super.run_phase(phase);
    fork({get_and_drive(phase);},
	 {reset_signals();}).join();
  }

  void get_and_drive(uvm_phase phase) {
    axid_seq_item!(DW, AW) req, rsp;

    wait(vif.clk.negedge());

    while (true) { // forever begin
      seq_item_port.try_next_item(req);
      if (req is null) {
	wait(vif.clk.negedge());
      }
      else {
	rsp = cast(axid_seq_item!(DW, AW)) req.clone();
	assert (rsp !is null);
	rsp.set_id_info(req);
	drive_transfer(rsp);
	seq_item_port.item_done();
      }
    } // forever begin
  }

  void reset_signals() {
    while (true) { // forever begin
      while (vif.rst == false) wait(vif.clk.negedge());
      vif.wdata   = 0.toubvec!DW;
      vif.wvalid  = false;
      vif.wstrb   = 0.toubvec!(DW/8);
      // vif.wid     = 0.toubvec!8;
      vif.wlast   = false;
      wait(vif.clk.negedge());
    }
  } // reset_signals

  void drive_transfer (axid_seq_item!(DW, AW) trans) {
    while (vif.rst == true) wait(vif.clk.negedge());
    vif.wvalid = true;
    vif.wlast = trans.last;
    vif.wdata = trans.data;
    vif.wstrb = trans.strb;
    wait(vif.clk.negedge());
    while (vif.wready != 1) wait(vif.clk.negedge());
    vif.wvalid = false;
    vif.wlast = false;
    vif.wdata = 0.toubvec!DW;
    vif.wstrb = 0.toubvec!(DW/8);
    for (size_t i=0; i!=trans.wait_cycles; ++i) {
      wait(vif.clk.negedge());
    }
  } // drive_transfer
} // axidw_driver


class axi_driver(int DW, int AW): uvm_driver!(axi_seq_item!(DW, AW)) 
{
  AxiIntf!(DW, AW) vif;

  mixin uvm_component_utils;
   
  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void build_phase(uvm_phase phase) {
    super.build_phase(phase);
  }

  override void run_phase(uvm_phase phase) {
    uvm_info("INFO", "Called axi_driver::run_phase", UVM_NONE);
    super.run_phase(phase);
    fork({get_and_drive(phase);},
	 {reset_signals();}).join();
  }

  void get_and_drive(uvm_phase phase) {
      
    axi_seq_item!(DW, AW) req, rsp;
      
    wait(vif.clk.negedge());

    while (true) { // forever begin
      seq_item_port.get_next_item(req);
      rsp = cast(axi_seq_item!(DW, AW)) req.clone();
      assert (rsp !is null);
      rsp.set_id_info(req);
      drive_transfer(rsp);
      seq_item_port.item_done(rsp);
    }
  }

  void reset_signals() {
    while (true) { // forever begin
      while (vif.rst == false) wait(vif.clk.negedge());

      vif.awaddr  = 0;
      vif.awid    = 0;
      vif.awvalid = 0;
      vif.awlen   = 0;
      vif.awsize  = 0;
      vif.wdata   = 0;
      vif.wvalid  = 0;
      vif.wstrb   = 0;
      vif.wid     = 0;
      vif.wlast   = 0;
      vif.rready  = true;
      vif.araddr  = 0;
      vif.arid    = 0;
      vif.arvalid = 0;
      vif.arlen   = 0;
      vif.arsize  = 0;
      vif.bready  = true;
      wait(vif.clk.negedge());
    }
  } // reset_signals

  void drive_transfer(axi_seq_item!(DW, AW) trans) {
    while (vif.rst == true) wait(vif.clk.negedge());
    // @(vif.driver);
    if (trans.op == 1) {
      vif.araddr  = 0;
      vif.arid    = 0;
      vif.arvalid = 0;
      vif.arlen   = 0;
      vif.arsize  = 0;
      vif.awaddr  = trans.addr;
      vif.awid    = trans.id;
      vif.awvalid = true;
      vif.awlen   = trans.length;
      vif.awsize  = trans.size;
      vif.rready  = true;
      vif.wdata   = trans.rwdata;
      vif.wvalid  = true;
      vif.wstrb   = trans.strb;
      vif.wid     = trans.id;
      vif.wlast   = trans.last;
      fork({
	  wait(vif.clk.negedge());
	  while(vif.awready == 0) {
	    wait(vif.clk.negedge());
	  }
	  vif.awvalid = false;
	},
	{
	  wait(vif.clk.negedge());
	  while(vif.wready == 0) {
	    wait(vif.clk.negedge());
	  }
	  vif.wvalid = false;  
	}).join();
      vif.bready  = true;
      while(vif.bvalid == 0) {
	wait(vif.clk.negedge());
      }
      // trans.resp = vif.bresp;
      vif.bready  = false;
    }
    else {
      vif.awaddr  = 0;
      vif.awid    = 0;
      vif.awvalid = 0;
      vif.awlen   = 0;
      vif.awsize  = 0;
      vif.araddr  = trans.addr;
      vif.arid    = trans.id;
      vif.arvalid = true;
      vif.arlen   = trans.length;
      vif.arsize  = trans.size;
      vif.wdata   = 0;
      vif.wvalid  = false;
      wait(vif.clk.negedge());

      while(vif.arready == 0) {
	wait(vif.clk.negedge());
      }
      vif.arvalid = false;
      vif.rready = true;
      while(vif.rvalid == 0) {
	wait(vif.clk.negedge());
      }
      trans.rwdata = vif.rdata;
      trans.last = vif.rlast;
      // $display("rwdata at driver %h", trans.rwdata);
      // vif.rready = 1'b0;
    } // else: !if(trans.op == 1)
  } // drive_transfer

} // axi_driver
