`timescale 1ns/1ns  
module reg_file_test();
  
  reg [2:0] read1,read2,write_addr;
  reg [7:0] write_data;
  reg rst,write_reg;
  wire [7:0] reg1,reg2;
  
  reg_file regf1(read2,read1, write_data, write_reg, write_addr, rst, reg1,reg2);
  
  initial 
    begin
      
    $dumpfile("reg_file.vcd");
    $dumpvars(0);
    end	
    
  initial
  
    begin
    rst=0;
    read1= 0;
    read2=2;
    #2
    rst=1;
    #2
    rst=0;
    #1 
    
    write_data= 5;
    write_reg =0;
    write_addr=0;  
    #4
    write_data=3;
    write_reg=1;
    write_addr= 2;
    read1=2;
    #15;
    
    end   
    
endmodule        