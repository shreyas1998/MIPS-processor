`include "alu.v"
`include "control.v"
`include "instr_mem.v"
`include "reg_file.v"
`include "registers.v"

module parent2(clk,rst);

	input clk,rst;
	reg [4:0] PC, PC_in;
	wire[4:0] PC_plus;
	wire sel_pc, reg_ID_sel_in2, reg_EX_reg_write, aluc, reg_write, sel_in2, reg_ID_aluc;
	wire [7:0] reg_ID_inst_out, reg_IF_inst_out, reg_EX_alu_out, reg1,reg2, inst_out, reg_EX_alu_result, reg_EX_inst_out;
	wire[7:0] alu_result,reg_ID_reg1_data;
	reg[7:0] in2,in1;
	reg flag,sel_forw;
	
	assign PC_plus= PC+1;
	
	control cc(.inst_out(inst_out), .sel_pc(sel_pc), .aluc(aluc), .reg_write(reg_write),.sel_in2(sel_in2));

	instr_mem instr1(PC,inst_out,rst);

	reg_file reg_file1(.read1(reg_IF_inst_out[5:3]),.write_data(reg_EX_alu_result),.write_reg(reg_EX_reg_write),
			   .write_addr(reg_EX_inst_out[5:3]), .rst(rst), .reg1(reg1));

        alu alu1(.in1(in1),.in2(in2),.aluc(reg_ID_aluc),.out(alu_result));

	
	registers2 ree(clk,rst,reg_write,sel_in2,aluc,inst_out,reg1,alu_result,                  //registers file containing all the pipelined registers
		       reg_IF_inst_out,reg_ID_sel_in2,reg_ID_aluc,reg_EX_reg_write,
		       reg_EX_alu_result,reg_EX_inst_out,reg_ID_reg1_data,reg_ID_inst_out);


	always@(negedge rst)                   //pc updation
		PC<=0;
	always@(posedge clk)
		PC<= PC_in;

	always@(*)                              //PC mux , for jump instruction
	begin
		if(sel_pc== 1'b0)
			PC_in<= PC_plus;
		else
			PC_in<= PC_plus+{2'b00,inst_out[5:0]}; 
	end
         
	

	
	always@(*)                             //mux for sel_in2 
	begin
		if(reg_ID_sel_in2==1'b0)
		begin	
			if(reg_ID_inst_out[2]==1)
				in2= {5'b11111,reg_ID_inst_out[2:0]}; 
			else
				in2= {5'b0,reg_ID_inst_out[2:0]};

		end  

		else
			in2=  reg_ID_inst_out[2:0];	
	end  	

	//forwarding

	always@(*)           //checking conditions for forwarding
	begin
		if((reg_ID_inst_out!=0) && (reg_IF_inst_out!=0) && (reg_ID_inst_out[5:3]== reg_IF_inst_out[5:3]))
			flag=1;
		else
			flag=0;
	end	

	always@(posedge clk)
	begin
		if(flag==1)
			sel_forw=1;
		else	
			sel_forw=0;
	end

	always@(*)             //forwarding_mux which is placed before alu input 1
	begin
	if(sel_forw==1)
		in1= reg_EX_alu_result;
	else
		in1= reg_ID_reg1_data;
	end

endmodule
