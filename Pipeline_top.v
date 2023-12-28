`include "PC.v"
`include "Instruction_Memory.v"
`include "Register_File.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_Memory.v"
`include "PC_Adder.v"
`include "Mux.v"
`include "Decode_pipeline.v"
`include "Execute_pipeline.v"
`include "Fetch_pipeline.v"
`include "Memory_pipeline.v"
`include "Writeback_pipeline.v"

module pipeline_top(clk, rst);

//Declaration of I/O 
input clk, rst;

//Declaration of interim Wires
wire RegWrite_E, ALUSrc_E, MemWrite_E, ResultSrc_E, Branch_E, WE3_D;
wire RegWrite_M, ResultSrc_M, MemWrite_M;
wire Regwrite_R, ResultSrc_R;
wire ResultSrc_wb;
wire [2:0] ALUControl_E;
wire [31:0] PC_Next_F, Instr_D, WD3_D, RD1_E, RD2_E, Imm_Ext_E, Mux1_E;
wire [31:0] WriteData_M, AluResult_M;
wire [31:0] AluResult_R, ReadData_R; 
wire [31:0] AluResult_wb, ReadData_wb, Result_wb;

//DataPath Instantiation
fetch_cycle     fetch(.clk(clk), 
                      .rst(rst), 
                      .PC_Next_F(PC_Next_F), 
                      .Instr_D(Instr_D)
);

Decode_cycle    decoder(.clk(clk),
                        .rst(rst),
                        .Instr_D(Instr_D),
                        .RegWrite_E(RegWrite_E),
                        .ALUSrc_E(ALUSrc_E),
                        .MemWrite_E(MemWrite_E),
                        .ResultSrc_E(ResultSrc_E),
                        .Branch_E(Branch_E),
                        .ALUControl_E(),
                        .WE3_D(WE3_D), 
                        .WD3_D(WD3_D), 
                        .RD1_E(RD1_E), 
                        .RD2_E(RD2_E), 
                        .Imm_Ext_E(Imm_Ext_E),
                        .Mux1_E(Mux1_E),
);

execute_cycle   execute(.clk(clk), 
                        .rst(rst), 
                        .RD1_E(RD1_E), 
                        .RD2_E(RD2_E), 
                        .AluControl_E(ALUControl_E), 
                        .RegWrite_E(RegWrite_E), 
                        .ImmExt_E(Imm_Ext_E), 
                        .ALUSrc_E(ALUSrc_E), 
                        .MemWrite_E(MemWrite_E),
                        .ResultSrc_E(ResultSrc_E), 
                        .Branch_E(Branch_E), 
                        .RegWrite_M(RegWrite_M), 
                        .ResultSrc_M(ResultSrc_M), 
                        .MemWrite_M(MemWrite_M),
                        .WriteData_M(WriteData_M), 
                        .AluResult_M(AluResult_M) 
);

memory_cycle    memory(.clk(clk), 
                       .rst(rst), 
                       .Regwrite_M(RegWrite_M), 
                       .ResultSrc_M(ResultSrc_M), 
                       .Memwrite_M(MemWrite_M),
                       .AluResult_M(AluResult_M), 
                       .WriteData_M(WriteData_M), 
                       .Regwrite_R(Regwrite_R), 
                       .ResultSrc_R(ResultSrc_R), 
                       .AluResult_R(AluResult_R), 
                       .ReadData_R(ReadData_R)
);

writeback_cycle writeback(.clk(clk), 
                          .rst(rst), 
                          .ResultSrc_wb(ResultSrc_wb), 
                          .AluResult_wb(AluResult_wb), 
                          .ReadData_wb(ReadData_wb), 
                          .Result_wb(Result_wb)
);

endmodule










