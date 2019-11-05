`timescale 1ns/1ns
module parent_test();

	reg clk,rst;

parent2 par(clk,rst);


initial
begin

	clk=0;
	repeat(20)
	#5 clk= ~clk;

end

initial
begin
	$dumpfile("parent2.vcd");
	$dumpvars(0,clk,par.reg_file1.reg_mem[1],par.reg_file1.reg_mem[2],par.reg_file1.reg_mem[3]);
	rst=0;
	#1;
	rst=1;
	#1;
	rst=0;
	#200;
end
endmodule
