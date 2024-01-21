
module full_adder (
  input logic     a,
  input logic     b,
  input logic     c_in,
  output logic    s,
  output logic    c_o
);


  assign s = a ^ b ^ c_in;
  assign c_o = (a & b) | (a & c_in) | (b & c_in);
	
endmodule
