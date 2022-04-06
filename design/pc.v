module PC(reset, clock, pcin, pcout);
	input [7:0] pcin;
	input reset, clock;
	output reg[7:0] pcout;
    always@(posedge clock or posedge reset)
		begin
			if(reset) 
				pcout <=8'd00000000;
			else 
				pcout <= pcin;
		end
endmodule

