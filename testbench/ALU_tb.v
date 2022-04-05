`timescale 1ps/1ps
`include "../design/ALU.v"

module ALU_tb();
    reg[7:0] operand_test_1, opperand_test_2;
    reg[2:0] op_test_code;
    wire[7:0] alu_test_out;
    ALU alu (.opperand_1(operand_test_1), .opperand_2(opperand_test_2), .opcode(op_test_code), .alu_out(alu_test_out));
    initial begin
        $dumpfile("vcd/ALU_dump.vcd");
        $dumpvars(0, ALU_tb);
        op_test_code = 3'b000;
        operand_test_1 = 8'b0000011;
        opperand_test_2 = 8'b0000001;
        #5;
        op_test_code = 3'b001;
        operand_test_1 = 8'b0000011;
        opperand_test_2 = 8'b0000001;      
        #5;
        op_test_code = 3'b010;
        operand_test_1 = 8'b0000011;
        opperand_test_2 = 8'b0000001;
        #5;
        op_test_code = 3'b011;
        operand_test_1 = 8'b0000011;
        opperand_test_2 = 8'b0000001;
    end
endmodule