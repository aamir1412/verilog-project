`timescale 1ps/1ps
`include "../design/Control_Unit.v"

module Control_Unit_tb();
    reg [2:0] control_opcode;
    wire [1:0] alu_op;
    wire reg_dst, jump, branch, reg_write,  mem_read, mem_to_reg, mem_write, ALU_src;
    Control_Unit control_unit (.control_opcode(control_opcode), .reg_dst(reg_dst), .jump(jump), .branch(branch), .mem_read(mem_read), .mem_to_reg(mem_to_reg), .alu_op(alu_op), .mem_write(mem_write), .ALU_src(ALU_src), .reg_write(reg_write));
    initial
		begin
			$dumpfile("vcd/Control_Unit_dump.vcd");
			$dumpvars(0, Control_Unit_tb);
            #1;
            control_opcode = 3'b011;
            #5;	
            control_opcode = 3'b001;
            #5;
            control_opcode = 3'b010;
            #5;
            control_opcode = 3'b011;
            #5;
            control_opcode = 3'b100;
            #5;
            control_opcode = 3'b101;
            #5;
            control_opcode = 3'b110;	            		          
        end
endmodule

