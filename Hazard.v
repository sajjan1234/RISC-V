module Data_haz(A,B,clk,EX_MEM_IR,ID_EX_IR,MEM_WB_IR,WB_ID_IR,result,EX_MEM_ALUout,MEM_WB_ALUout,ID_EX_A,ID_EX_B);
input [31:0]EX_MEM_IR,ID_EX_IR,MEM_WB_IR,EX_MEM_ALUout,MEM_WB_ALUout,ID_EX_A,ID_EX_B,WB_ID_IR,result;
output reg [31:0]A,B;
input clk;

/*assign A=(EX_MEM_IR[11:7]==ID_EX_IR[19:15]?EX_MEM_ALUout:
         (MEM_WB_IR[11:7]==ID_EX_IR[19:15]?MEM_WB_ALUout:
         (WB_ID_IR[11:7]==ID_EX_IR[19:15]?result:ID_EX_A)));

assign B=(EX_MEM_IR[11:7]==ID_EX_IR[24:20]?EX_MEM_ALUout:
         (MEM_WB_IR[11:7]==ID_EX_IR[24:20]?MEM_WB_ALUout:
         (WB_ID_IR[11:7]==ID_EX_IR[24:20]?result:ID_EX_B)));
*/




always @(*) begin

if(EX_MEM_IR[11:7]==ID_EX_IR[19:15])
A=EX_MEM_ALUout;
else
if(MEM_WB_IR[11:7]==ID_EX_IR[19:15])
A=MEM_WB_ALUout;
else
if(WB_ID_IR[11:7]==ID_EX_IR[19:15])
A=result;
else
A=ID_EX_A;





if(EX_MEM_IR[11:7]==ID_EX_IR[24:20])
B=EX_MEM_ALUout;
else
if(MEM_WB_IR[11:7]==ID_EX_IR[24:20])
B=MEM_WB_ALUout;
else
if(WB_ID_IR[11:7]==ID_EX_IR[24:20])
B=result;
else
B=ID_EX_B;





end

endmodule 