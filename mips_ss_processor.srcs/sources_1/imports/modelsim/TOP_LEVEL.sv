// This top level is tailored for the adhoc testing where 
// we will store a value(write_data) in data memory(data_address)
module top(
	input logic CLOCK, RESET,
	output logic [31:0] write_data, data_address,  //ALUOut == data_address, data to be written into DM = write_data
	output logic memwrite
);

	logic [31:0] PC, instruction, read_data;

	// instantiate processor and memories
	instruction_memory imem(PC[7:2], instruction);

	mips mips(CLOCK, RESET, instruction, read_data, PC, memwrite, data_address, write_data);

	data_memory dmem(CLOCK, memwrite, data_address, write_data, read_data);
endmodule