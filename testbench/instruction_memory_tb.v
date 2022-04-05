
`timescale 1ps/1ps
`include "../design/Instruction_Memory.v" 

module Instruction_Memory_tb();
      reg [7:0] pc;
      wire [7:0] instruction;                      
	  Instruction_Memory a3(.pc(pc), .instruction(instruction));
      initial
		begin
			$dumpfile("vcd/Instruction_Memory_dump.vcd");
			$dumpvars(0, Instruction_Memory_tb);
            #1;
			pc=8'd0; 
            #5;
			pc=8'd1; 
            #5;	
            pc=8'd2; 
            #5;	
            pc=8'd3; 
            #5;	
            pc=8'd4; 
            #5;		
            pc=8'd5; 
            #5;	
            pc=8'd6; 
            #5;	
            pc=8'd7; 
            #5;				            		         
		end        
endmodule