`include "half_adder.sv"
`include "full_adder.sv"
`include "compressor_5_to_3.sv"

module DADDA_STAGE2 (
	input logic [47:0] in_row0,
	input logic [45:0] in_row1,
	input logic [41:0] in_row2,
	input logic [35:0] in_row3,
	input logic [29:0] in_row4,
	input logic [23:0] in_row5,
	input logic [17:0] in_row6,
	input logic [12:0] in_row7,
	output logic [47:0] out_row0,
	output logic [45:0] out_row1,
	output logic [41:0] out_row2,
	output logic [36:0] out_row3

);

//definitions
logic [57:0] s,c;
logic [37:0] Tout;

//col12 starting counting from 1
half_adder H0 (.a(in_row0[11]), .b(in_row1[9]), .s(s[0]), .c_o(c[0]) );

//col13
full_adder F0 (.a(in_row0[12]), .b(in_row1[10]), .c_in(in_row2[7]), .s(s[1]), .c_o(c[1]) );

//col14
full_adder F1 (.a(in_row0[13]), .b(in_row1[11]), .c_in(in_row2[8]), .s(s[2]), .c_o(c[2]) );

//COMP. BLOCK 1 --> col15 to col39
genvar i;

generate
	for (i=0; i<25; i=i+1) begin
		if (i==0) begin
			compressor_5_to_3 comp_x (.Tin(1'b0), .x1(in_row0[i+14]), .x2(in_row1[i+12]), .x3(in_row2[i+9]), .x4(in_row3[i+6]), .S(s[i+3]), .C(c[i+3]), .Tout(Tout[i]));
   		end else begin
			compressor_5_to_3 comp_x (.Tin(Tout[i-1]), .x1(in_row0[i+14]), .x2(in_row1[i+12]), .x3(in_row2[i+9]), .x4(in_row3[i+6]), .S(s[i+3]), .C(c[i+3]), .Tout(Tout[i]));
   		end
	end
endgenerate

//col18-19-20 only HA and FA
half_adder H1 (.a(in_row4[6]), .b(in_row5[3]), .s(s[28]), .c_o(c[28]) );
full_adder F2 (.a(in_row4[7]), .b(in_row5[4]), .c_in(in_row6[1]), .s(s[29]), .c_o(c[29]) );
full_adder F3 (.a(in_row4[8]), .b(in_row5[5]), .c_in(in_row6[2]), .s(s[30]), .c_o(c[30]) );

//COMP. BLOCK 2 --> col21 to col33
genvar j;

generate
	for (j=0; j<13; j=j+1) begin
	  if (j==0) begin
		compressor_5_to_3 comp_x (.Tin(1'b0), .x1(in_row4[j+9]), .x2(in_row5[j+6]), .x3(in_row6[j+3]), .x4(in_row7[j]), .S(s[j+31]), .C(c[j+31]), .Tout(Tout[j+25]));
   end else begin
		compressor_5_to_3 comp_x (.Tin(Tout[j+24]), .x1(in_row4[j+9]), .x2(in_row5[j+6]), .x3(in_row6[j+3]), .x4(in_row7[j]), .S(s[j+31]), .C(c[j+31]), .Tout(Tout[j+25]));
   end
end	
endgenerate

//col34
full_adder F4 (.a(in_row4[22]), .b(in_row5[19]), .c_in(in_row6[16]), .s(s[44]), .c_o(c[44]) );
half_adder H2 (.a(c[21]), .b(c[43]), .s(s[45]), .c_o(c[45]) );

//col35
full_adder F5 (.a(in_row4[23]), .b(in_row5[20]), .c_in(in_row6[17]), .s(s[46]), .c_o(c[46]) );
half_adder H3 (.a(c[22]), .b(c[44]), .s(s[47]), .c_o(c[47]) );

//col36
full_adder F6 (.a(in_row4[24]), .b(in_row5[21]), .c_in(c[23]), .s(s[48]), .c_o(c[48]) );

//col37
half_adder H4 (.a(in_row4[25]), .b(in_row5[22]), .s(s[49]), .c_o(c[49]) );

//col38
half_adder H5 (.a(in_row4[26]), .b(in_row5[23]), .s(s[50]), .c_o(c[50]) );

//col40
full_adder F7 (.a(in_row0[39]), .b(in_row1[37]), .c_in(in_row2[34]), .s(s[51]), .c_o(c[51]) );
half_adder H6 (.a(in_row3[31]), .b(in_row4[28]), .s(s[52]), .c_o(c[52]) );

//col4
full_adder F8 (.a(in_row0[40]), .b(in_row1[38]), .c_in(in_row2[35]), .s(s[53]), .c_o(c[53]) );
half_adder H7 (.a(in_row3[32]), .b(in_row4[29]), .s(s[54]), .c_o(c[54]) );

//col41
full_adder F9 (.a(in_row0[41]), .b(in_row1[39]), .c_in(in_row2[36]), .s(s[55]), .c_o(c[55]) );

//col42
half_adder H8 (.a(in_row0[42]), .b(in_row1[40]), .s(s[56]), .c_o(c[56]) );

//col43
half_adder H9 (.a(in_row0[43]), .b(in_row1[41]), .s(s[57]), .c_o(c[57]) );


always_comb begin
	out_row0 <= {in_row0[47:44],s[57:55],s[53],s[51] ,s[27:0],in_row0[10:0]};	
	out_row1 <= {in_row1[45:42],in_row2[38:37],in_row3[33],s[54],s[52],in_row4[27],s[50:48],s[46],s[44:28],in_row4[5:3],in_row3[5],in_row3[4],in_row2[6],in_row1[8:0]};
	out_row2 <= {in_row2[41:39],in_row3[35:34],c[53],c[51],c[27:24],c[46],s[47],s[45],c[20:6],in_row6[0],in_row5[2:0],in_row4[2],in_row4[1],in_row3[3],in_row2[5:0]};
	out_row3 <= {c[57:54],c[52],Tout[24],c[50:47],c[45],Tout[37],c[42:28],c[5:0],in_row4[0],in_row3[2:0]};
end

endmodule



