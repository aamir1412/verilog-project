module Control_Unit (control_opcode, reg_dst, jump, branch, mem_read, mem_to_reg, alu_op, mem_write, ALU_src, reg_write);
    input [2:0] control_opcode;
    output reg [1:0] alu_op;
    output reg reg_dst, jump, branch, reg_write,  mem_read, mem_to_reg, mem_write, ALU_src;
    parameter  LOAD_WORD_OPCODE = 3'b001,
                STORE_WORD_OPCODE = 3'b010,
                JUMP_OPCODE = 3'b011,
                ADD_OPCODE = 3'b100,
                ADD_IMMEDIATE_OPCODE = 3'b101,
                SUBTRACT_OPCODE = 3'b110;

    always @(*) begin
        case(control_opcode)
            LOAD_WORD_OPCODE:      
                begin
                    reg_dst <= 0;
                    reg_write <= 1;
                    branch <= 0;
                    jump <= 0;
                    alu_op <= 2'b00;
                    mem_read <= 1;
                    mem_write <= 0;
                    mem_to_reg <= 1;
                    ALU_src <= 1;
                end
            STORE_WORD_OPCODE:     
                begin
                    reg_dst <= 0;
                    reg_write <= 0;
                    branch <= 0;
                    jump <= 0;
                    alu_op <= 2'b00;
                    mem_read <= 0;
                    mem_write <= 1;
                    mem_to_reg <= 0;
                    ALU_src <= 1;                
                end
            JUMP_OPCODE :    
                begin
                    reg_dst <= 0;
                    reg_write <= 0;
                    branch <= 0;
                    jump <= 1;
                    alu_op <= 2'b01;
                    mem_read <= 0;
                    mem_write <= 0;
                    mem_to_reg <= 0;
                    ALU_src <= 0;
                end
            ADD_OPCODE:      
                begin
                    reg_dst <= 1;
                    reg_write <= 1;
                    branch <= 0;
                    jump <= 0;
                    alu_op <= 2'b10;
                    mem_read <= 0;
                    mem_write <= 0;
                    mem_to_reg <= 0;
                    ALU_src <= 0;
                end
            ADD_IMMEDIATE_OPCODE:     
                begin
                    reg_dst <= 0;
                    reg_write <= 1;
                    branch <= 0;
                    jump <= 0;
                    alu_op <= 2'b10;
                    mem_read <= 0;
                    mem_write <= 0;
                    mem_to_reg <= 0;
                    ALU_src <= 1;
                end
            SUBTRACT_OPCODE:      
                begin
                    reg_dst <= 1;
                    reg_write <= 1;
                    branch <= 0;
                    jump <= 0;
                    alu_op <= 2'b10;
                    mem_read <= 0;
                    mem_write <= 0;
                    mem_to_reg <= 0;
                    ALU_src <= 0;
                end
            endcase
        end
endmodule