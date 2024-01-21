
module part_prod_top #( 	
	parameter num_par_prod,
	parameter input_nbit,
	parameter res_nbit )(
	input logic [input_nbit-1:0] X_in, Y_in,
	output logic [res_nbit-1:0] pp0, pp1, pp2, pp3, pp4, pp5 ,pp6, pp7,
	output logic [input_nbit-1:0]pp8,
	output logic [num_par_prod-2:0] sign_bits //last one is always positive
);


logic [res_nbit-1:0] __X, __2X, __3X, __4X;
logic [num_par_prod-1:0][res_nbit-1:0] _par_prod;
logic [num_par_prod-1:0][4:0] d_out_beu;


PPG #(.input_nbit(input_nbit),.res_nbit(res_nbit)) ppg ( .X(X_in), ._X(__X), ._2X(__2X), ._3X(__3X), ._4X(__4X));

BEU #(.num_par_prod(num_par_prod), .input_nbit(input_nbit)) beu ( .Y(Y_in), .d(d_out_beu));

BSU #(.num_par_prod(num_par_prod), .res_nbit(res_nbit)) bsu (._X_(__X), ._2X_(__2X), ._3X_(__3X), ._4X_(__4X), .__d(d_out_beu), .par_prod(_par_prod));


always_comb begin
	pp0 <=_par_prod[0];
	pp1 <=_par_prod[1];
	pp2 <=_par_prod[2];
	pp3 <=_par_prod[3];
	pp4 <=_par_prod[4];
	pp5 <=_par_prod[5];
	pp6 <=_par_prod[6];
	pp7 <=_par_prod[7];
	pp8 <=_par_prod[8][input_nbit-1:0]; //last one is always equal to the X*1 since there is three zero bits due to padding
	sign_bits <= {d_out_beu[7][4],d_out_beu[6][4],d_out_beu[5][4],d_out_beu[4][4],d_out_beu[3][4],d_out_beu[2][4],d_out_beu[1][4],d_out_beu[0][4]}; //sign bits are the MSBs of vectors at output of Booth Encoder unit
end


endmodule
