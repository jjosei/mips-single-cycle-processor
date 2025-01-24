module datapath(
	input logic clock, reset,
	input logic Mem2Reg,
	input logic RegWrite, Jump, Branch,
	input logic ALUSrc, RegDest,
	input logic[2:0] ALUCtrl,
	input logic[31:0] instruction, read_data,	
	output logic[31:0] PC, ALUOut, write_data
	);

	logic PCSrc, Zero;
	logic[31:0] pcnext, pcnextbr;
	logic[31:0] signext_output, shifter_output;
	logic[31:0] PCplus4, PCBranch;
	logic[31:0] ALUSrcA, ALUSrcB;
	logic[4:0] reg_dest_address;
	logic[31:0] Result;

	// logic for next PC
	mux2#(32) mux_1(PCplus4, PCBranch, PCSrc, pcnextbr); 
	mux2#(32) mux_2(pcnextbr,  {PCplus4[31:28],instruction[25:0] , 2'b00}, Jump, pcnext);  	// logic for jump
	resettable_flipflop#(32) ff(reset, clock, pcnext, PC);
	adder nextpc_adder(PC, 32'd4, PCplus4);
	sl2 shift_left2(signext_output, shifter_output);
	adder branch_adder(shifter_output, PCplus4, PCBranch);

	// logic for register file operation
	register_file reg_file(clock, RegWrite, instruction[25:21], instruction[20:16], reg_dest_address, Result, ALUSrcA, write_data);
	mux2#(5) regdstaddr_mux(instruction[20:16], instruction[15:11], RegDest, reg_dest_address);	
	mux2#(32) regdstdata_mux(ALUOut, read_data, Mem2Reg, Result);
	sign_extend sign_ext(instruction[15:0], signext_output);

	// logic for ALU
	mux2#(32) alusrc_mux(write_data, signext_output, ALUSrc, ALUSrcB);

	ALU#(32) alu(ALUSrcA, ALUSrcB, ALUCtrl, ALUOut, Zero);




	assign PCSrc = Branch & Zero;




endmodule