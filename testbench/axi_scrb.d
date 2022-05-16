module axi_scrb;

import uvm;
import esdl;

import std.string: format;
import axi_seq;


class axi_scoreboard(int DW, int AW): uvm_component
{

  mixin uvm_component_utils;
  
  @UVM_BUILD {
    uvm_analysis_imp!(write_ingress) ingress;
    uvm_analysis_imp!(write_egress)  egress;
  }
   
  this(string name, uvm_component parent) {
      super(name, parent);
  }

  Queue!(axi_sequence!(DW, AW)) rdq;
  Queue!(axi_sequence!(DW, AW)) wrq;

  uvm_phase this_phase;


  // uvm_run_phase::get().drop_objection(this) gives internal error with Aldec
  override void run_phase(uvm_phase phase) {
    this_phase = phase;
  } // run_phase
   
  void write_ingress(axi_sequence!(DW, AW) seq) {
    if (this.rdq.length == 0 && this.wrq.length == 0) {
      // if (this_phase != null)
      this_phase.raise_objection(this);
      uvm_info("AXISB_OBJECTION",
	       "Raising Objection", UVM_NONE);
    }
    if (seq.op == OP.READ) {
      rdq ~= seq;
    }
    else {
      wrq ~= seq;
    }
    uvm_info("AXICNT", format(">> AXI Queue rdq size %d wrq size %d",
			      rdq.length, wrq.length), UVM_DEBUG);
  } // write_ingress
   
  void write_egress(axi_sequence!(DW, AW) obsv) {
    axi_sequence!(DW, AW) stim;
    if (obsv.op == OP.READ) {
      uvm_info("AXIREAD", format("Observed READ sequence on AXI address %x", obsv.addr),
	       UVM_DEBUG);
    }
    if (obsv.op == OP.READ) {
      if (rdq.length == 0) {
	uvm_error("MONNOSTIM", "There is no STIMULUS transaction corresponding to observed transaction");
	return;
      }
      else {
	rdq.popFront(stim);
      }
    }
    else {
      if (wrq.length == 0) {
	uvm_error("MONNOSTIM", "There is no STIMULUS transaction corresponding to observed transaction");
	return;
      }
      else {
	wrq.popFront(stim);
      }
    }

    if (stim.data != obsv.data) {
      uvm_error("MISMATCH",
		format("Access %d -- Found mismatch between expected %s and obsrved %s data on Address %x",
		       obsv.op, stim.data, obsv.data, obsv.addr));
    }
	    
    else {
      uvm_info("MATCHED",
	       format("Access %d -- Found a match between expected %s and obsrved %s data on Address %x",
		      obsv.op, stim.data, obsv.data, obsv.addr), UVM_DEBUG);
    }
	    
    if (rdq.length == 0 && wrq.length == 0) {
      // if (this_phase != null)
      this_phase.drop_objection(this);
      uvm_info("AXISB_OBJECTION",
	       "Dropping Objection", UVM_NONE);
    }

} // write_egress

  override void check_phase(uvm_phase phase) {
    foreach(i, rd; rdq) {
      uvm_error("NORESPONSE",
		format("Read sequence did not elicit any response: %s",
		       rd.sprint()));
    }
      
    foreach(i, wr; wrq) {
      uvm_error("NORESPONSE",
		format("Read sequence did not elicit any response: %s",
		       wr.sprint()));
    }
      
    if (rdq.length > 0 || wrq.length > 0) {
      uvm_error("NORESPONSE",
		"Some AXI requests did not get any responce from the DUT");
    }
  }
   
   
} // axi_scoreboard
