quit -sim
vlib work

vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/cf_math_pkg.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/fpnew_pkg.sv

vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/netlist/fpnew_top_p2_quart.v

vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p2_tb/clk_gen_p2_quart.vhd
vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p2_tb/data_gen.vhd
vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p2_tb/data_sink_FPU_p2_quart.vhd
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p2_tb/tb_fpnew_top_net_p2_quart.sv

vsim -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_fpnew_top_net_p2_quart -voptargs=+acc
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_fpnew_top_net_p2_quart/UUT=../netlist/fpnew_top_p2_quart.sdf work.tb_fpnew_top_net_p2_quart -voptargs=+acc

add wave sim:/tb_fpnew_top_net_p2_quart/*
run 2 us

