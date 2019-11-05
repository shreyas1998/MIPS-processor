module alu(in1,in2,aluc,out);
	
	input [7:0] in1,in2;
	input aluc;
	output reg[7:0] out;

	always@(in1,in2,aluc)
	
	begin
		if(aluc== 1'b0)     //0 means add, 1 means shift left
			out= in2;	
		else
			out= in1<<in2;
	end

endmodule



	