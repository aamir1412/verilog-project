
module Register_File(clock, reset, read_register1, read_register2, write_enable, write_register, write_data, regfile, read_data1, read_data2);
    input clock;
    input reset;
    input read_register1;
    input read_register2;
    input write_enable;
    input write_register;
    input [7:0] write_data;
    output [7:0] read_data1;
    output [7:0] read_data2;

    reg [7:0] regfile [0:1];
    assign read_data1 = regfile[read_register1];
    assign read_data2 = regfile[read_register2];

    always @(posedge clock)
        begin
            if (write_enable == 1)
                regfile[write_register] <= write_data;
            else if (reset == 1)
                begin
                    regfile[0] <= 8'b00000000;
                    regfile[1] <= 8'b00000000;
                end
        end
endmodule
