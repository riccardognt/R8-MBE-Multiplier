# List of the useful files for the tasks

## 10 Floating Point multiplications
definition of the operands and computation of the products --> ./c_model	C code--> ./c_model/c_model.c	executable --> ./c_model/c_model.exe
C results of the products --> ./sim/txt_files/results_c.txt
simulation of the FPU --> src files: ./src/*	testbench files: ./tb/rtl/* 	simulation script: ./sim/FIRST_SIM.do	script results: ./sim/txt_files/results_hdl.txt

## Synthesis part with Synopsys
for simulation resolution in ps --> modifies in ./sim/modelsim.ini

### Synthesis with "compile" command
synthesis script: ./syn/p1.syn	timing report: ./syn/timing_report/report_timing_p1.txt		area report: ./syn/area_report/report_area_p1.txt
tb files for simulation: ./tb/p1_tb/*		simulation script: ./sim/p1.do		products results: ./sim/txt_files/results_hdl_p1.txt

### Synthesis with "compile" and "optimize registers" commands
synthesis script: ./syn/p2.syn	timing report: ./syn/timing_report/report_timing_p2.txt		area report: ./syn/area_report/report_area_p2.txt
tb files for simulation: ./tb/p2_tb (denominated with "...p2.vhd/sv")		simulation script: ./sim/p2.do		products results: ./sim/txt_files/results_hdl_p2.txt

- Synthesis and Simulation at quarter frequency for avoiding timing violations during simulation
synthesis script: ./syn/p2_quart.syn	    timing report: ./syn/timing_report/report_timing_p2_quart.txt		area report: ./syn/area_report/report_area_p2_quart.txt
tb files for simulation: ./tb/p2_quart_tb (denominated with "...p2_quart.vhd/sv")   simulation script: ./sim/p2_quart.do    products results: ./sim/txt_files/results_hdl_p2_quart.txt

### Synthesis with "compile_ultra" command
synthesis script: ./syn/p3.syn	timing report: ./syn/timing_report/report_timing_p3.txt		area report: ./syn/area_report/report_area_p3.txt
tb files for simulation: ./tb/p3_tb/*		simulation script: ./sim/p3.do		products results: ./sim/txt_files/results_hdl_p3.txt

## Synthesis with flatten hierarchy and mantissa multiplier as CSA multiplier
synthesis script: ./syn/p4.syn	timing report: ./syn/timing_report/report_timing_p4.txt		area report: ./syn/area_report/report_area_p4.txt	resource report: ./syn/resource_report/report_resource_p4.txt
tb files for simulation: ./tb/p4_tb/*		simulation script: ./sim/p4.do		products results: ./sim/txt_files/results_hdl_p4.txt

## Synthesis with flatten hierarchy and mantissa multiplier as PPARCH multiplier
synthesis script: ./syn/p5.syn	timing report: ./syn/timing_report/report_timing_p5.txt		area report: ./syn/area_report/report_area_p5.txt	resource report: ./syn/resource_report/report_resource_p5.txt
tb files for simulation: ./tb/p5_tb/ (denominated with "...p5.vhd/sv")		simulation script: ./sim/p5.do		products results: ./sim/txt_files/results_hdl_p5.txt

- Synthesis and Simulation at quarter frequency for avoiding timing violations during simulation
synthesis script: ./syn/p5_quart.syn	    timing report: ./syn/timing_report/report_timing_p5_quart.txt	area report: ./syn/area_report/report_area_p5_quart.txt	  resource report: ./syn/resource_report/report_resource_p5_quart.txt
tb files for simulation: ./tb/p5_quart_tb (denominated with "...p5_quart.vhd/sv")   simulation script: ./sim/p5_quart.do    products results: ./sim/txt_files/results_hdl_p5_quart.txt    