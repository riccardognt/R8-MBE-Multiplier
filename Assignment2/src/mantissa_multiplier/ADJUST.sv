//create the tree

module ADJUST (
	input logic [29:0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,
	input logic [27:0] pp7,
	input logic [24:0] pp8,
	output logic [47:0] Adjusted_pp0,
	output logic [45:0] Adjusted_pp1,
	output logic [41:0] Adjusted_pp2,
	output logic [35:0] Adjusted_pp3,
	output logic [29:0] Adjusted_pp4,
	output logic [23:0] Adjusted_pp5,
	output logic [17:0] Adjusted_pp6,
	output logic [11:0] Adjusted_pp7,
	output logic [6:0] Adjusted_pp8
);
	


assign Adjusted_pp0 = {pp7[27],pp6[29:27],pp5[29:27],pp4[29:27],pp3[29:27],pp2[29:27],pp1[29:28],pp0};
assign Adjusted_pp1 = {pp8[24],pp7[26:24],pp6[26:24],pp5[26:24],pp4[26:24],pp3[26:24],pp2[26:25],pp1[27:0]};
assign Adjusted_pp2 = {pp8[23:21],pp7[23:21],pp6[23:21],pp5[23:21],pp4[23:21],pp3[23:22],pp2[24:0]};
assign Adjusted_pp3 = {pp8[20:18],pp7[20:18],pp6[20:18],pp5[20:18],pp4[20:19],pp3[21:0]};
assign Adjusted_pp4 = {pp8[17:15],pp7[17:15],pp6[17:15],pp5[17:16],pp4[18:0]};
assign Adjusted_pp5 = {pp8[14:12],pp7[14:12],pp6[14:13],pp5[15:0]};
assign Adjusted_pp6 = {pp8[11:9],pp7[11:10],pp6[12:0]};
assign Adjusted_pp7 = {pp8[8:7],pp7[9:0]};
assign Adjusted_pp8 = {pp8[6:0]};

	
endmodule









