`timescale 1ns / 1ps


module jump(
    jump_op, jump_addr, jump_j
    );
    input [2:0] jump_op;
    input [4:0] jump_addr;
    output reg [7:0] jump_j;
    
    always@(*)
    begin
        assign jump_j[7:0] = {jump_op[2:0], jump_addr[4:0]};
    end
    
    
endmodule
