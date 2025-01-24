// ALU with zero output functionality
module ALU#(parameter width = 32)(
	input logic[width-1:0] A,B,
	input logic[2:0] ALUCtrl,
	output logic[width-1:0] Y,
	output logic Zero
);

	logic[width-1:0] BB;
	logic[width-1:0] adder2_output;
	logic Cout;

	mux2#(32) BBmux(
		.a(B), 
		.b(~B), 
		.s(ALUCtrl[2]), 
		.c(BB)
	);

	adder2#(32) adder_2(
		.a(BB), 
		.b(A), 
		.carry_in(ALUCtrl[2]), 
		.y(adder2_output), 
		.carry_out(Cout)
	);

	mux4#(32) output_mux(
		.a(A & BB), 
		.b(A | BB), 
		.c(adder2_output),
		.d({ {(width-1){1'b0}}, adder2_output[width-1]}), 
		.s(ALUCtrl[1:0]), 
		.e(Y)
	);

	assign Zero = (Y == {width{1'b0}});    // High if Y is all zeros

endmodule