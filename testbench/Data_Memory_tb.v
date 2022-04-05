`timescale 1ps/1ps
`include "../design/Data_Memory.v" 

module Data_Memory_tb;
    reg clock;
    reg [7:0] address;
    reg [7:0] write_data;
    reg mem_read;
    reg mem_write;
    wire [7:0] read_data;
    Data_Memory uut(.clock(clock), .address(address), .mem_read(mem_read), .mem_write(mem_write), .write_data(write_data), .read_data(read_data));    

    initial 
        begin
			$dumpfile("vcd/Data_Memory_dump.vcd");
			$dumpvars(0, Data_Memory_tb);

            #1
            mem_write = 1;
            mem_read = 0;
            address = 8'b00000000;
            write_data = 8'b00001000;
            clock = 1;

            #5;
            clock = 0;

            #5;
            mem_read = 1;
            mem_write = 0;
            address = 8'b00000000;
            clock = 1;
            #5;

        end
endmodule
   