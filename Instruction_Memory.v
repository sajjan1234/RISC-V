module Instruction_Memory(A,RD);
  input [31:0]A;
  output [31:0]RD;

  reg [31:0] mem [255:0];
  
  assign RD = mem[A];

  initial begin
    $readmemh("memfile.txt",mem,1,21);
  end

endmodule