`include "half_adder.sv"
`include "full_adder.sv"
`include "compressor_5_to_3.sv"

module DADDA_STAGE3 (		
	input logic [47:0] in_row0,
	input logic [45:0] in_row1,
	input logic [41:0] in_row2,
	input logic [36:0] in_row3,
	output logic [47:0] out_row0,
	output logic [47:0] out_row1
);

logic s_ha0, c_ha0, s_fa0, c_fa0, s_fa1, c_fa1;
logic [36:0] s_c, c_c, Tout_c ;
logic s_fa2, c_fa2, s_fa3, c_fa3, s_fa4, c_fa4, s_ha1, c_ha1, s_ha2, c_ha2;


half_adder H0 (.a(in_row0[5]), .b(in_row1[3]), .s(s_ha0), .c_o(c_ha0) );
full_adder F0 (.a(in_row0[6]), .b(in_row1[4]), .c_in(in_row2[1]) , .s(s_fa0), .c_o(c_fa0) );
full_adder F1 (.a(in_row0[7]), .b(in_row1[5]), .c_in(in_row2[2]) , .s(s_fa1), .c_o(c_fa1) );

genvar i;
generate
	for (i=0 ; i<37 ; i++) begin
	if (i==0) begin
		compressor_5_to_3 comp_x (.Tin(1'b0),.x1(in_row0[i+8]), .x2(in_row1[i+6]), .x3(in_row2[i+3]),.x4(in_row3[i]),.S(s_c[i]),.C(c_c[i]),.Tout(Tout_c[i]));
	end
	else  begin
		compressor_5_to_3 comp_x (.Tin(Tout_c[i-1]),.x1(in_row0[i+8]), .x2(in_row1[i+6]), .x3(in_row2[i+3]),.x4(in_row3[i]),.S(s_c[i]),.C(c_c[i]),.Tout(Tout_c[i]));
	
	end;
	end;
endgenerate


full_adder F2 (.a(in_row0[45]), .b(in_row1[43]), .c_in(in_row2[40]) , .s(s_fa2), .c_o(c_fa2) );
full_adder F3 (.a(in_row0[46]), .b(in_row1[44]), .c_in(in_row2[41]) , .s(s_fa3), .c_o(c_fa3) );
full_adder F4 (.a(in_row0[47]), .b(in_row1[45]), .c_in(c_fa3) , .s(s_fa4), .c_o(c_fa4) );

half_adder H1 (.a(Tout_c[36]), .b(c_c[36]), .s(s_ha1), .c_o(c_ha1) );
half_adder H2 (.a(c_fa2), .b(c_ha1), .s(s_ha2), .c_o(c_ha2) );

assign out_row0 = { s_fa4, s_fa3 , s_fa2 , s_c , s_fa1 , s_fa0 , s_ha0 ,in_row0[4:0]};
assign out_row1 = { c_ha2 , s_ha2 , s_ha1 , c_c[35:0] , c_fa1 , c_fa0 , c_ha0 , in_row2[0] , in_row1[2:0], 2'b00};


endmodule
