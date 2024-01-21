
module PPG #(	
	parameter input_nbit,
	parameter res_nbit)(
	input logic [input_nbit-1:0] X,
	output logic [res_nbit-1:0] _X, _2X, _3X, _4X
);



always_comb begin

    _X  <= {2'b00, X};
    _2X <= {1'b0, X, 1'b0};
    _3X <= {2'b00, X} + {1'b0, X, 1'b0};
    _4X <= {X, 2'b00};

end


endmodule
