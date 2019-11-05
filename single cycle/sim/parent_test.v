
`timescale 1ns/1ns

module parent_test();
  
  reg clk,rst;
  
  
  parent p1(clk,rst);
  
  initial 
    
    begin
      $dumpfile("parent.vcd");
      $dumpvars(0,parent_test);
      clk= 1'b0;
      
      repeat(100)
      #10 clk= ~clk;
    end 
    
  initial
  
    begin
    
    rst=0;
    #1
    rst=1;
    #1
    rst=0;
  
    end

endmodule  
    
