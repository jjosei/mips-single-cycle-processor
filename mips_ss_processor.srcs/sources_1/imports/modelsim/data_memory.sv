module data_memory(
	input logic clock, write_enable,
	input logic[31:0] address, input_data,
	output logic[31:0] output_data
);

	logic[31:0] RAM[63:0];

	always_comb
		output_data = RAM[address[31:2]]; //[31:2] to ensure word alignment

	always_ff @(posedge clock)
		if (write_enable)
			RAM[address[31:2]] <= input_data;

endmodule

	
