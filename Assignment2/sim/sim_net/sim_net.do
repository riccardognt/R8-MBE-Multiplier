quit -sim
vlib work




vlog -work work ../../netlist/fpnew_top.v

vlog -work work ../../src/FPU/cf_math_pkg.sv
vlog -work work ../../src/FPU/fpnew_pkg.sv

vcom -work work ../../tb/tb_net/clk_gen_mm.vhd
vcom -work work ../../tb/tb_net/data_gen.vhd
vcom -work work ../../tb/tb_net/data_sink_FPU_mm.vhd
vlog -work work ../../tb/tb_net/tb_fpnew_top_net_mm.sv

vsim -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_fpnew_top_net_mm -voptargs=+acc
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_fpnew_top_net_mm/UUT=../../netlist/fpnew_top.sdf work.tb_fpnew_top_net_mm -voptargs=+acc

add wave sim:/tb_fpnew_top_net_mm/*
run 2 us


