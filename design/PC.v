module PC(pcin, incr, load, reset, clock, pcout);
	input [7:0] pcin;
	input incr, load, reset, clock;
	output reg[7:0] pcout;
	always @(posedge clock)
		begin
			if (reset)
				pcout = 8'b00000000;
			else if(load)
				pcout = pcin;
			else
				pcout = pcout + 1;
		end
endmodule