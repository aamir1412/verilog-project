`include "PC.v"
`include "ALU.v"
`include "Control_Unit.v"
`include "Data_Memory.v"
`include "Instruction_Memory.v"
`include "MUX.v"
`include "Register_File.v"
`include "Sign_Extension.v"

module ProcessorMain();

    input clock;
    input reset;

    // PC Counter
    wire [7:0] pcin, pcout;
    PC a1(.reset(reset), .clock(clock), .pcin(pcin), .pcout(pcout));

    // Instruction Memory
    wire [7:0] instruction;
    Instruction_Memory im (.pc(pcout), .instruction(instruction));

    // CONTROL UNIT
    wire [1:0] alu_op;
    wire reg_dst, jump, branch, reg_write,  mem_read, mem_to_reg, mem_write, ALU_src;
    Control_Unit control_unit (.control_opcode(instruction[7:5]), .reg_dst(reg_dst), .jump(jump), .branch(branch), .mem_read(mem_read), .mem_to_reg(mem_to_reg), .alu_op(alu_op), .mem_write(mem_write), .ALU_src(ALU_src), .reg_write(reg_write));

    // Register Files

    Register_File register_file (.clock(clock), .reset(reset), .read_register1(instruction[3]), .read_register2(instruction[4]), .write_enable(reg_write), .write_register(instruction[4]), .write_data(), regfile, read_data1, read_data2);

    // ALU Control
    wire [2:0] alu_control;
    ALUControl alucontrol (.function_input(instruction[2:0]), .alu_op(alu_op), .alu_control(alu_control));

    // ALU Unit
    ALU alu (.opperand_1(instruction[4]), .opperand_2(), opcode, alu_out);




