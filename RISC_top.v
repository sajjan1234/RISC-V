module RISC(rst,clk1,clk2);
input clk1,clk2,rst;

wire [31:0] IF_ID_IR;
wire [31:0] ID_EX_IR;
wire signed [31:0]ID_EX_A,ID_EX_B,ID_EX_Imm;
wire signed [31:0]A,B;
 // wire [2:0] ID_EX_type,EX_MEM_type,MEM_WB_type;
wire [31:0] EX_MEM_IR;
wire signed [31:0]EX_MEM_ALUout,EX_MEM_B;
  //wire EX_MEM_cond;
wire [31:0] MEM_WB_IR;
wire signed [31:0]MEM_WB_ALUout,MEM_WB_LMD;
wire  signed [31:0] result;
wire [31:0]WB_ID_IR;
wire wr;
 // wire HALTED;
  //wire TAKEN_BRANCH;

wire [7:0]ID_EX_Ctrl,EX_MEM_Ctrl,MEM_WB_ctrl;

fatch f1(IF_ID_IR,rst,clk1);

decode d1(ID_EX_IR,ID_EX_Imm,ID_EX_A,ID_EX_B,ID_EX_Ctrl,rst,clk1,IF_ID_IR,result,wr,WB_ID_IR);

execution e1(EX_MEM_IR,EX_MEM_ALUout,EX_MEM_B,EX_MEM_Ctrl,clk1,A,B,ID_EX_Imm,ID_EX_IR,ID_EX_Ctrl);

memory m1(MEM_WB_IR,MEM_WB_LMD,MEM_WB_ALUout,MEM_WB_ctrl,rst,clk1,EX_MEM_B,EX_MEM_ALUout,EX_MEM_IR,EX_MEM_Ctrl);

writeback wb1(WB_ID_IR,result,wr,rst,clk1,MEM_WB_ALUout,MEM_WB_LMD,MEM_WB_IR,MEM_WB_ctrl);

Data_haz dh1(A,B,clk1,EX_MEM_IR,ID_EX_IR,MEM_WB_IR,WB_ID_IR,result,EX_MEM_ALUout,MEM_WB_ALUout,ID_EX_A,ID_EX_B);

endmodule
