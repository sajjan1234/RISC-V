module RISC(rst,clk1,clk2);
input clk1,clk2,rst;

wire [31:0] PC,IF_ID_IR,IF_ID_NPC;
  wire [31:0] ID_EX_IR,ID_EX_NPC,ID_EX_A,ID_EX_B,ID_EX_Imm;
 // wire [2:0] ID_EX_type,EX_MEM_type,MEM_WB_type;
  wire [31:0] EX_MEM_IR,EX_MEM_ALUout,EX_MEM_B;
  //wire EX_MEM_cond;
  wire [31:0] MEM_WB_IR,MEM_WB_ALUout,MEM_WB_LMD;
wire [31:0] result,WB_ID_IR;
wire wr;
 // wire HALTED;
  //wire TAKEN_BRANCH;

/*fatch f1(next_IR,rst,clk1);
decode(next_IR,Imm,A,B,rst,clk2,RD_Instr);
execution(next_IR,result,next_RD2_Top,clk1,RD1_Top,RD2_Top,Imm_Ext_Top,RD_Instr);

memory(next_IR,dataout,next_ALUResult,rst,clk2,RD2_Top,ALUResult,RD_Instr);
writeback(rst,clk1,ALUResult,ReadData,RD_Instr);*/

fatch f1(IF_ID_IR,rst,clk1);

decode d1(ID_EX_IR,ID_EX_Imm,ID_EX_A,ID_EX_B,rst,clk2,IF_ID_IR,result,wr,WB_ID_IR);

execution e1(EX_MEM_IR,EX_MEM_ALUout,EX_MEM_B,clk1,ID_EX_A,ID_EX_B,ID_EX_Imm,ID_EX_IR);

memory m1(MEM_WB_IR,MEM_WB_LMD,MEM_WB_ALUout,rst,clk2,EX_MEM_B,EX_MEM_ALUout,EX_MEM_IR);

writeback wb1(WB_ID_IR,result,wr,rst,clk1,MEM_WB_ALUout,MEM_WB_LMD,MEM_WB_IR);

endmodule
