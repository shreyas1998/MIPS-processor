`include "control_unit.v" 
`include "instr_mem.v" 
`include "reg_file.v" 
`include "ALU.v" 

 

module parent(clk,rst);
  
  input clk,rst;
  wire [31:0] inst_out;
  reg [4:0]PC;
  wire mux_cont,write_reg;
  wire[7:0] aluop_shamt;
  reg [31:0] write_d_sig;
  wire[31:0] reg1,reg2,res;
  
  
  initial
    PC= 3'b0;
    
  always@(posedge clk)
    PC<= PC+4;
   
  control_unit con(inst_out,mux_cont,aluop_shamt,write_reg);  
  
  instr_mem im1(PC,inst_out,rst);
  
  reg_file regf1(.read1(inst_out[20:16]),.read2(inst_out[15:11]),
                .write_data(write_d_sig),.clk(clk),.write_reg(write_reg),
                .write1(inst_out[25:21]),.rst(rst),.reg1(reg1),.reg2(reg2));
                  
  ALU alu1(.con(aluop_shamt[7:5]),.op1(reg1),.op2(reg2),.sft_amt(aluop_shamt[4:0]),.result(res));

 always@(*)
    begin
      if(mux_cont== 1'b1)
	begin
		if(inst_out[20]==1'b1)
        		write_d_sig= {11'b1,inst_out[20:0]};  //sign extend??
		else
			write_d_sig= {11'b0,inst_out[20:0]}; 
	
	end
      else
        write_d_sig= res; 
    end  
    

endmodule    
  