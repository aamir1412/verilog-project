`timescale 1ps/1ps
`include "../design/Sign_Extension.v"

module Sign_Extension_tb();
    reg [2:0] in_sign;
    wire [7:0] out_sign;
    Sign_Extension sign_data (.in_sign(in_sign), .out_sign(out_sign));
    initial
		begin
			$dumpfile("vcd/Sign_Extension_dump.vcd");
			$dumpvars(0, Sign_Extension_tb);
            #1;
            in_sign = 3'b011;
            #10;		            		          
        end
endmodule

