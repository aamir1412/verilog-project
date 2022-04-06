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

wire 