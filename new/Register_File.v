`timescale 1ns / 1ps

module Register_File(clock, reset, read_register1, read_register2, write_enable, write_register, write_data, read_data1, read_data2);
    input clock;
    input reset;
    input read_register1;
    input read_register2;
    input write_enable;
    input write_register;
    input [7:0] write_data;
    output [7:0] read_data1;
    output [7:0] read_data2;

    reg [7:0] register [0:1];
    assign read_data1 = register[read_register1];
    assign read_data2 = register[read_register2];
    
    always @(posedge clock)
        begin  
        if (reset)
            begin
            register[0]<=8'b0;
            register[1]<=8'b0;
            end
        else if (write_enable)
                register[write_register] <= write_data;  
        end   
        
endmodule