quit -sim
vlib work

vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/cf_math_pkg.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/lzc.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/rr_arb_tree.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/fpnew_pkg.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/fpnew_classifier.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/fpnew_rounding.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/fpnew_fma.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/fpnew_opgroup_fmt_slice.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/src/fpnew_opgroup_block.sv
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/netlist/fpnew_top_p3.v

vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p3_tb/clk_gen_p3.vhd
vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p3_tb/data_gen.vhd
vcom -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p3_tb/data_sink_FPU_p3.vhd
vlog -reportprogress 300 -work work /home/isa09_2022_2023/lab2/Assignment1/tb/p3_tb/tb_fpnew_top_net_p3.sv

vsim -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_fpnew_top_net_p3 -voptargs=+acc
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_fpnew_top_net_p3/UUT=../netlist/fpnew_top_p3.sdf work.tb_fpnew_top_net_p3 -voptargs=+acc

add wave sim:/tb_fpnew_top_net_p3/*
run 2 us

#quit -sim
#quit

