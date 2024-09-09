
# Makefile Root Path
ROOT_PATH:=D:/SoftwareRoot/Cygwin/home/14817/project/uvm_bench

# UVM Vars
UVM_HOME:=D:/SoftwareRoot/ModelSim10.7-se/verilog_src/uvm-1.1d
UVM_DPI_HOME:=D:/SoftwareRoot/ModelSim10.7-se/win64

# Top Dut Name
DUT_DIR:=$(ROOT_PATH)/../uvm_shizhan_zq/puvm/src/ch2/dut
DUT_NAME:=dut
DUT_PATH:=$(DUT_DIR)/$(DUT_NAME).sv

# Top UVM Testbench Name
TB_DIR:=$(ROOT_PATH)/../uvm_shizhan_zq/puvm/src/ch2/section2.5/2.5.2
TB_NAME:=top_tb
CASE_NAME:=my_case0
TB_PATH=$(TB_DIR)/$(TB_NAME).sv
UVM_TESTNAME:=$(TB_DIR)/$(CASE_NAME)


# Run Simulation Time: -all, 10ns, etc
SIM_TIME:=-all

gen_sim_do:./Makefile
	@mkdir -p gen
	@touch gen/sim.do
	@echo "vlib work" > gen/sim.do
	@echo "vlog +incdir+$(UVM_HOME)/src -L mtiAvm -L mtiOvm -L mtiUvm -L mtiUPF $(UVM_HOME)/src/uvm_pkg.sv $(DUT_PATH) $(TB_PATH)" >> gen/sim.do
	@echo "vsim -c -voptargs=\"+acc\" -sv_lib $(UVM_DPI_HOME)/uvm_dpi work.$(TB_NAME) +UVM_TESTNAME=$(CASE_NAME)" >> gen/sim.do
	@echo "view wave *" >> gen/sim.do
	@echo "run $(SIM_TIME)" >> gen/sim.do

sim:
	@mkdir -p gen
	@touch gen/sim.do
	@vlib work
	@vlog +incdir+$(UVM_HOME)/src -L mtiAvm -L mtiOvm -L mtiUvm -L mtiUPF $(UVM_HOME)/src/uvm_pkg.sv $(DUT_PATH) $(TB_PATH)
	@vsim -c -voptargs="+acc" -sv_lib $(UVM_DPI_HOME)/uvm_dpi work.$(TB_NAME) +UVM_TESTNAME=$(CASE_NAME) -do "run $(SIM_TIME); exit" | tee gen/sim.log
	@-rm -rf transcript work

sim_gui:gen_sim_do
	vsim -do gen/sim.do& > gen/sim.log
	@-rm -rf transcript work
	
debug:
	echo $(ROOT_PATH)


clean:
	rm -rfv gen/* transcript work


