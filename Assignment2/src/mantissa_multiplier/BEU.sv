
module BEU #( 
	parameter num_par_prod,
	parameter input_nbit)(
	input [input_nbit-1:0] Y,
	output [num_par_prod-1:0][4:0] d
);


genvar i;
generate
	for (i=0; i<num_par_prod; i++) begin
		if (i==0) begin
			BoothEncoder BE_0 (.y0(1'b0), .y1(Y[3*i]), .y2(Y[3*i+1]), .y3(Y[3*i+2]), .di(d[i])); //first bit is an empty position
		end
		else if (i>0 && i<8)begin
			BoothEncoder BE_x (.y0(Y[3*i-1]), .y1(Y[3*i]), .y2(Y[3*i+1]), .y3(Y[3*i+2]), .di(d[i]));
		end
		else if (i==8) begin
			BoothEncoder BE_8 (.y0(Y[3*i-1]), .y1(1'b0), .y2(1'b0), .y3(1'b0), .di(d[i]));
		end
	end
endgenerate


endmodule
