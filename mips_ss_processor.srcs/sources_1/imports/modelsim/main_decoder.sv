//module main_decoder(
//	input logic[5:0] opcode,
//	output logic memtoreg, memwrite, branch, alusrc,
//	output logic regdst, regwrite, jump,
//	output logic[1:0] ALUOp
//);
//
//	logic[8:0] control;
//	assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUOp} = control;
//
//	always_comb
//	  case (opcode)
//	    6'b000000: control <= 9'b110000010; // rtype
//	    6'b100011: control <= 9'b101001000; // lw
//	    6'b101011: control <= 9'b001010000; // sw
//	    6'b000100: control <= 9'b000100001; // branch if equal
//            6'b001000: control <= 9'b101000000; // addi
//	    6'b000010: control <= 9'b000000100; // j
//	    default:   control <= 9'b000000000; 
//	  endcase
//
//	
//endmodule

module main_decoder(
    input logic [5:0] opcode,
    output logic memtoreg, memwrite, branch, alusrc,
    output logic regdst, regwrite, jump,
    output logic [1:0] ALUOp
);

    logic [8:0] control;

    always_comb begin
        case (opcode)
            6'b000000: control = 9'b110000010; // rtype
            6'b100011: control = 9'b101001000; // lw
            6'b101011: control = 9'b001010000; // sw
            6'b000100: control = 9'b000100001; // branch if equal
            6'b001000: control = 9'b101000000; // addi
            6'b000010: control = 9'b000000100; // j
            default:   control = 9'b000000000;
        endcase

        // Unpack control signals into outputs
        {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUOp} = control;
    end

endmodule

			
	
		 
		 
