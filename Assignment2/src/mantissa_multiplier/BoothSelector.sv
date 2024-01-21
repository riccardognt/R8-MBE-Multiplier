
module BoothSelector_j (
    input _xi, _2xi, _3xi, _4xi,
    input [4:0] _di,
    output ppij
);

logic w1, w2, w3, w4, w5, w6, w7;

and
and0(w1, _di[0], _xi),
and1(w2, _di[1], _2xi),
and2(w3, _di[2], _3xi),
and3(w4, _di[3], _4xi);

nor
nor0(w5, w1, w2),
nor1(w6, w3, w4);

nand
nand0(w7, w5, w6);

xor
xor0(ppij, w7, _di[4]);

endmodule



module BoothSelector 
	#( parameter nbit )(
    input [nbit-1:0] _X, _2X, _3X, _4X,
    input [4:0] di,
    output [nbit-1:0] ppi
);

genvar j;
generate
    for (j = 0; j < nbit; j++) begin
        BoothSelector_j BSj (._xi(_X[j]), ._2xi(_2X[j]), ._3xi(_3X[j]), ._4xi(_4X[j]), ._di(di), .ppij(ppi[j]));
    end
endgenerate

endmodule


