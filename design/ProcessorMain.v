`include "/Volumes/Files/COA/design/PC.v"
`include "/Volumes/Files/COA/design/ALU.v"
`include "/Volumes/Files/COA/design/Control_Unit.v"
`include "/Volumes/Files/COA/design/Data_Memory.v"
`include "/Volumes/Files/COA/design/Instruction_Memory.v"
`include "/Volumes/Files/COA/design/MUX.v"
`include "/Volumes/Files/COA/design/Register_File.v"
`include "/Volumes/Files/COA/design/Sign_Extension.v"
`include "/Volumes/Files/COA/design/ALU_Control.v"

module ProcessorMain(clock, reset, pcin, pcout, instruction, alu_op, reg_dst, jump, branch, reg_write,  mem_read, mem_to_reg, mem_write, ALU_src, alu_control, alu_out, read_data1, read_data2);
    
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

    // ALU Control
    wire [2:0] alu_control;
    ALUControl alucontrol (.function_input(instruction[2:0]), .alu_op(alu_op), .alu_control(alu_control));

    // ALU Unit
    wire [7:0] alu_out;
    wire [7:0] read_data1;
    wire [7:0] read_data2;

    ALU alu (.opperand_1(read_data1), .opperand_2(read_data2), .opcode(alu_control), .alu_out(alu_out));

    // Register Files
    Register_File register_file (.clock(clock), .reset(reset), .read_register1(instruction[3]), .read_register2(instruction[4]), .write_enable(reg_write), .write_register(instruction[4]), .write_data(alu_out), .read_data1(read_data1), .read_data2(read_data2));

endmodule

