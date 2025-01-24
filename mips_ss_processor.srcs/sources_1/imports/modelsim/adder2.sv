module adder2 #(parameter WIDTH)(
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,
    input logic carry_in,
    output logic [WIDTH-1:0] y,
    output logic carry_out
    );

    logic [WIDTH:0] sum; // Temporary variable to hold the sum including carry

    // Perform addition with carry-in and carry-out
    assign sum = {1'b0, a} + {1'b0, b} + carry_in;
    assign y = sum[WIDTH-1:0];  // Lower WIDTH bits as the result
    assign carry_out = sum[WIDTH]; // MSB as carry-out

endmodule
