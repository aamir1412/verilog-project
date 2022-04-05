module Data_Memory (clock, address, mem_read, mem_write, write_data, read_data);
    input clock;
    input [7:0] address;
    input [7:0] write_data;
    input mem_read;
    input mem_write;
    output reg [7:0] read_data;
    reg [7:0] RAM [255:0];
    always@(posedge clock)
        begin
            if(mem_write)
                RAM[address] <= write_data;
            else if(mem_read)
                read_data = RAM[address];
        end
endmodule