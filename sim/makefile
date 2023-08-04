CC              = gcc
CFLAGS		= -Wall -O3 -fPIC

DFLAGS = -relocation-model=pic -w

LDC2BINDIR = $(dir $(shell which ldc2))
VLBINDIR = $(dir $(shell which verilator))
VERBOSITY = DEBUG

VLATOR_SRC = euvm_dir/Vaxi_regs_euvm.d euvm_dir/Vaxi_regs_euvm_funcs.cpp obj_dir/Vaxi_regs.cpp obj_dir/Vaxi_regs.h

all: axi_test

clean:
	rm -rf axi_test* euvm_dir obj_dir verilator.stamp

run: axi_test
	./axi_test +UVM_TESTNAME=axi_test.axi_dir_test +UVM_VERBOSITY=$(VERBOSITY) # +UVM_OBJECTION_TRACE

verilator.stamp: ../rtl/axi_regs.sv
	touch verilator.stamp
	verilator -I../rtl -Wno-WIDTH -Wno-CASEINCOMPLETE --trace --cc --euvm $^
	(cd euvm_dir; g++ -c -I ../obj_dir/ -I $(VLBINDIR)/../share/verilator/include Vaxi_regs_euvm_funcs.cpp)
	(cd euvm_dir; g++ -c -I ../obj_dir/ -I $(VLBINDIR)/../share/verilator/include $(LDC2BINDIR)/../import/esdl/intf/verilator/cpp/verilated_vcd_d.cpp -o verilated_vcd_d.o)
	(cd euvm_dir; g++ -c -I ../obj_dir/ -I $(VLBINDIR)/../share/verilator/include $(LDC2BINDIR)/../import/esdl/intf/verilator/cpp/verilated_d.cpp -o verilated_d.o)
	(cd obj_dir; make -f Vaxi_regs.mk Vaxi_regs__ALL.a verilated.o verilated_vcd_c.o verilated_threads.o)

euvm_dir/Vaxi_regs_euvm.d euvm_dir/Vaxi_regs_euvm_funcs.o euvm_dir/verilated_vcd_d.o obj_dir/Vaxi_regs__ALL.a obj_dir/verilated.o: verilator.stamp


axi_test: euvm_dir/Vaxi_regs_euvm.d \
	   ../testbench/axi_seq.d ../testbench/axi_tb.d \
	   ../testbench/axi_drv.d ../testbench/axi_mon.d \
	   ../testbench/axi_agnt.d ../testbench/axi_env.d \
	   ../testbench/axi_scrb.d ../testbench/axi_test.d \
	   $(LDC2BINDIR)/../import/esdl/intf/verilator/trace.d \
	   euvm_dir/Vaxi_regs_euvm_funcs.o euvm_dir/verilated_vcd_d.o \
	   euvm_dir/verilated_d.o \
	   obj_dir/Vaxi_regs__ALL.a \
	   obj_dir/verilated.o  obj_dir/verilated_threads.o obj_dir/verilated_vcd_c.o
	ldc2 $(DFLAGS) -Ieuvm_dir -link-defaultlib-shared -of$@ -L-luvm-ldc-shared -L-lesdl-ldc-shared \
		-L-lphobos2-ldc-shared -L-lz3 -L-ldl $^ -L-lstdc++

