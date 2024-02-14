module decode(next_IR,Imm,A,B,CtrlSig,rst,clk2,RD_Instr,result,wr,write_IR);
output reg signed [31:0]Imm,A,B;
output reg [31:0]next_IR;
output reg [7:0]CtrlSig;
//output reg [3:0]ALU_control;
//output reg ALU_src,MEM_write,REG_write,RESULT_src;
input rst,clk2,wr;
input [31:0]RD_Instr,write_IR;
input signed [31:0]result; 
wire [1:0]ImmSrc;
wire RegWrite,ALUSrc,MemWrite,ResultSrc;
wire [3:0]ALUControl;

wire signed [31:0] RD1_Top,RD2_Top,Imm_Ext_Top;


Register_File Register_File(
                            .clk(clk2),
                            .rst(rst),
                            .WE3(wr),
                            .WD3(result),
                            .A1(RD_Instr[19:15]),
                            .A2(RD_Instr[24:20]),
                            .A3(write_IR[11:7]),
                            .RD1(RD1_Top),
                            .RD2(RD2_Top)
    );

Sign_Extend Sign_Extend(
                        .In(RD_Instr),
                        .ImmSrc(ImmSrc),
                        .Imm_Ext(Imm_Ext_Top)
    );


Control_Unit_Top Control_Unit_Top(
                            .Op(RD_Instr[6:0]),
                            .funct3(RD_Instr[14:12]),
                            .funct7(RD_Instr[31:25]),
                            .ImmSrc(ImmSrc),
                            .ALUSrc(ALUSrc),
                            .ALUControl(ALUControl),
                            .MemWrite(MemWrite),
                            .RegWrite(RegWrite),
                            .ResultSrc(ResultSrc)
                            
    );

always @(posedge clk2 )
begin
Imm<=Imm_Ext_Top;
A<=RD1_Top;
B<=RD2_Top;
next_IR<=RD_Instr;
/*ALU_src<=ALUSrc;
ALU_control<=ALUControl;
MEM_write<=MemWrite;
REG_write<=RegWrite;
RESULT_src<=ResultSrc;*/
CtrlSig<={ALUControl,ALUSrc,MemWrite,RegWrite,ResultSrc};
end
endmodule
