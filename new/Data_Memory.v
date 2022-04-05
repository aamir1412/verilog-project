`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/05 15:45:19
// Design Name: 
// Module Name: Data_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Data_Memory (clock, enable_write, enable_read, ram_addr, write_data, read_data);
    input wire clock, enable_write, enable_read;
    input wire [7:0] ram_addr;
    input wire [7:0] write_data;
    output reg [7:0] read_data;

    reg [7:0] ram[255:0];
    
    initial begin
    $readmemb("../data/instruction_memory_code.data",ins_addr);    
    end
    
    always@(posedge clock)
    begin
        if(enable_write)
            ram[ram_addr] <= write_data;
        if(enable_read)
            read_data = ram[ram_addr];
    end
endmodule
