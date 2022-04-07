`timescale 1ns / 1ps

module main(
    clock, reset,in_pc,out_pc, instruction, alu_op, reg_dst, jumpp, branch, reg_write,  mem_read, mem_to_reg, mem_write, ALU_src,
    read_data1, read_data2, alu_control, alu_out, out_sign, out_put_mux, read_data, ram_reg, pc_add, jump_j
    );
    input clock;
    input reset;

    // PC Counter
    output wire [7:0] in_pc;
    output wire [7:0] out_pc;
    pc pcc(.clock(clock), .reset(reset), .in_pc(in_pc), .out_pc(out_pc));

    // Instruction Memory
    output wire [7:0] instruction;
    Instruction_Memory im (.pc(out_pc), .instruction(instruction));

    // CONTROL UNIT
    output wire [1:0] alu_op;
    output wire reg_dst, jumpp, branch, reg_write,  mem_read, mem_to_reg, mem_write, ALU_src;
    Control_Unit control_unit (.control_opcode(instruction[7:5]), .reg_dst(reg_dst), .jumpp(jumpp), .branch(branch), .mem_read(mem_read), .mem_to_reg(mem_to_reg), .alu_op(alu_op), .mem_write(mem_write), .ALU_src(ALU_src), .reg_write(reg_write));

    // Register Files
    output wire[7:0] read_data1;
    output wire[7:0] read_data2;
    Register_File register_file(.clock(clock),.reset(reset),.read_register1(instruction[3]), .read_register2(instruction[4]), .write_enable(reg_write), .write_register(instruction[3]), .write_data(ram_reg),.read_data1(read_data1),.read_data2(read_data2));

    // ALU Control
    output wire [2:0] alu_control;
    ALUControl alucontrol (.function_input(instruction[2:0]), .alu_op(alu_op), .alu_control(alu_control));

    // ALU Unit
    output wire [7:0] alu_out;
    ALU alu (.opperand_1(read_data1), .opperand_2(out_put_mux), .opcode(alu_control),.alu_out(alu_out));
    
    //Signextend
    output wire [7:0] out_sign;
    signextend se1 ( .in_sign(instruction[2:0]), .out_sign(out_sign));
    
    //MUX0
    output wire [7:0] out_put_mux;
    mux mux0 (.input_1(read_data2), .input_2(out_sign), .select_mux(ALU_src), .output_mux(out_put_mux));
  
    //DataMemory
    output wire [7:0] read_data;
    Data_Memory ram (.enable_write(mem_write), .enable_read(mem_read), .ram_addr(alu_out), .write_data(read_data2), .read_data(read_data));
    
    
    //MUX1
    output wire [7:0] ram_reg;
    mux mux1 (.input_1(alu_out), .input_2(read_data), .select_mux(mem_to_reg), .output_mux(ram_reg));

    //pc_add
    output wire [7:0] pc_add;
    pc_adder pcadd (.add_pc(out_pc), .pc_add(pc_add));
    
    //jump
    output wire [7:0] jump_j;
    jump jump1 (.jump_addr(instruction[4:0]), .jump_j(jump_j));    
    
    //MUX2
    mux mux2 (.input_1(pc_add), .input_2(jump_j), .select_mux(jumpp), .output_mux(in_pc));
    

endmodule
