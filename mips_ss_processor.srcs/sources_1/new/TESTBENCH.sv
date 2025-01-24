`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 11:03:49 AM
// Design Name: 
// Module Name: TESTBENCH
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TESTBENCH();

    logic CLOCK;
    logic RESET;
    
    logic [31:0] write_data, data_address;
    logic memwrite;
    
    //instantiating module to be tested(TOP_LEVEL)
    top DUT(CLOCK, RESET, write_data, data_address, memwrite);
    
   //TEST
    // Generate reset for first two clock cycles 
    initial begin
        RESET <= 1;
        //# 22;
        # 22;
        RESET <= 0;
    end
    
    // Generate clock to sequence test
    always begin 
        CLOCK <= 1;
        # 5;
        CLOCK <= 0;
        # 5;
    end
    
    // Check for result
    always @(negedge CLOCK)
        begin
            if (memwrite) begin 
                if (data_address === 84  &  write_data === 7) begin
                    $display("Simulation succeeded");
                    //$stop;
                    $finish;
                end
                else if(data_address !== 80) begin 
                    $display("Simulation failed");
                    //$stop;
                    $finish; 
                end
            end
        end                                                        
endmodule
