module register_file(
	input logic clk, write_enable,
	input logic[4:0] read_address1, read_address2, write_address,
	input logic[31:0] write_data,
	output logic[31:0] read_data1, read_data2
    );

	//32 bit registers which are 32 in number in a register file
	logic[31:0] rf[31:0];
	
		//write operation(synchronous)
	always_ff @(posedge clk) begin
	if (write_enable)
		rf[write_address] <= write_data;
    end		
    
	//read operation(asynchronous)
//	assign read_data1 = rf[read_address1];
//	assign read_data2 = rf[read_address2];
	assign read_data1 = (read_address1 != 0) ? rf[read_address1] : 0;
    assign read_data2 = (read_address2 != 0) ? rf[read_address2] : 0;
	


endmodule
//
//module regfile (
//    input clk,
//    input we3,
//    input [4:0] ra1, ra2, wa3,
//    input [31:0] wd3,
//    output [31:0] rd1, rd2
//);
//
//    // Register file declaration: 32 registers, 32 bits each
//    reg [31:0] rf [31:0];
//
//    // Write port: write to the register file on the rising edge of the clock
//    always @(posedge clk) begin
//        if (we3) begin
//            rf[wa3] <= wd3;
//        end
//    end
//
//    // Read ports: read combinationally
//    assign rd1 = (ra1 != 5'b0) ? rf[ra1] : 32'b0; // Register 0 hardwired to 0
//    assign rd2 = (ra2 != 5'b0) ? rf[ra2] : 32'b0; // Register 0 hardwired to 0
//
//endmodule
//
