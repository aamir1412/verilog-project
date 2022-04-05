`timescale 1ns / 1ps


module pc_adder(
    add_pc, pc_add
    ); 
    input [7:0] add_pc;
    output [7:0] pc_add;
    
    always@(*)
    begin
    assign pc_add = add_pc + 1;
    end
endmodule
