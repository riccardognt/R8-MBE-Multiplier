module half_adder (
  input logic     a,
  input logic     b,
  output logic    s,
  output logic    c_o
);


  assign s = a ^ b;
  assign c_o = a && b;
	
endmodule
