`timescale 1ns/1ns
module ALU_test();
  
  reg [31:0] op1,op2;
  reg [2:0] con;
  reg [4:0] sft_amt;
  wire [31:0] result;

  ALU alu1(.con(con),.op1(op1),.op2(op2),.sft_amt(sft_amt),.result(result));

  initial
  begin
    $dumpfile("ALU.vcd");
    $dumpvars(0);		

    op1= 55; 
    op2= 33;
    sft_amt= 2;
    con=0;
    
    #10;
    con=1;
    
    #10;
    con=2;
    
    #10;
    con=3;
    
    #10;
    con=4;
    
    #10;
    con=5;
    #10;
   
      
  end


endmodule  