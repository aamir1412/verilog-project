`timescale 1ps/1ps
`include "../design/MUX.v"

module MUX_tb();
    reg [7:0] input_1;
    reg [7:0] input_2;
    reg select_mux;
    wire reg [7:0] output_mux;
    MUX m1(.input_1(input_1), .input_2(input_2), .select_mux(select_mux), .output_mux(output_mux));
    initial
		begin
			$dumpfile("vcd/MUX_dump.vcd");
			$dumpvars(0, MUX_tb);
            #1;
            input_1 = 8'b01100111;
            input_2 = 8'b01100000;
            select_mux = 0;
            #5;	
            select_mux = 1;
            #5;
        end
endmodule

