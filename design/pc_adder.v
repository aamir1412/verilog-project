module PC_Adder(pc_in, pc_out); 
    input [7:0] pc_in;
    output [7:0] pc_out;
    always@(*)
        begin
            assign pc_out = pc_in + 1;
        end
endmodule
