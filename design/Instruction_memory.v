module Instruction_Memory (pc, instruction);   
    input [7:0] pc;
    output reg [7:0] instruction;
    reg [7:0] ins_addr[0:7];    
    initial begin		          
          $readmemb("../data/instruction_memory_code.data",ins_addr);                         
    end    
    always @(pc)
        begin
            instruction <= ins_addr[pc];
        end    
endmodule