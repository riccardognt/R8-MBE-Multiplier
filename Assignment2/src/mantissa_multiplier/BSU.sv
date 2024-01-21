
module BSU #( 	
	parameter num_par_prod, 
  	parameter res_nbit)(
	input [res_nbit-1:0] _X_, _2X_, _3X_, _4X_,
	input [num_par_prod-1:0][4:0] __d,
	output [num_par_prod-1:0][res_nbit-1:0] par_prod
);

genvar i;
generate
	for (i=0; i<num_par_prod; i++) begin
			BoothSelector #(.nbit(res_nbit)) BS_x (._X(_X_), ._2X(_2X_), ._3X(_3X_), ._4X(_4X_), .di(__d[i]), .ppi(par_prod[i]));

	end
endgenerate

endmodule
