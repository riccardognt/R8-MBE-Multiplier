`include "half_adder.sv"
`include "full_adder.sv"

module DADDA_STAGE1 (
	input logic [47:0] in_row0,
	input logic [45:0] in_row1,
	input logic [41:0] in_row2,
	input logic [35:0] in_row3,
	input logic [29:0] in_row4,
	input logic [23:0] in_row5,
	input logic [17:0] in_row6,
	input logic [11:0] in_row7,
	input logic [6:0] in_row8,
	output logic [47:0] out_row0,
	output logic [45:0] out_row1,
	output logic [41:0] out_row2,
	output logic [35:0] out_row3,
	output logic [29:0] out_row4,
	output logic [23:0] out_row5,
	output logic [17:0] out_row6,
	output logic [12:0] out_row7
); 


//wires definition
logic [8:0] s,c;

half_adder H0 (.a(in_row6[6]), .b(in_row7[3]), .s(s[0]), .c_o(c[0]));

genvar i;
generate
	for (i=0; i<6; i=i+1) begin
		full_adder f_x (.a(in_row6[i+7]), .b(in_row7[i+4]), .c_in(in_row8[i+1]), .s(s[i+1]), .c_o(c[i+1]));
	end
endgenerate

half_adder H1 (.a(in_row6[13]), .b(in_row7[10]), .s(s[7]), .c_o(c[7]) );

half_adder H2 (.a(in_row6[14]), .b(in_row7[11]), .s(s[8]), .c_o(c[8]) );


always_comb begin
	out_row0 <= {in_row0};
	out_row1 <= {in_row1};
	out_row2 <= {in_row2};
	out_row3 <= {in_row3};
	out_row4 <= {in_row4};
	out_row5 <= {in_row5};
	out_row6 <= {in_row6[17:15],s[8:0],in_row6[5:0]};
	out_row7 <= {c[8:0],in_row8[0],in_row7[2:0]};
end

endmodule



