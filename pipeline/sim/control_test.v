`timescale 1ns/1ns

module control_test();
  
  reg [7:0] inst_out;
  wire sel_in2,sel_pc,aluc,reg_write;

  control cc(inst_out, sel_pc, aluc, reg_write,sel_in2);

  initial
  begin
    $dumpfile("control.vcd");
    $dumpvars(0);		

    inst_out= 8'b00_xxxxxx;
    #10;	
    inst_out= 8'b01_xxxxxx;
    #10;
    inst_out= 8'b11_xxxxxx;
    #5;	  
  end

endmodule  