module axi_test;

import uvm;
import esdl;

import axi_seq;
import axi_scrb;
import axi_env;

class axi_error_demoter(string ID, string RX): uvm_report_catcher
{
  this(string name="Error Demoter") {
    super(name);
  }

  override action_e do_catch() {
    if (get_severity() == UVM_ERROR) {
      if ((ID == "" || ID == get_id()) &&
	  uvm_is_match("*" ~ RX ~ "*", get_message())) {
	set_severity(UVM_INFO);
      }
    }
    return action_e.THROW;
  }
}

class axi_dir_test: uvm_test
{
  mixin uvm_component_utils;

  @UVM_BUILD {
    axi_environment!(32, 32)  env;

    // dma_axi_env dma_env;

    uvm_analysis_port!(axi_sequence!(32, 32)) item_mon_port;
    axi_scoreboard!(32, 32) scoreboard;
  }
   
  this(string name="axi_dir_test", uvm_component parent=null) {
    super(name, parent);
  }

  override void build_phase(uvm_phase phase) {
    uvm_info("INFO", "axi_dir_test building...", UVM_NONE);
    super.build_phase(phase);
  }

  override void connect_phase(uvm_phase phase) {
    uvm_info("INFO", "Called my_test::connect_phase", UVM_NONE);
      
    // // Connect virtual interface in driver to actual interface
    // env.agent.ar_driver.vif = tb.axi_if_s0;
    // env.agent.aw_driver.vif = tb.axi_if_s0;
    // env.agent.dw_driver.vif = tb.axi_if_s0;
    // env.agent.dr_driver.vif = tb.axi_if_s0;
    // env.agent.b_driver.vif  = tb.axi_if_s0;
      
    // env.agent.ar_collector.vif = tb.axi_if_s0;
    // env.agent.aw_collector.vif = tb.axi_if_s0;
    // env.agent.b_collector.vif  = tb.axi_if_s0;
    // env.agent.r_collector.vif  = tb.axi_if_s0;
    // env.agent.w_collector.vif  = tb.axi_if_s0;

    item_mon_port.connect(scoreboard.ingress);
    env.agent.monitor.item_mon_port.connect(scoreboard.egress);
  }
   
  override void run_phase(uvm_phase phase) {
    dir_axi_seq!(32, 32) seq;
    phase.raise_objection(this, "dir_axi_seq");
    phase.get_objection.set_drain_time(this, 1000.nsec);

    uvm_info("INFO","Called my_test::run_phase", UVM_NONE);
    seq = new dir_axi_seq!(32, 32)("seq");

    seq.ar_seqr = env.agent.ar_seqr;
    seq.aw_seqr = env.agent.aw_seqr;
    seq.dw_seqr = env.agent.dw_seqr;

    seq.item_mon_port = item_mon_port;
      
    seq.start(null);

    phase.drop_objection(this, "dir_axi_seq");
  }

  override void end_of_elaboration_phase(uvm_phase phase) {
    super.end_of_elaboration_phase(phase);
    auto ro_demoter =
      new axi_error_demoter!("MISMATCH", "Address 00000014")("ro_demoter");
    uvm_report_cb.add(scoreboard, ro_demoter);
    // scoreboard.set_report_severity_id_override(UVM_ERROR, "MISMATCH", UVM_WARNING);
  }
  
  override void report_phase(uvm_phase phase) {
    uvm_info("INFO", "Called my_test::report_phase", UVM_NONE);
  }

}
