module mux2 #(parameter width)(
	input logic[width-1 : 0] a,
	input logic[width-1 : 0] b,
	input logic s,
	output logic[width-1 : 0] c
);
	assign c = s ? b : a;

endmodule