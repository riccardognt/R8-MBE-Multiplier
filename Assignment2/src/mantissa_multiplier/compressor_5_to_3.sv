`include "full_adder.sv"

module compressor_5_to_3 (
	input logic     Tin,x1,x2,x3,x4,
	output logic    S,C,Tout
);

logic s_fa2;
	
full_adder FA1 (.a(Tin),.b(x1),.c_in(s_fa2),.s(S),.c_o(C));
full_adder FA2 (.a(x2),.b(x3),.c_in(x4),.s(s_fa2),.c_o(Tout));
	
endmodule
