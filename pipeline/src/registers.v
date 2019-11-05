module registers2(clk,rst,reg_write,sel_in2,aluc,inst_out,reg1,alu_result,reg_IF_inst_out,reg_ID_sel_in2,
		reg_ID_aluc,reg_EX_reg_write,reg_EX_alu_result,reg_EX_inst_out,reg_ID_reg1_data,reg_ID_inst_out);

	input reg_write,sel_in2,aluc,clk,rst;
	input [7:0] inst_out,reg1,alu_result;

	reg reg_IF_reg_write,reg_IF_sel_in2,reg_IF_aluc;
	output reg[7:0] reg_IF_inst_out;

	reg reg_ID_reg_write;
	output reg reg_ID_sel_in2,reg_ID_aluc;
	output reg [7:0] reg_ID_inst_out;

	output reg reg_EX_reg_write;
	output reg[7:0] reg_EX_alu_result;
	output reg[7:0] reg_EX_inst_out,reg_ID_reg1_data;


	always@(posedge clk)
	begin
	reg_IF_reg_write<= reg_write;  
	reg_IF_sel_in2<= sel_in2;
	reg_IF_aluc<= aluc;
	reg_IF_inst_out<= inst_out;  //o

	reg_ID_reg_write<= reg_IF_reg_write; 
	reg_ID_sel_in2<= reg_IF_sel_in2; //o
	reg_ID_aluc<= reg_IF_aluc;       //o
	reg_ID_inst_out<= reg_IF_inst_out; 
	reg_ID_reg1_data<= reg1;

	reg_EX_reg_write<= reg_ID_reg_write; //o 
	reg_EX_alu_result<= alu_result; //o
	reg_EX_inst_out<= reg_ID_inst_out;  //o 
		
	end

	always@(negedge rst)
	begin
	reg_IF_reg_write<= 0;  
	reg_IF_sel_in2<= 0;
	reg_IF_aluc<= 0;
	reg_IF_inst_out<= 0;  //o

	reg_ID_reg_write<= 0; 
	reg_ID_sel_in2<= 0; //o
	reg_ID_aluc<= 0;       //o
	reg_ID_inst_out<= 0; 

	reg_EX_reg_write<= 0; //o 
	reg_EX_alu_result<= 0; //o
	reg_EX_inst_out<= 0;  //o 
	end
	
endmodule