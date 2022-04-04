module ALU_model(opperand_1, opperand_2, opcode, alu_out);
    input [3:0] opperand_1, opperand_2;
    input [2:0] opcode;
    output reg [3:0] alu_out;
    always @(*) begin
        case (opcode)
            3'b000 : alu_out = 0;
            3'b001 : alu_out = opperand_1 + opperand_2;
            3'b010 : alu_out = opperand_1 - opperand_2;
            3'b011 : alu_out = opperand_1 & opperand_2;
            3'b100 : alu_out = opperand_1 | opperand_2;
            3'b101 : alu_out = ~ opperand_1;
            3'b110 : alu_out = ~ opperand_2;
            3'b111 : alu_out = 0;
            default : alu_out = 0;
        endcase
    end
endmodule 