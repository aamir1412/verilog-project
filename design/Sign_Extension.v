
module Sign_Extension (in_sign, out_sign, clock);
    input [2:0] in_sign;
    input clock;
    output reg [7:0] out_sign;
    always @(posedge clock) 
        begin
            out_sign <= {5'b00000, in_sign};
        end
endmodule