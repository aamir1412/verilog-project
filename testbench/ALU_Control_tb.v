
`timescale 1ps/1ps
`include "../design/ALU_Control.v" 

module ALU_Control_tb();
	reg [2:0] function_input;
	reg [1:0] alu_op;  
    wire [2:0] alu_control;
	ALUControl a1(.function_input(function_input), .alu_op(alu_op), .alu_control(alu_control));
	initial
		begin
			$dumpfile("vcd/ALU_Control_dump.vcd"); $dumpvars;
			$dumpvars(0, ALU_Control_tb);
			
            #1;
			alu_op = 2'b00;
			function_input = 3'b000;
			
			#5
			alu_op = 2'b00;
			function_input = 3'b010;


			#5;
			alu_op = 2'b01;
			function_input = 3'b000;
			

			#5;
			alu_op = 2'b01;
			function_input = 3'b010;
			

			#5;
			alu_op = 2'b10;
			function_input = 3'b000;
			

			#5;
			alu_op = 2'b10;
			function_input = 3'b010;
			#10;		            		          

		end        
endmodule
