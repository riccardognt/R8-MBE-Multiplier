quit -sim
vlib work

vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/cf_math_pkg.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/fpnew_pkg.sv

vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/netlist/fpnew_top_p4.v

vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p4_tb/clk_gen_p4.vhd
vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p4_tb/data_gen.vhd
vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p4_tb/data_sink_FPU_p4.vhd
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p4_tb/tb_fpnew_top_net_p4.sv

vsim -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_fpnew_top_net_p4 -voptargs=+acc
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_fpnew_top_net_p4/UUT=../netlist/fpnew_top_p4.sdf work.tb_fpnew_top_net_p4 -voptargs=+acc

add wave sim:/tb_fpnew_top_net_p4/*
run 2 us

