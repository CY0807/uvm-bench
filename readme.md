
# UVM Bench For Modelsim on Windows

This is a bench for simulating UVM framwork with ModelSim-10.7-se-win64 on Windows11

The UVM source codes are from the git of the book <UVM Shi Zhan>

## command:

1. "make sim" command: It will start the UVM simulation with the terminal, the output will be saved in gen/sim.log

2. "make sim_gui" command: It will open the Modelsim GUI, and all things will happen within ModelSim GUI. A sim.do file for ModelSim will be generated at gen/sim.do

## Variables:

There are Several Variables that you need to change according to your own environment, to make sure that the ModelSim will run successfully.

1. UVM_HOME and UVM_DPI_HOME: These should be changed to where your Modelsim is installed.

2. DUT_DIR and DUT_PATH: Your Top Dut file name and path.

3. TB_DIR and TB_PATH: Your Top UVM TestBench name and path.


## note:

1.Run all commands in Linux environment, with tools like git bash or cygwin. Instead of Windows Shell.

