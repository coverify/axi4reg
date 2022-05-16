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

  axiar_driver!(DW, AW) ar_driver;
  axiaw_driver!(DW, AW) aw_driver;
  axidw_driver!(DW, AW) dw_driver;

  axidr_driver!(DW, AW) dr_driver;
  axib_driver!(DW, AW) b_driver;
   
  axia_sequencer!(DW, AW) ar_seqr;
  axia_sequencer!(DW, AW) aw_seqr;
  axid_sequencer!(DW, AW) dw_seqr;
   
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
  override void build_phase(uvm_phase phase) {
    super.build_phase(phase);
    //monitor = axi_monitor::type_id::create("monitor", this);
    //collector = axi_collector::type_id::create("collector", this);

    if (get_is_active() == UVM_ACTIVE) {
      // rd_seqr = axi_sequencer!(DW, AW)::type_id::create("rd_seqr", this);
      // wr_seqr = axi_sequencer!(DW, AW)::type_id::create("wr_seqr", this);
      ar_seqr = new axia_sequencer!(DW, AW)("ar_seqr", this);
      aw_seqr = new axia_sequencer!(DW, AW)("aw_seqr", this);
      dw_seqr = new axid_sequencer!(DW, AW)("dw_seqr", this);
	 
      // wr_driver = axi_write_driver!(DW, AW)::type_id::create("wr_driver", this);
      // rd_driver = axi_read_driver!(DW, AW)::type_id::create("rd_driver", this);
      ar_driver = new axiar_driver!(DW, AW)("ar_driver", this);
      aw_driver = new axiaw_driver!(DW, AW)("aw_driver", this);
      dw_driver = new axidw_driver!(DW, AW)("dw_driver", this);

      dr_driver = new axidr_driver!(DW, AW)("dr_driver", this);
      b_driver  = new axib_driver!(DW, AW)("b_driver",  this);
     
    } // if (get_is_active() == UVM_ACTIVE)

    ar_collector = new axiar_collector!(DW, AW)("ar_collector", this);
    aw_collector = new axiaw_collector!(DW, AW)("aw_collector", this);
    b_collector  = new axib_collector!(DW, AW)("b_collector", this);
    ar_monitor = new axiar_monitor!(DW, AW)("ar_monitor", this);
    aw_monitor = new axiaw_monitor!(DW, AW)("aw_monitor", this);
    b_monitor  = new axib_monitor!(DW, AW)("b_monitor", this);

    r_collector = new axir_collector!(DW, AW)("r_collector", this);
    w_collector = new axiw_collector!(DW, AW)("w_collector", this);
    r_monitor   = new axir_monitor!(DW, AW)("r_monitor", this);
    w_monitor   = new axiw_monitor!(DW, AW)("w_monitor", this);

    monitor   = new axi_monitor!(DW, AW)("monitor", this );
  }

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
