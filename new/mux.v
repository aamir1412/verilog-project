`timescale 1ns / 1ps


module mux(input_1, input_2, select_mux, output_mux);
    input [7:0] input_1;
    input [7:0] input_2;
    input select_mux;
    output reg [7:0] output_mux;
    always@(*)
        begin
            if (select_mux == 0)
                output_mux <= input_1;
            else
                output_mux <= input_2;
        end
endmodule
