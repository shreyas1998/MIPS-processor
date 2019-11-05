`timescale 1ns/1ns  
module reg_file_test();
  
  reg [4:0] read1,read2,write1;
  reg [31:0] write_data;
  reg clk,rst,write_reg;
  wire [31:0] reg1,reg2;
  
  reg_file regf1(read1,read2,write_data,clk,write_reg,write1,rst,reg1,reg2);
  
  initial 
    begin
      
    $dumpfile("reg_file.vcd");
    $dumpvars(0);	
      clk= 1'b0;
      
      repeat(10)
      #5 clk= ~clk;
    end 
    
  initial
  
    begin
    rst=0;
    read1= 0;
    read2= 1;
    #2
    rst=1;
    #2
    rst=0;
    #1 
    
    write_data= 0;
    write_reg =1;
    write1=0;  
    #4
    write_data=3;
    write_reg=1;
    write1= 0;
    end   
    
endmodule        