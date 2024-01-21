`timescale 1ns/1ns

module multiplier_tb();

parameter Tclk = 10;
parameter Tp = 2;
parameter n_tot_op = 20 ;
int n_op = 0;
localparam int unsigned NBITS = 24;

logic [NBITS-1 : 0] A_tb;
logic [NBITS-1 : 0] B_tb;
logic [2*NBITS-1 : 0] product_tb;
logic clk;

mantissa_multiplier dut (A_tb, B_tb, product_tb);

always@(posedge clk) begin
	gen_inputs(A_tb, B_tb);
	n_op = n_op +1;
	#Tp;
	results_check(A_tb, B_tb, product_tb); 
	if (n_op == n_tot_op) begin
		$write("[T=%0t] simulation ended by reaching max number of tests %0d", $time, n_tot_op);
		$stop;
	end  
end 

always #(Tclk/2) clk = ~clk;

initial begin
    clk = 1'b1;
end

endmodule

class Packet;
	rand bit [22:0] a;
	rand bit [22:0] b;
endclass

task gen_inputs;
	output logic [23 : 0] gen_a, gen_b;

	Packet item;
	logic status;
	
	item = new();
	status = item.randomize();

	if(status) begin
		gen_a =  {1'b1,item.a};
		gen_b =  {1'b1,item.b};
		$write("[T=%0t] operation to be done is: %0d * %0d \t ", $time, gen_a, gen_b);
	end else begin
		$write("[T=%0t] Bad generation of inputs, status is : %b\n \n \n \n \n", $time, status);
		$stop;	
	end
endtask

task results_check;
	input [23 : 0] a, b;
	input  [47 : 0] product_res;

	logic [47 : 0] correct_result;
	
	correct_result = unsigned'(a) * unsigned'(b);
	if(correct_result == product_res) begin
		$write("[%0t] OK, the result produced is correct\n",$time);
		$write("the theoretical result is : %0d \n", correct_result);
		$write("the actual result is : %0d \n", product_res);
	end else begin
		$write("[%0t] Wrong result\n", $time);
		$write("the theoretical result is : %0d \n", correct_result);
		$write("the actual result is : %0d \n", product_res);
		$stop;
	end
endtask
			


