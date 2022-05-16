module axi_seq;

import uvm;
import esdl;

import std.string: format;

class axia_seq_item(int DW, int AW): uvm_sequence_item
{
  mixin uvm_object_utils;

  @UVM_DEFAULT {
    @rand ubvec!AW addr;
    @rand ubvec!2  burst;
    @rand ubvec!8 length;
    @rand ubvec!3 size;
    // wait cycles to insert after completion of transaction
    @rand int wait_cycles;
    ubyte 	id;
  }

  this(string name = "axia_seq_item") {
    super(name);
  }

} // axia_seq_item

class axia_sequence(int DW, int AW): uvm_sequence!(axia_seq_item!(DW, AW))
{
  mixin uvm_object_utils;

  @UVM_DEFAULT { 
    @rand ubvec!AW addr;
    @rand ubvec!2 burst;
    @rand ubvec!8 length;
    @rand ubvec!3 size;
    // wait cycles to insert after completion of transaction
    @rand int wait_cycles;
    ubyte 	id;
  }

  this(string name = "axia_sequence") {
    super(name);
  }

  override void body() {
      axia_seq_item!(DW, AW) trans;
      
      // trans = axi_seq_item #(DW, AW)::type_id::create("trans");
      trans = new axia_seq_item!(DW, AW)("trans");
      trans.addr = addr;
      trans.burst = burst;
      trans.length = length;
      trans.size = size;
      trans.wait_cycles = wait_cycles;
      trans.id = id;
      
      start_item(trans);
      finish_item(trans);
    }
}

class axib_seq_item(int DW, int AW): uvm_sequence_item
{
  mixin uvm_object_utils;
  
  @UVM_DEFAULT {
    ubyte id;
    ubvec!2 resp;
  }
   
  this(string name = "axib_seq_item") {
    super(name);
  }
}

class axib_sequence(int DW, int AW): uvm_sequence!(axib_seq_item!(DW, AW))
{
  mixin uvm_object_utils;
  @UVM_DEFAULT {
    ubyte id;
    ubvec!2 resp;
  }

  this(string name = "axib_sequence") {
    super(name);
  }

  override void body() {
      axib_seq_item!(DW, AW) trans;
      
      // trans = axi_seq_item #(DW, AW)::type_id::create("trans");
      trans = new axib_seq_item!(DW, AW)("trans");
      trans.id = id;
      trans.resp = resp;
      start_item(trans);
      finish_item(trans);
    }

}

class axid_seq_item(int DW, int AW): uvm_sequence_item
{
  mixin uvm_object_utils;
  @UVM_DEFAULT {
    @rand ubvec!DW data;
    ubvec!(DW/8) strb;
    ubyte id;
    bool last;
    // wait cycles to insert after completion of transaction
    @rand int wait_cycles;
  }

  this(string name = "axid_seq_item") {
      super(name);
  }

} // axid_seq_item

class axid_sequence(int DW, int AW): uvm_sequence!(axid_seq_item!(DW, AW))
{
  mixin uvm_object_utils;
  @UVM_DEFAULT {
    @rand ubvec!DW[] data;
    ubvec!(DW/8)[] strb;
    ubyte id;
    // wait cycles to insert after completion of transaction
    @rand int wait_cycles;
  }

  this(string name = "axid_sequence") {
    super(name);
  }

  override void body() {
    assert(data.length == strb.length);
    for(int i = 0; i != data.length; ++i) {
      axid_seq_item!(DW, AW) trans = new axid_seq_item!(DW, AW)("trans");
	 
      trans.data = data[i];
      trans.strb = strb[i];
      trans.id = id;
      trans.wait_cycles = wait_cycles;
	 
      if (i == data.length - 1) {
	trans.last = true;
      }
      else {
	trans.last = false;
      }
      start_item(trans);
      finish_item(trans);
    }
  }

} // axid_seq_item

enum OP: bool {READ, WRITE}

class axi_seq_item(int DW, int AW): uvm_sequence_item
{
  mixin uvm_object_utils;
  
  @UVM_DEFAULT {
    @rand ubvec!DW rwdata;
    @rand ubvec!AW addr;
    @rand ubvec!2 burst;
    @rand ubvec!8 length;
    @rand ubvec!3 size;
    // wait cycles to insert after completion of transaction
    @rand int wait_cycles;

    @rand ubvec!(DW/8) strb;
    bool 		   last;
    ubyte 	   id;
    OP 		   op;
    ubvec!2          resp; 	   
  }


   
  this(string name = "axia_seq_item") {
    super(name);
  }

}

// Virtual Sequence
class axi_sequence(int DW, int AW): uvm_sequence!(axi_seq_item!(DW, AW))
{
  mixin uvm_object_utils;
  
  @UVM_DEFAULT {
    @rand ubvec!AW addr;
    @rand ubyte[] data;	// could be x for read operations
    @rand bool[] strb;		// could be x for read operations
    @rand ubvec!2 burst;
    @rand ubvec!8 length;
    @rand ubvec!3 size;
    // wait cycles to insert after completion of transaction
    @rand int wait_cycles;

    @rand OP op;			// 0 -> read, 1 -> write

    ubyte 	id;
    ubvec!2 	resp;
  }


  this (string name = "axi_seq_item") {
    super(name);
  }

  void unpack_data(ref ubvec!DW[] data_,
		   ref ubvec!(DW/8)[] strb_) {
      // The start address issued by the master
      ubvec!AW start_address = addr;
      // The maximum number of bytes in each data transfer
      int 	   number_bytes = 1 << size;
      // The number of byte lanes in the data bus
      int 	   data_bus_bytes = DW/8;
      // The aligned version of the start address
      ubvec!AW aligned_address = cast(ubvec!AW) ((start_address/number_bytes) *
						 number_bytes);
      // The total number of data transfers within a burst
      int 	   burst_length = length + 1;
      // The address of transfer N within a burst. N is an integer from 2-16
      ubvec!AW[] address;
      
      // The lowest address within a wrapping burst
      ubvec!AW wrap_boundary;
      // The byte lane of the lowest addressed byte of a transfer
      int[] 	   lower_byte_lane; // = new[burst_length];
      // The byte lane of the highest addressed byte of a transfer
      int[] 	   upper_byte_lane; // = new[burst_length];

      int 	   total_bytes = 0;
      int          empty_bytes = 0;

      address.length = burst_length;
      lower_byte_lane.length = burst_length;
      upper_byte_lane.length = burst_length;
      
      foreach (i, ref addr; address) {
	if (i == 0) {
	  addr = start_address;
	}
	else {
	  addr = cast(ubvec!AW) (aligned_address + i * number_bytes);
	}
      }
      
      wrap_boundary = cast(ubvec!AW) ((start_address/(number_bytes * burst_length)) *
				      (number_bytes * burst_length));

      foreach (i, ref addr; lower_byte_lane) {
	if (i == 0) {
	  addr = start_address - (start_address/data_bus_bytes) * data_bus_bytes;
	}
	else {
	  addr = address[i] - (address[i]/data_bus_bytes) * data_bus_bytes;
	}
      }
      
      foreach (i, ref addr; upper_byte_lane) {
	if (i == 0) {
	  addr = aligned_address + (number_bytes - 1) -
	    (start_address/data_bus_bytes) * data_bus_bytes;
	}
	else {
	  addr = lower_byte_lane[i] + number_bytes -1;
	}
      }
      
      strb_.length = 0;	// initialize
      
      for (int i = 0; i != burst_length; ++i) {
	strb_ ~= toubvec!(DW/8) ((1 << (upper_byte_lane[i] + 1)) -
				      (1 << lower_byte_lane[i]));
	total_bytes += upper_byte_lane[i] + 1 - lower_byte_lane[i];
      }

      
      empty_bytes = cast(uint) (total_bytes - data.length);

      if (empty_bytes >= number_bytes) {
	uvm_info("AXITRANS", this.sprint(), UVM_NONE);
	uvm_fatal("AXIBURSTDATA",
		  "Data on AXI transaction is no sufficient to last the specified strb");
      }

      if (empty_bytes > 0) {
	 upper_byte_lane[burst_length-1] -= empty_bytes;
	 strb_[burst_length-1] = toubvec!(DW/8)((1 << (upper_byte_lane[burst_length-1] + 1)) -
						(1 << lower_byte_lane[burst_length-1]));
      }
	 
      int index = 0;
      data_.length = 0;	// initialize
      
      for (int i = 0; i != burst_length; ++i) {
	data_ ~= toubvec!DW (0);
	for (int j = lower_byte_lane[i];
	     j != upper_byte_lane[i] + 1; ++j) {
	  data_[i] |= this.data[index++] << j * 8;
	}
      }
  }
   
  void pack_data(ubvec!DW[] data_,
		 ubvec!(DW/8)[] strb_, bool check_burst = 1) {
    // The start address issued by the master
    ubvec!AW start_address = addr;
    // The maximum number of bytes in each data transfer
    int 	  number_bytes = 1 << size;
    // The number of byte lanes in the data bus
    int 	  data_bus_bytes = DW/8;
    // The aligned version of the start address
    ubvec!AW aligned_address = cast(ubvec!(AW))((start_address/number_bytes) * number_bytes);
    // The total number of data transfers within a burst
    int 	   burst_length = length + 1;
    // The address of transfer N within a burst. N is an integer from 2-16
    ubvec!AW[] address;  // = new[burst_length];
    // The lowest address within a wrapping burst
    ubvec!AW wrap_boundary;
    // The byte lane of the lowest addressed byte of a transfer
    int[] 	   lower_byte_lane; // = new[burst_length];
    // The byte lane of the highest addressed byte of a transfer
    int[] 	   upper_byte_lane; // new[burst_length];

    address.length = burst_length;
    lower_byte_lane.length = burst_length;
    upper_byte_lane.length = burst_length;
      
    int 	   total_bytes = 0;

    if (check_burst && data_.length != strb_.length) {
      uvm_error("PACKDATA", format("data_.length: (%s) does not match strb_.length (%s)",
				   data_.length, strb_.length));
    }

    foreach (i, ref addr; address) {
      if (i == 0) {
	addr = start_address;
      }
      else {
	addr = cast(ubvec!AW)(aligned_address + i * number_bytes);
      }
    }
      
    wrap_boundary = cast(ubvec!AW)((start_address/(number_bytes * burst_length)) *
				   (number_bytes * burst_length));

    foreach (i, addr; lower_byte_lane) {
      if (i == 0) {
	addr = start_address - (start_address/data_bus_bytes) * data_bus_bytes;
      }
      else {
	addr = address[i] - (address[i]/data_bus_bytes) * data_bus_bytes;
      }
    }
      
    foreach (i, ref addr; upper_byte_lane) {
      if (i == 0) {
	addr = aligned_address + (number_bytes - 1) - (start_address/data_bus_bytes) * data_bus_bytes;
      }
      else {
	addr = lower_byte_lane[i] + number_bytes -1;
      }
    }
      
    // now get the burst bits
    // strb_ = new[burst_length];

    if (data_.length != burst_length) {
      uvm_error("AXIBURSTDATA", format("Bad burst on data sequence detected data_size: %d != burst_length: %d",
				       data_.length, burst_length));
    }
	 
    if (check_burst && strb_.length != burst_length) {
      uvm_error("AXIBURSTDATA", format("Bad strb on data sequence detected strb.size %d : burst_length %d",
				       strb_.length, burst_length));
    }

    foreach (i, data; data_) {
      if (check_burst) {
	ubvec!(DW/8) masked_strb = cast (ubvec!(DW/8)) (strb_[i] & ((1 << (upper_byte_lane[i] + 1)) -
								    (1 << lower_byte_lane[i])));
	if (strb_[i] != masked_strb) {
	  uvm_error("AXIBURSTDATA",
		    format("Bad strb on data sequence detected\n  Masked Strb: %b -- Strb: %b",
			   masked_strb, strb_[i]));
	}
      }
      total_bytes += upper_byte_lane[i] + 1 - lower_byte_lane[i];
    }

    int index = 0;
    this.data.length = total_bytes;
    this.strb.length = total_bytes;
    foreach (i, data; data_) {
      for (int j = lower_byte_lane[i]; j != upper_byte_lane[i] + 1; ++j) {
	this.data[index] = cast(ubyte) (data >> j * 8);
	if (check_burst) {
	  this.strb[index] = cast(bool) (strb_[i] >> j);
	}
	else {
	  this.strb[index] = true;
	}
	index += 1;
      }
    }
  }
   
   axia_sequencer!(DW, AW) ar_seqr; // read address
   axia_sequencer!(DW, AW) aw_seqr; // write address
   axid_sequencer!(DW, AW) dw_seqr; // write data

   axia_sequence!(DW, AW) ar_seq;
   axia_sequence!(DW, AW) aw_seq;
   axid_sequence!(DW, AW) dw_seq;

   override void body() {
      assert(ar_seqr !is null && aw_seqr !is null && dw_seqr !is null);
      if (op == OP.WRITE) {
	aw_seq = new axia_sequence!(DW, AW)("aw_seq");
	aw_seq.addr = addr;
	aw_seq.burst = burst;
	aw_seq.length = length;
	aw_seq.size = size;
	aw_seq.id = id;
	aw_seq.wait_cycles = wait_cycles;

	dw_seq = new axid_sequence!(DW, AW)("dw_seq");
	unpack_data(dw_seq.data, dw_seq.strb);
	fork({aw_seq.start(aw_seqr, this);},
	     {dw_seq.start(dw_seqr, this);}
	     ).join();
      }
      else {
	ar_seq = new axia_sequence!(DW, AW)("ar_seq");
	ar_seq.addr = addr;
	ar_seq.burst = burst;
	ar_seq.length = length;
	ar_seq.size = size;
	ar_seq.id = id;
	ar_seq.wait_cycles = wait_cycles;
	ar_seq.start(ar_seqr, this);
      }
	 
     }
}

class axia_sequencer(int DW, int AW): uvm_sequencer!(axia_seq_item!(DW, AW))
{
  mixin uvm_component_utils;
  this(string name, uvm_component parent=null) {
    super(name, parent);
  }
}

class axid_sequencer(int DW, int AW): uvm_sequencer!(axid_seq_item!(DW, AW))
{
  mixin uvm_component_utils;
  this(string name, uvm_component parent=null) {
    super(name, parent);
  }
}

class axi_sequencer(int DW, int AW): uvm_sequencer!(axi_seq_item!(DW, AW))
{
  mixin uvm_component_utils;
  this(string name, uvm_component parent=null) {
    super(name, parent);
  }
}

class dir_axi_seq(int DW, int AW): uvm_sequence!(axi_seq_item!(DW, AW))
{

  import std.stdio: File;
  import std.format: formattedRead;
  
  axi_sequence!(DW, AW) seq;
   
  axia_sequencer!(DW, AW) ar_seqr; // read address
  axia_sequencer!(DW, AW) aw_seqr; // write address
  axid_sequencer!(DW, AW) dw_seqr; // write data

  enum uint BYTES = DW/8;

  uvm_analysis_port!(axi_sequence!(DW, AW)) item_mon_port;
   

  this(string name="dir_axi_seq") {
    super(name);
  }

  mixin uvm_object_utils;
   
  override void body() {
    // initialize to odd so that it does not match with gpaddr0
    ubvec!AW baseaddr = 1; 
    int      addroffset = 0;

    assert(ar_seqr !is null && aw_seqr !is null && dw_seqr !is null);

    File dirIn = File("dir.in");

    foreach (line; dirIn.byLine()) {
      int access;
      uint addr;
      ulong val;

      if (formattedRead(line, "%d %x %x", access, addr, val) == 3) {

	uvm_info("PARSER", format("access: %d, addr: %x, val: %x",
				  access, addr, val), UVM_DEBUG);
	
	seq = new axi_sequence!(DW, AW)("axi_seq");
	 
	seq.ar_seqr = ar_seqr;
	seq.aw_seqr = aw_seqr;
	seq.dw_seqr = dw_seqr;
	 
	if (access) seq.op = OP.WRITE;
	else seq.op = OP.READ;

	if (addr % BYTES) {
	  uvm_warning("UNALIGNED",
		      format("Aligning register address %x to %x", addr, (addr/BYTES) * BYTES));
	  addr = (addr/BYTES) * BYTES;
	}

	seq.addr = toubvec!AW(addr);
	seq.burst = 1;	// INCR
	seq.length = 0;	// single
	seq.size = 2.toubvec!3;	// 32 bit

	seq.data.length = BYTES;

	foreach (i, ref d; seq.data) {
	  d = cast (ubyte) (val >> i*8);
	}
	
	item_mon_port.write(seq);
	seq.start(null, this);
      }

      else uvm_warning("BADDATA", cast(string) line);
    }
  } // body
} // dir_axi_seq
