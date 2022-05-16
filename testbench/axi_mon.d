module axi_mon;

import esdl;
import uvm;
import axi_seq;
import axi_tb;


class axiar_collector(int DW, int AW): uvm_component
{

  mixin uvm_component_utils;

  AxiIntf!(DW, AW) vif;

  @UVM_BUILD
  uvm_analysis_port!(axia_seq_item!(DW, AW)) item_collected_port;

  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void run_phase(uvm_phase phase) {

    axia_seq_item!(DW, AW) item;

    wait(vif.clk.posedge());

    while (true) { // forever begin
      do {
	wait(vif.clk.posedge());
      }
      while (vif.rst == true);

      if (vif.arvalid == true && vif.arready == true) {
	item = new axia_seq_item!(DW, AW)("axiar_seq_item");
	item.addr = vif.araddr;
	item.burst = 1; // INCR
	item.length = vif.arlen;
	item.size = vif.arsize;
	item.id = vif.arid;
	item_collected_port.write(item);
      }
    } // forever begin
  } // : run_phase
   
} // axiar_collector

class axiar_monitor(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;

  @UVM_BUILD {
    uvm_analysis_port!(axia_sequence!(DW, AW)) item_mon_port;

    uvm_analysis_imp!(axia_seq_item!(DW, AW),
		      axiar_monitor!(DW, AW)) addr_in;
  }

  this(string name, uvm_component parent) {
    super(name, parent);
  }

  void write(axia_seq_item!(DW, AW) addr) {
    axia_sequence!(DW, AW) seq = new axia_sequence!(DW, AW)("ar_mon_seq");
      // $display("Observed read addr transaction");
    seq.addr = addr.addr;
    seq.burst = addr.burst;
    seq.length = addr.length;
    seq.size = addr.size;
    seq.id = addr.id;
    //seq.print();
    item_mon_port.write(seq);
  } // write_addr
   
} // axiar_monitor

class axiaw_collector(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;
   
  AxiIntf!(DW, AW) vif;

  @UVM_BUILD
  uvm_analysis_port!(axia_seq_item!(DW, AW)) item_collected_port;

  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void run_phase(uvm_phase phase) {

    axia_seq_item!(DW, AW) item;
      
    wait(vif.clk.posedge());

    while (true) {
      do {
	wait(vif.clk.posedge());
      } while (vif.rst == true);
      if (vif.awvalid == true && vif.awready == true) {
	item = new axia_seq_item!(DW, AW)("axiaw_seq_item");
	item.addr = vif.awaddr;
	item.burst = 1; // INCR
	item.length = vif.awlen;
	item.size = vif.awsize;
	item.id = vif.awid;
	item_collected_port.write(item);
      }
    } // forever {
  } // : run_phase
   
} // axiaw_collector

class axiaw_monitor(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;

  @UVM_BUILD {
    uvm_analysis_port!(axia_sequence!(DW, AW)) item_mon_port;
    uvm_analysis_imp!(axia_seq_item!(DW, AW),
		      axiaw_monitor!(DW, AW)) addr_in;
  }

  this(string name, uvm_component parent) {
    super(name, parent);
  }

  void write(axia_seq_item!(DW, AW) addr) {
    axia_sequence!(DW, AW) seq = new axia_sequence!(DW, AW)("aw_mon_seq");
    // $display("Observed write addr transaction");
    seq.addr = addr.addr;
    seq.burst = addr.burst;
    seq.length = addr.length;
    seq.size = addr.size;
    seq.id = addr.id;
    //seq.print();
    item_mon_port.write(seq);
  } // write_addr
   
} // axiaw_monitor

class axib_collector(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;
  AxiIntf!(DW, AW) vif;

  @UVM_BUILD
  uvm_analysis_port!(axib_seq_item!(DW, AW)) item_collected_port;

  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void run_phase(uvm_phase phase) {

    axib_seq_item!(DW, AW) item;
      
    wait(vif.clk.posedge());
    while (true) {
	 do {
	   wait(vif.clk.posedge());
	 } while (vif.rst == true);
	 if (vif.bvalid == true && vif.bready ==true) {
	   item = new axib_seq_item!(DW, AW)("axib_seq_item");
	   item.id = vif.bid;
	   item.resp = vif.bresp;
	   item_collected_port.write(item);
	 }
    } // forever {
  } // : run_phase
   
} // axib_collector

class axib_monitor(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;

  @UVM_BUILD {
    uvm_analysis_port!(axib_sequence!(DW, AW)) item_mon_port;
    uvm_analysis_imp!(axib_seq_item!(DW, AW),
		      axib_monitor!(DW, AW)) resp_in;
  }

  this(string name, uvm_component parent) {
    super(name, parent);
  }

  void write(axib_seq_item!(DW, AW) resp) {
    axib_sequence!(DW, AW) seq = new axib_sequence!(DW, AW)("b_mon_seq");
    // $display("Observed write resp transaction");
    seq.id = resp.id;
    seq.resp = resp.resp;
    item_mon_port.write(seq);
  } // write_addr
   
} // axib_monitor

class axir_collector(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;
  AxiIntf!(DW, AW) vif;

  @UVM_BUILD
  uvm_analysis_port!(axid_seq_item!(DW, AW)) item_collected_port;

  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }


  override void run_phase(uvm_phase phase) {
    axid_seq_item!(DW, AW) item;
      
    wait(vif.clk.posedge());
    while (true) {
      do {
	wait(vif.clk.posedge());
	 } while (vif.rst == true);
      if (vif.rvalid == true && vif.rready == true) {
	item = new axid_seq_item!(DW, AW)("axir_seq_item");
	item.id = vif.rid;
	item.data = vif.rdata;
	// item.resp = vif.rresp;
	item.last = vif.rlast;
	item_collected_port.write(item);
	 }
      } // forever {
  } // : run_phase
   
} // axir_collector

class axir_monitor(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;

  @UVM_BUILD {
    uvm_analysis_port!(axid_sequence!(DW, AW)) item_mon_port;
    uvm_analysis_imp!(axid_seq_item!(DW, AW),
		      axir_monitor!(DW, AW)) data_in;
  }

  axid_sequence!(DW, AW)[256] seqs;
  axid_sequence!(DW, AW) seq;
  ubyte current_id;
   
  this(string name, uvm_component parent) {
    super(name, parent);
  }

  void write(axid_seq_item!(DW, AW) data) {
    current_id = data.id;
    if (seqs[current_id] is null) {
      seqs[current_id] = new axid_sequence!(DW, AW)("r_mon_seq");
      seqs[current_id].id = current_id;
    }
    seq = seqs[current_id];
    seq.data ~= data.data;
    if (data.last) {
      seqs[current_id] = null;
      //seq.print();
      // $display("Observed read data transaction");
      item_mon_port.write(seq);
    }
  } // write_addr
   
} // axir_monitor

class axiw_collector(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;
  AxiIntf!(DW, AW) vif;

  @UVM_BUILD
  uvm_analysis_port!(axid_seq_item!(DW, AW)) item_collected_port;

  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  override void run_phase(uvm_phase phase) {
    axid_seq_item!(DW, AW) item;
      
    wait(vif.clk.posedge());

    while (true) {
      do {
	wait(vif.clk.posedge());
      } while (vif.rst == true);
      if (vif.wvalid == true && vif.wready == true) {
	item = new axid_seq_item!(DW, AW)("axiw_seq_item");
	// item.id = vif.wid;
	item.data = vif.wdata;
	// if(item.data != 0) {
	//    $display("Collected Value of data:  %h", item.data);
	// }
	item.strb = vif.wstrb;
	// item.resp = vif.wresp;
	item.last = vif.wlast;
	//item.print();
	item_collected_port.write(item);
      }
    } // forever {
  } // : run_phase
   
} // axiw_collector

class axiw_monitor(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;

  @UVM_BUILD {
    uvm_analysis_port!(axid_sequence!(DW, AW)) item_mon_port;
    uvm_analysis_imp!(axid_seq_item!(DW, AW),
		      axiw_monitor!(DW, AW)) data_in;
  }

  axid_sequence!(DW, AW)[256] seqs;
  axid_sequence!(DW, AW) seq;
  ubyte current_id;
   
  this(string name, uvm_component parent) {
    super(name, parent);
  }

  void write(axid_seq_item!(DW, AW) data) {
    current_id = data.id;
    if (seqs[current_id] is null) {
      seqs[current_id] = new axid_sequence!(DW, AW)("r_mon_seq");
      seqs[current_id].id = current_id;
    }
    seq = seqs[current_id];
    seq.data ~= data.data;
    seq.strb ~= data.strb;
    // if(data.data!=0) {
    // 	 $display("Monitored non zero data: %h", data.data);
    // }
    if (data.last) {
      seqs[current_id] = null;
      //seq.print();
      // $display("Observed write data transaction");
      uvm_info("AXIDWMON", seq.sprint(), UVM_DEBUG);
      item_mon_port.write(seq);
    }
  } // write
   
} // axiw_monitor

class axi_collector(int DW, int AW): uvm_component
{

  mixin uvm_component_utils;

  @UVM_BUILD {
    uvm_analysis_port!(axi_seq_item!(DW, AW)) item_col_port;

    uvm_analysis_imp!(axib_seq_item!(DW, AW), write_wbcol) wbcol_in;
    uvm_analysis_imp!(axia_seq_item!(DW, AW), write_wacol) wacol_in;
    uvm_analysis_imp!(axid_seq_item!(DW, AW), write_wdcol) wdcol_in;
    uvm_analysis_imp!(axia_seq_item!(DW, AW), write_racol) racol_in;
    uvm_analysis_imp!(axid_seq_item!(DW, AW), write_rdcol) rdcol_in;
  }

  this(string name, uvm_component parent) {
    super(name, parent);
    uvm_config_db!(AxiIntf!(DW, AW)).get(this, "", "vif", vif);
    assert (vif !is null);
  }

  Queue!(axia_seq_item!(DW, AW)) awqueue;
  Queue!(axid_seq_item!(DW, AW)) wqueue;
  Queue!(axib_seq_item!(DW, AW)) bqueue;
  Queue!(axia_seq_item!(DW, AW)) arqueue;
  Queue!(axid_seq_item!(DW, AW)) rqueue;

   void write_racol(axia_seq_item!(DW, AW) addr) {
     arqueue ~= addr;
   }
   
   void write_rdcol(axid_seq_item!(DW, AW) data) {
     axia_seq_item!(DW, AW) addr = arqueue[0]; // .pop_front();
     axi_seq_item!(DW, AW) item = new axi_seq_item!(DW, AW)("axi_col_seq_item");

     if (addr is null) {
       uvm_error("AXIDATANOADDR", "Observed AXI READ transaction on Data channel without corresponding transaction on READ Address channel");
       return;
     }

      item.addr = addr.addr;
      item.burst = addr.burst;
      item.length = addr.length;
      item.size = addr.size;

      // item.resp = resp.resp;
      item.op = OP.READ;

      item.rwdata = data.data;
      item.strb = data.strb;
      item.id = data.id;
      item.last = data.last;

      if (data.last == true) {
	 arqueue.popFront();
      }
      item_col_port.write(item);
   }
   
   void write_wacol(axia_seq_item!(DW, AW) addr) {
     awqueue ~= addr;
   }
   
   void write_wdcol(axid_seq_item!(DW, AW) data) {
     wqueue ~= data;
   }
   
   void write_wbcol(axib_seq_item!(DW, AW) resp) {
      // bqueue.push_back(resp);
      // now that there is response, look for data and addr
     axia_seq_item!(DW, AW) addr;
     awqueue.popFront(addr);
     if (addr is null) {
       uvm_error("AXIDATANOADDR", "Observed AXI WRITE transaction on Data channel without corresponding transaction on WRITE Address channel");
       return;
     }
     while (true) {
       axid_seq_item!(DW, AW) data;
       wqueue.popFront(data);
       axi_seq_item!(DW, AW) item = new axi_seq_item!(DW, AW)("axiwr_col_seq_item");

       if (data is null) {
	 uvm_error("AXINOLAST", "Observed AXI WRITE response before last write transaction");
	 return;
       } // if (data == null)
	 
       item.addr = addr.addr;
       item.burst = addr.burst;
       item.length = addr.length;
       item.size = addr.size;

       item.resp = resp.resp;
       item.op = OP.WRITE;

       item.rwdata = data.data;
       // if(item.rwdata != 0) {
       //    $display("Axi monitor valur fo non zero data; %p", item.rwdata);  
       // }
       item.strb = data.strb;
       item.id = data.id;
       item.last = data.last;
       item_col_port.write(item);
       if (item.last) break;
     }
   } // write_wbcol
   
} // axi_collector

class axi_monitor(int DW, int AW): uvm_component
{
  mixin uvm_component_utils;

  @UVM_BUILD {
    uvm_analysis_port!(axi_sequence!(DW, AW)) item_mon_port;

    uvm_analysis_imp!(write_wresp) wresp_in;
    uvm_analysis_imp!(write_waddr) waddr_in;
    uvm_analysis_imp!(write_wdata) wdata_in;
    uvm_analysis_imp!(write_raddr) raddr_in;
    uvm_analysis_imp!(write_rdata) rdata_in;
  }

  this(string name, uvm_component parent) {
    super(name, parent);
  }

  Queue!(axia_sequence!(DW, AW)) awqueue;
  Queue!(axid_sequence!(DW, AW)) wqueue;
  Queue!(axib_sequence!(DW, AW)) bqueue;

  Queue!(axia_sequence!(DW, AW)) arqueue;
  Queue!(axid_sequence!(DW, AW)) rqueue;

  void write_raddr(axia_sequence!(DW, AW) addr) {
    arqueue ~= addr;
  }
   
  void write_rdata(axid_sequence!(DW, AW) data) {
    axia_sequence!(DW, AW) addr;
    arqueue.popFront(addr);

    axi_sequence!(DW, AW) item = new axi_sequence!(DW, AW)("axird_mon_seq");

    if (addr !is null) {
      item.addr = addr.addr;
      item.burst = addr.burst;
      item.length = addr.length;
      item.size = addr.size;

      // item.resp = resp.resp;
      item.op = OP.READ;
      //item.print();
      item.pack_data(data.data, data.strb, 0); // no strb with rdata
      item_mon_port.write(item);
    }
  }
   
  void write_waddr(axia_sequence!(DW, AW) addr) {
    awqueue ~= addr;
  }
   
  void write_wdata(axid_sequence!(DW, AW) data) {
    wqueue ~= data;
  }
   
  void write_wresp(axib_sequence!(DW, AW) resp) {
      // bqueue.push_back(resp);
      // now that there is response, look for data and addr
    axia_sequence!(DW, AW) addr;
    awqueue.popFront(addr);
    axid_sequence!(DW, AW) data;
    wqueue.popFront(data);
      
    axi_sequence!(DW, AW) item = new axi_sequence!(DW, AW)("axiwr_mon_seq");

    item.addr = addr.addr;
    item.burst = addr.burst;
    item.length = addr.length;
    item.size = addr.size;

    item.resp = resp.resp;
    item.op = OP.WRITE;

    item.pack_data(data.data, data.strb, 1);
    item_mon_port.write(item);
  } // write_resp
   
   
} // axi_monitor

