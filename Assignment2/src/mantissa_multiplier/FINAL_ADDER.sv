
module FINAL_ADDER (	
	input logic [47:0] in_row0,
	input logic [47:0] in_row1,
	output logic [47:0] result
);

assign result =in_row0 + in_row1;

endmodule 
