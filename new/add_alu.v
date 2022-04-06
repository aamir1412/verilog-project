`timescale 1ns / 1ps


module add_alu(
    in_add, out_add_alu
    );
    input [7:0] in_add;
    output reg [7:0] out_add_alu;
    
    always@(*)
    begin
    assign out_add_alu = in_add - 1;
    end
endmodule
