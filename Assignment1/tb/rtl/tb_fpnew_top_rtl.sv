module tb_fpnew_top ();
	parameter tclk = 10;
	parameter n_tot_op = 1000 ;
	int n_op = 0;

   parameter fpnew_pkg::fpu_features_t       Features       = fpnew_pkg::RV32F;
   parameter fpnew_pkg::fpu_implementation_t Implementation = fpnew_pkg::ISA_PIPE;
   parameter type                            TagType        = logic;
   localparam int unsigned WIDTH        = Features.Width;
   localparam int unsigned NUM_OPERANDS = 3;
   localparam int unsigned mant_width=23, exp_width=8;
   
   wire clk_i;
   wire rst_ni;
   wire [NUM_OPERANDS-1:0][WIDTH-1:0] operands_i;
   var fpnew_pkg::roundmode_e rnd_mode_i;
   var fpnew_pkg::operation_e op_i;
   var logic op_mod_i;
   var fpnew_pkg::fp_format_e src_fmt_i;
   var fpnew_pkg::fp_format_e dst_fmt_i;
   var fpnew_pkg::int_format_e int_fmt_i;
   var logic vectorial_op_i;
   var TagType tag_i;
   wire in_valid_i;
   wire in_ready_o;
   var logic flush_i;
   wire [WIDTH-1:0] result_o;
   var fpnew_pkg::status_t status_o;
   wire tag_o;
   wire out_valid_o;
   var logic out_ready_i;
   wire busy_o;
   wire end_sim;

   assign rnd_mode_i = fpnew_pkg::RNE; // ASSEGNI ALLA TOP ENTITY LA ROUND MODE "ROUND TO NEAREST EVEN"
   assign op_i = fpnew_pkg::MUL; // ASSEGNI ALLA TOP ENTITY L'OPERAZIONE --> FACCIAMO FARE LA MOLTIPLICAZIONE
   assign src_fmt_i = fpnew_pkg::FP32; // FA CAPIRE CHE GLI OPERANDI SONO SPECIFICATI NELLO STANDARD "IEE binary32"--> 8 BIT EXP, 23 BIT MANT
   assign dst_fmt_i = fpnew_pkg::FP32; // ""...RISULTATO
   assign int_fmt_i = fpnew_pkg::INT32; // INTEGER FORMAT OF 32 BIT
   assign vectorial_op_i = 0;
   assign tag_i = 0; // TAG ASSIGNED TO STATIC VALUE --> DISABLED
   assign flush_i = 0;
   assign op_mod_i = 0;
   assign out_ready_i = out_valid_o;
      		     
   clk_gen CG(.END_SIM(end_sim),
              .CLK(clk_i),
              .RST_n(rst_ni));

   data_gen DG(.CLK(clk_i),
	       .RST_n(rst_ni),
	       .D0(operands_i[0]),
	       .D1(operands_i[1]),
	       .D2(operands_i[2]),
	       .RDY(in_ready_o),
	       .VOUT(in_valid_i),
	       .END_SIM(end_sim));  		    
	       
   fpnew_top UUT(
                 .clk_i,
                 .rst_ni,
		 .operands_i(operands_i),
		 .rnd_mode_i,
		 .op_i,
		 .op_mod_i,
		 .src_fmt_i,
		 .dst_fmt_i,
		 .int_fmt_i,
		 .vectorial_op_i,
		 .tag_i,
		 .in_valid_i,
		 .in_ready_o,
		 .flush_i,
		 .result_o,
		 .status_o,
		 .tag_o,
		 .out_valid_o,
		 .out_ready_i,
		 .busy_o);

	data_sink_FPU DS(
		.CLK(clk_i),
		.RST_n(rst_ni),
		.VIN(out_valid_o),
		.DIN(result_o));


   
endmodule
   
