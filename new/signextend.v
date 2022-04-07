`timescale 1ns / 1ps



module signextend(
    in_sign, out_sign
    );
    input [2:0] in_sign;
    output reg [7:0] out_sign;
    
    always@(*)
    begin
    out_sign[7:0] <= {5'b00000,  in_sign[2:0] };
    end
endmodule
