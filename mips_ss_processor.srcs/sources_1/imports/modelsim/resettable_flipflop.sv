//////////////////////////////////////////////////////////////////////////////////
module resettable_flipflop #(parameter width = 32)(
    input logic reset,
    input logic clk,
    input logic[width-1:0] d,
    output logic[width-1:0] q
    );

	always_ff @(posedge clk, posedge reset) 
		if (reset)
         	   q = 0;
		else
		   q = d;
			

endmodule
