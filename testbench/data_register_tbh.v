`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2022 08:48:13 PM
// Design Name: 
// Module Name: DRAM_thb
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

module data_register(
    input wire clock, enable_write,
    input wire [7:0] write_addr, read_addr,
    input wire [7:0] write_data,
    output wire [7:0] read_data
    );
    //Register Bit capacity and Data Register Size declaration 
    reg [7:0] register[255:0];
    
    always@(posedge clock)
    if(enable_write)
        register[write_addr] <= write_data;
    assign read_data = register [read_addr];
endmodule

module data_register_tbh;
    reg clock, enable_write;
    reg [255:0] write_addr, read_addr;
    reg [7:0] write_data;
    wire [7:0] read_data;
    
    data_register uut(clock, enable_write, write_addr, read_addr,write_data, read_data);
    always #5 clock = ~clock;
    initial 
        begin
            clock = 0;
            enable_write = 1;
            write_addr = 8'b00000000;
            write_data = 8'b100;
            
            #20;
            write_addr = 8'b00000001;
            write_data = 8'b101;
            
            #20;
            write_addr = 8'b00000010;
            write_data = 8'b110;
            
            enable_write = 0;   
            
            #20;
            read_addr = 0;
            
            #20;
            read_addr = 1;
        end
endmodule
