module ALU_decoder(
	input logic[1:0] ALUOp,
	input logic[5:0] funct,
	output logic[2:0] ALUCtrl
);

	always_comb
	  case (ALUOp)
	      2'b00: ALUCtrl <= 3'b010; //so the ALU performs add for lw and sw
	      2'b01: ALUCtrl <= 3'b110; //so the ALU performs subtraction for branch on equal evaluation
	      default : case (funct)	// for r-type instructions which have the same ALUOp
		   6'b100000: ALUCtrl <= 3'b010; //add
		   6'b100010: ALUCtrl <= 3'b110; // sub
		   6'b100100: ALUCtrl <= 3'b000; // and
		   6'b100101: ALUCtrl <= 3'b001; // or
		   6'b101010: ALUCtrl <= 3'b111; // slt
		   default:   ALUCtrl <= 3'b000; 
	      endcase
	   endcase
endmodule
