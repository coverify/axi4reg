module axi_agnt;

import esdl;
import axi_tb;
import axi_seq;
import axi_drv;
import axi_mon;
import uvm;

class axi_agent(int DW, int AW): uvm_agent
{
  @UVM_DEFAULT protected int master_id;

  @UVM_BUILD_IF_ACTIVE {
    axiar_driver!(DW, AW) ar_driver;
    axiaw_driver!(DW, AW) aw_driver;
    axidw_driver!(DW, AW) dw_driver;

    axidr_driver!(DW, AW) dr_driver;
    axib_driver!(DW, AW) b_driver;
   
    axia_sequencer!(DW, AW) ar_seqr;
    axia_sequencer!(DW, AW) aw_seqr;
    axid_sequencer!(DW, AW) dw_seqr;
  }
   
  @UVM_BUILD {
    axiar_collector!(DW, AW) ar_collector;
    axiaw_collector!(DW, AW) aw_collector;
    axib_collector!(DW, AW) b_collector;

    axiar_monitor!(DW, AW) ar_monitor;
    axiaw_monitor!(DW, AW) aw_monitor;
    axib_monitor!(DW, AW) b_monitor;

    axir_collector!(DW, AW) r_collector;
    axiw_collector!(DW, AW) w_collector;

    axir_monitor!(DW, AW) r_monitor;
    axiw_monitor!(DW, AW) w_monitor;

    axi_monitor!(DW, AW) monitor;
  }
  // axiwr_monitor!(DW, AW) wr_monitor;
  //axi_collector collector;
  //axi_monitor monitor;
  //axi_mointor monitor;

  // Provide implementations of virtual methods such as get_type_name and create
  mixin uvm_component_utils;


   // new - constructor
  this(string name, uvm_component parent) {
    super(name, parent);
  }

   // build_phase
   // connect_phase
  override void connect_phase(uvm_phase phase) {
    // if (get_is_active() == UVM_ACTIVE) {
    ar_driver.seq_item_port.connect(ar_seqr.seq_item_export);
    aw_driver.seq_item_port.connect(aw_seqr.seq_item_export);
    dw_driver.seq_item_port.connect(dw_seqr.seq_item_export);

    ar_collector.item_collected_port.connect(ar_monitor.addr_in);
    aw_collector.item_collected_port.connect(aw_monitor.addr_in);
    b_collector.item_collected_port.connect(b_monitor.resp_in);
    r_collector.item_collected_port.connect(r_monitor.data_in);
    w_collector.item_collected_port.connect(w_monitor.data_in);

    b_monitor.item_mon_port.connect(monitor.wresp_in);
    aw_monitor.item_mon_port.connect(monitor.waddr_in);
    w_monitor.item_mon_port.connect(monitor.wdata_in);
    ar_monitor.item_mon_port.connect(monitor.raddr_in);
    r_monitor.item_mon_port.connect(monitor.rdata_in);
    // }
  } // : connect_phase

} // axi_agent
