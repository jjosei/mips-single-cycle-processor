module mux4 #(parameter width)(
	input logic[width-1 : 0] a,
	input logic[width-1 : 0] b,
	input logic[width-1 : 0] c,
	input logic[width-1 : 0] d,
	input logic[1:0] s,
	output logic[width-1 : 0] e 
);

	always_comb begin
	   case(s)
		2'b00 : e = a;
		2'b01 : e = b;
		2'b10 : e = c;
		2'b11 : e = d;
		default : e = 2'b00;
	   endcase
	end
//	if (s == "00")
//	   e <= a;
//	else if (s == "01")
//	   e <= b;
//	else if (s == "01")
//	   e <= c;
//	else
//	   e <= d;
endmodule