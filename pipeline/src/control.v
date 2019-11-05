module control(inst_out, sel_pc, aluc, reg_write,sel_in2);

	input [7:0] inst_out;
	output sel_pc,aluc,reg_write,sel_in2;
  
	assign sel_pc= (inst_out[7] & inst_out[6])?1:0;

	assign aluc= inst_out[6]?1:0;

	assign reg_write= inst_out[7]?0:1;

	assign sel_in2= (inst_out[6] & (~inst_out[7]))?1:0;

endmodule