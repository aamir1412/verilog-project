`timescale 1ns / 1ps

module Data_Register(
    clock, enable_write, write_addr, read_addr, write_data, read_data_1, read_data_2
    );

    input wire clock, enable_write;
    input wire [7:0] write_addr, read_addr;
    input wire [7:0] write_data;
    output wire [7:0] read_data_1;
    output wire [7:0] read_data_1;

    //Register Bit capacity and Data Register Size declaration 
    reg [7:0] register[255:0];

    always@(posedge clock)
        if(enable_write)
            register[write_addr] <= write_data;
    assign read_data = register[read_addr];

endmodule
