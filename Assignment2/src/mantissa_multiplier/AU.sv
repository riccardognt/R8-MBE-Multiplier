//ADDER UNIT: TOP ENTITY FOR SUM



//module definition
module AU (

	input logic [25:0] PP0,PP1,PP2,PP3,PP4,PP5,PP6,PP7,
	input logic [23:0] PP8,
	input logic [7:0] PP_sign,
	output logic [47:0] res
);

//definitions
logic [29:0] ru_out0, ru_out1, ru_out2, ru_out3, ru_out4, ru_out5, ru_out6;
logic [27:0] ru_out7;
logic [24:0] ru_out8;

logic [47:0] ad_out0, s1_out0, s2_out0;
logic [45:0] ad_out1, s1_out1, s2_out1;
logic [41:0] ad_out2, s1_out2, s2_out2;
logic [36:0] s2_out3;
logic [35:0] ad_out3, s1_out3;
logic [29:0] ad_out4, s1_out4;
logic [23:0] ad_out5, s1_out5;
logic [17:0] ad_out6, s1_out6;
logic [11:0] ad_out7;
logic [12:0] s1_out7;
logic [6:0] ad_out8;
logic [47:0] s3_out0, s3_out1;
logic [47:0] fin_res;
	
//submodules definition and connections

//regularize the partial products
PPRU   RU (	.sign(PP_sign), .p0(PP0), .p1(PP1), .p2(PP2), .p3(PP3), .p4(PP4), .p5(PP5), .p6(PP6), .p7(PP7), .p8(PP8),
		.rpp0(ru_out0), .rpp1(ru_out1), .rpp2(ru_out2), .rpp3(ru_out3), .rpp4(ru_out4), .rpp5(ru_out5), .rpp6(ru_out6), .rpp7(ru_out7), .rpp8(ru_out8));

//create the tree
ADJUST AD (	.pp0(ru_out0), .pp1(ru_out1), .pp2(ru_out2), .pp3(ru_out3), .pp4(ru_out4), .pp5(ru_out5), .pp6(ru_out6), .pp7(ru_out7), .pp8(ru_out8),
		.Adjusted_pp0(ad_out0), .Adjusted_pp1(ad_out1), .Adjusted_pp2(ad_out2), .Adjusted_pp3(ad_out3), .Adjusted_pp4(ad_out4), .Adjusted_pp5(ad_out5), .Adjusted_pp6(ad_out6), 
		.Adjusted_pp7(ad_out7), .Adjusted_pp8(ad_out8) );

//DADDA tree processing
DADDA_STAGE1 S1 (	.in_row0(ad_out0), .in_row1(ad_out1), .in_row2(ad_out2), .in_row3(ad_out3), .in_row4(ad_out4), .in_row5(ad_out5), .in_row6(ad_out6), .in_row7(ad_out7), .in_row8(ad_out8), 
			.out_row0(s1_out0), .out_row1(s1_out1), .out_row2(s1_out2), .out_row3(s1_out3), .out_row4(s1_out4), .out_row5(s1_out5), .out_row6(s1_out6), .out_row7(s1_out7));

DADDA_STAGE2 S2 (	.in_row0(s1_out0), .in_row1(s1_out1), .in_row2(s1_out2), .in_row3(s1_out3), .in_row4(s1_out4), .in_row5(s1_out5), .in_row6(s1_out6), .in_row7(s1_out7), 
			.out_row0(s2_out0), .out_row1(s2_out1), .out_row2(s2_out2), .out_row3(s2_out3));

DADDA_STAGE3 S3 (	.in_row0(s2_out0), .in_row1(s2_out1), .in_row2(s2_out2), .in_row3(s2_out3), .out_row0(s3_out0), .out_row1(s3_out1));

FINAL_ADDER FADD (s3_out0, s3_out1, fin_res);


assign res = fin_res;


endmodule
