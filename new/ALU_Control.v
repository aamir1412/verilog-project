`timescale 1ns / 1ps
 
module ALUControl(function_input, alu_op, alu_control);  
    input [2:0] function_input;
    input [1:0] alu_op;  
    output reg[2:0] alu_control;
    wire [4:0] alu_control_in;  
    assign alu_control_in = {alu_op, function_input};  
    always @(alu_control_in)  
    casex (alu_control_in)  
        5'b00xxx: alu_control = 3'b001;  
        5'b01xxx: alu_control = 3'b010;  
        5'b10000: alu_control = 3'b001;  
        5'b10010: alu_control = 3'b010;  
    default: alu_control = 3'b000;  
  endcase
endmodule