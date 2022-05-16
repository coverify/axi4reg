module axi_env;

import esdl;
// import axi_tb;
// import axi_seq;
import axi_agnt;
import uvm;

class axi_environment(int DW, int AW): uvm_env
{
  mixin uvm_component_utils;

  // Components of the enviorment
  @UVM_BUILD axi_agent!(DW, AW) agent;
   
   
   // new - constructor
  this(string name, uvm_component parent) {
    super(name, parent);
  }

}
