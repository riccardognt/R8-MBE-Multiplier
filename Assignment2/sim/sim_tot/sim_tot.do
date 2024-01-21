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


vlog -work work ../../src/FPU/cf_math_pkg.sv
vlog -work work ../../src/FPU/lzc.sv
vlog -work work ../../src/FPU/rr_arb_tree.sv
vlog -work work ../../src/FPU/fpnew_pkg.sv
vlog -work work ../../src/FPU/fpnew_classifier.sv
vlog -work work ../../src/FPU/fpnew_rounding.sv
vlog -work work ../../src/FPU/fpnew_fma.sv
vlog -work work ../../src/FPU/fpnew_opgroup_fmt_slice.sv
vlog -work work ../../src/FPU/fpnew_opgroup_block.sv
vlog -work work ../../src/FPU/fpnew_top.sv

vcom -work work ../../tb/tb_tot/clk_gen.vhd
vcom -work work ../../tb/tb_tot/data_gen.vhd
vcom -work work ../../tb/tb_tot/data_sink_FPU.vhd


vlog -work work ../../tb/tb_tot/tb_fpnew_top_rtl.sv

vsim work.tb_fpnew_top -voptargs=+acc


add wave sim:/tb_fpnew_top/*
run 2 us


