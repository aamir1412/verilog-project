`timescale 1ns / 1ps
`include "../design/Data_Memory.v" 

module Data_Memory_tb;
    reg clock, enable_write;
    reg [7:0] write_addr, read_addr;
    reg [7:0] write_data;
    wire [7:0] read_data;
        
    Data_Memory uut(clock, enable_write, write_addr, read_addr,write_data, read_data);
    
    always #5 clock = ~clock;
    initial 
        begin
			$dumpfile("vcd/Data_Memory_dump.vcd");
			$dumpvars(0, Data_Memory_tb);

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
   