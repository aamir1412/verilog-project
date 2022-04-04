
`timescale 1ps/1ps
`include "../design/PC.v" 

module PC_tb();
	reg [7:0] pcin;
	reg incr, load, reset, clock;
	wire [7:0] pcout;
	
	PC a1(.pcin(pcin),.incr(incr), .load(load), .reset(reset), .clock(clock), .pcout(pcout));
	initial
		begin
			$dumpfile("vcd/PC_dump.vcd"); $dumpvars;
			$dumpvars(0,PC_tb);
            #1;
			pcin=8'b00000011; 
            #1;
			incr=0;
			load=1;
			reset=0;
			clock=1;			
			#5;
			clock=0;
			#1
            pcin=8'b00000111;             
			incr=0;
			load=0;
			reset=1;
			clock=1;			
			#5;
			clock=0;
			#1
            pcin=8'b00000111;             
			incr=1;
			load=0;
			reset=0;
			clock=1;			
			#10;		            		          
		end
        
endmodule
