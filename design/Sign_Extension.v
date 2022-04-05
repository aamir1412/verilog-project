
module Sign_Extension (in_sign, out_sign);
    input [2:0] in_sign;
    output reg [7:0] out_sign;
    always @(*) 
        begin
            assign out_sign = {5'b0, in_sign};
        end
endmodule