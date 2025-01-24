module mips(
	input logic clock, reset,
	input logic[31:0] instruction,
	input logic[31:0] read_data,   //IM
	output logic[31:0] PC,
	output logic memwrite,
	output logic[31:0] ALUOut, write_data	
    );
	 
	logic RegDest, ALUSrc, RegWrite, Mem2Reg, Jump, Branch;
	logic[2:0] ALUCtrl;
	
	control_unit c(instruction[31:26],
		 instruction[5:0],		
		 Mem2Reg,
		 memwrite,		 
		 ALUSrc,
		 RegDest, 
		 RegWrite,
		 Jump,
	     Branch,
		 ALUCtrl);


 	datapath dp(clock,
			reset, 
			Mem2Reg,
			RegWrite,
			Jump,
			Branch,
			ALUSrc,
			RegDest,
			ALUCtrl,
			instruction,
			read_data,
			PC,
			ALUOut,  //IM
			write_data);  //IM 

endmodule
