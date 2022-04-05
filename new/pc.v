`timescale 1ns / 1ps


module pc(
    clock, reset,out_pc, in_pc
    );
    input clock, reset;
    input [7:0] in_pc ;
    output reg [7:0] out_pc;
    
    always@(posedge clock or posedge reset)
    begin
    if(~reset) out_pc<=8'd00000000;
    else out_pc <= in_pc;
    end
endmodule

