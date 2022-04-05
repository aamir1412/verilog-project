`timescale 1ps/1ps
`include "../design/ALU.v"

module ALU_tb;
    reg[3:0] operand_test_1, opperand_test_2;
    reg[2:0] op_test_code;
    wire[3:0] alu_test_out;
    ALU_model alu_model(.opperand_1(operand_test_1), .opperand_2(opperand_test_2), .opcode(op_test_code), .alu_out(alu_test_out));
    initial begin
        $dumpfile("vcd/ALU_dump.vcd");
        $dumpvars(0, ALU_tb);
        op_test_code = 3'b000;
        operand_test_1 = 4'b0011;
        opperand_test_2 = 4'b0001;
        #20;
        op_test_code = 3'b001;
        operand_test_1 = 4'b0011;
        opperand_test_2 = 4'b0001;
        #20;
        op_test_code = 3'b010;
        operand_test_1 = 4'b0011;
        opperand_test_2 = 4'b0001;
        #20;
        op_test_code = 3'b011;
        operand_test_1 = 4'b0011;
        opperand_test_2 = 4'b0001;
    end
endmodule