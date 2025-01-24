module instruction_memory(
	input logic [5:0] address,
	output logic [31:0] rd
);
	
	logic [31:0] RAM[63:0];

	initial
		$readmemh("memfile.dat", RAM);
		//$readmemh("C:/Users/JESSE OSEI-SARFOH/vivado_projects/mips_ss_processor/memfile.dat", RAM);
	
	assign rd = RAM[address]; // word aligned
endmodule
