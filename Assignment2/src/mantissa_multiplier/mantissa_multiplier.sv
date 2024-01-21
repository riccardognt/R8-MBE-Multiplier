
module mantissa_multiplier #( 	
	parameter num_par_prod = 9,
	parameter input_nbit=24,
	parameter res_nbit= 26 )(

    	input [input_nbit-1:0] Xin, Yin,
	output [2*input_nbit-1:0] RESULT
);

logic [num_par_prod-2:0] pp_signs;
logic [res_nbit-1:0] w0, w1, w2, w3, w4, w5, w6, w7;
logic [input_nbit-1:0] w8;

part_prod_top #(.num_par_prod( num_par_prod), .input_nbit(input_nbit), .res_nbit(res_nbit)) pp_top( 
		.X_in(Xin), .Y_in(Yin), .pp0(w0), .pp1(w1), .pp2(w2), .pp3(w3), .pp4(w4), .pp5(w5), .pp6(w6), .pp7(w7), .pp8(w8), .sign_bits(pp_signs));

AU adder_unit ( .PP0(w0), .PP1(w1), .PP2(w2), .PP3(w3), .PP4(w4), .PP5(w5), .PP6(w6), .PP7(w7), .PP8(w8), .PP_sign(pp_signs), .res(RESULT));

endmodule
