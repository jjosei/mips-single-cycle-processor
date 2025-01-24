module control_unit(
	input logic[5:0] opcode, funct,
	output logic Mem2Reg, memwrite,
	output logic ALUSrc,
	output logic RegDest, RegWrite,
	output logic Jump, Branch,
	output logic[2:0] ALUCtrl
);

	logic [1:0] ALUOp;

	main_decoder md(opcode, Mem2Reg, memwrite, Branch, ALUSrc, RegDest, RegWrite, Jump, ALUOp);

	ALU_decoder ad(ALUOp, funct, ALUCtrl);

	//assign PCSrc = branch & zero;
endmodule
