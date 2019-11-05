`timescale 1ns/1ns
module instr_mem_test();
  
  reg rst;
  reg[4:0] PC;
  wire[7:0] inst_out;
  instr_mem inst1(PC,inst_out,rst);
  
  initial
    
    begin
    
    $dumpfile("instr_mem.vcd");
    $dumpvars(0);
    rst=0;
    #2
    rst=1;
    #2
    rst=0; 
    PC=0;
    #1;
    PC=1;
    #1;
    PC=2; 
    #2;   
    end  
    
 endmodule   