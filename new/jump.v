`timescale 1ns / 1ps


module jump(
    jump_op, jump_addr, jump_j
    );
    input [4:0] jump_addr;
    output reg [7:0] jump_j;
    
    always@(*)
    begin
        assign jump_j[7:0] = {3'b000, jump_addr[4:0]};
    end
    
    
endmodule
