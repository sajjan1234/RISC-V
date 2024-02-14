module Instruction_Memory(PC,IR);
  input [31:0]PC;
  output [31:0]IR;

  reg [31:0] IR_mem[255:0];
  
  assign IR = IR_mem[PC];

 /*initial begin
    $readmemh("memfile.txt",mem,1,21);
  end*/

endmodule
