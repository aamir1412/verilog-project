
`timescale 1ps/1ps

`include "../design/ProcessorMain.v"

module processor_tb;
    reg clock, reset;
    wire [7:0] pcin, pcout, instruction, read_data1, read_data2, alu_out;
    wire reg_dst, jump, branch, reg_write,  mem_read, mem_to_reg, mem_write, ALU_src ;
    wire [1:0] alu_op;
    wire [2:0] alu_control;
    ProcessorMain simulate_tb(
        .clock(clock),
        .reset(reset),
        .pcin(pcin), 
        .pcout(pcout), 
        .instruction(instruction), 
        .read_data1(read_data1), 
        .read_data2(read_data2), 
        .alu_out(alu_out),
        .reg_dst(reg_dst), 
        .jump(jump), 
        .branch(branch), 
        .reg_write(reg_write),  
        .mem_read(mem_read), 
        .mem_to_reg(mem_to_reg), 
        .mem_write(mem_write), 
        .ALU_src(ALU_src)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, processor_tb);
        clock = 1;
        reset = 1;
        #10;
        #10 clock = ~clock;
        #10 clock = ~clock;
        #10 clock = ~clock;
        #10 clock = ~clock;
        #10 clock = ~clock;
        #10 clock = ~clock; 
    end
endmodule
