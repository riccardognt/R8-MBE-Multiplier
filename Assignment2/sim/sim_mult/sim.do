quit -sim
vlib work
vlog -work work ../../src/mantissa_multiplier/PPG.sv
vlog -work work ../../src/mantissa_multiplier/BoothEncoder.sv
vlog -work work ../../src/mantissa_multiplier/BEU.sv
vlog -work work ../../src/mantissa_multiplier/BoothSelector.sv
vlog -work work ../../src/mantissa_multiplier/BSU.sv
vlog -work work ../../src/mantissa_multiplier/part_prod_top.sv

vlog -work work ../../src/mantissa_multiplier/PPRU.sv
vlog -work work ../../src/mantissa_multiplier/ADJUST.sv
vlog -work work ../../src/mantissa_multiplier/DADDA_STAGE1.sv
vlog -work work ../../src/mantissa_multiplier/DADDA_STAGE2.sv
vlog -work work ../../src/mantissa_multiplier/DADDA_STAGE3.sv
vlog -work work ../../src/mantissa_multiplier/FINAL_ADDER.sv
vlog -work work ../../src/mantissa_multiplier/AU.sv

vlog -work work ../../src/mantissa_multiplier/mantissa_multiplier.sv

vlog -work work ../../tb/multiplier_tb.sv

vsim work.multiplier_tb -t ns -voptargs=+acc
add wave sim:/multiplier_tb/*
run 2 us

