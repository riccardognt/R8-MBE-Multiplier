//regularize the partial products

module PPRU(	
	input logic [7:0] sign,
	input logic [25:0] p0,p1,p2,p3,p4,p5,p6,p7,
	input logic [23:0] p8,
	output logic [29:0] rpp0,rpp1,rpp2,rpp3,rpp4,rpp5,rpp6,
	output logic [27:0] rpp7,
	output logic [24:0] rpp8
);

	
assign rpp0 = {~sign[0] , sign[0] , sign[0] , sign[0] , p0[25:2] , (p0[1] ^ (p0[0] & sign[0])) , p0[0] ^ sign[0]}  ;
assign rpp1 = {2'b11 , ~sign[1] , p1[25:2] , (p1[1] ^ (p1[0] & sign[1])) , p1[0] ^ sign[1] , p0[0] & p0[1] & sign[0]};	
assign rpp2 = {2'b11 , ~sign[2] , p2[25:2] , (p2[1] ^ (p2[0] & sign[2])) , p2[0] ^ sign[2] , p1[0] & p1[1] & sign[1]};
assign rpp3 = {2'b11 , ~sign[3] , p3[25:2] , (p3[1] ^ (p3[0] & sign[3])) , p3[0] ^ sign[3] , p2[0] & p2[1] & sign[2]};
assign rpp4 = {2'b11 , ~sign[4] , p4[25:2] , (p4[1] ^ (p4[0] & sign[4])) , p4[0] ^ sign[4] , p3[0] & p3[1] & sign[3]};
assign rpp5 = {2'b11 , ~sign[5] , p5[25:2] , (p5[1] ^ (p5[0] & sign[5])) , p5[0] ^ sign[5] , p4[0] & p4[1] & sign[4]};
assign rpp6 = {2'b11 , ~sign[6] , p6[25:2] , (p6[1] ^ (p6[0] & sign[6])) , p6[0] ^ sign[6] , p5[0] & p5[1] & sign[5]};
assign rpp7 = {~sign[7] , p7[25:2] ,(p7[1] ^ (p7[0] & sign[7])) , p7[0] ^ sign[7] , p6[0] & p6[1] & sign[6]};
assign rpp8 = {p8[23:0] , p7[0] & p7[1] & sign[7]};


endmodule
