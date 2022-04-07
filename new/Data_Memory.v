`timescale 1ns / 1ps


module Data_Memory ( enable_write, enable_read, ram_addr, write_data, read_data);
    input wire enable_write, enable_read;
    input wire [7:0] ram_addr;
    input wire [7:0] write_data;
    output reg [7:0] read_data;

    reg [7:0] ram[255:0];
    //initial begin		          
        //ram[0]= 8'b01001000;
        //ram[1]= 8'b00001000;                          
    //end  
    initial begin		          
          $readmemb("Ram.mem",ram);                         
    end
    
    always@(*)
    begin
        if(enable_write)
            ram[ram_addr] <= write_data;
        else if(enable_read)
            read_data <= ram[ram_addr];
    end
endmodule
