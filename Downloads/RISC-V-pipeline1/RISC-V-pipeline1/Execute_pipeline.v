`include "ALU.v"
`include "Mux.v"
module execute_cycle(RD1_E, RD2_E, AluControl_E, RegWrite_E, ALUSrc_E, MemWrite_E,
                    ResultSrc_E, Branch_E, Imm_Ext_E, RegWrite_M, ResultSrc_M, MemWrite_M, AluResult_M, WriteData_M);

//declaration of ports
input RegWrite_E, ALUSrc_E, MemWrite_E, ResultSrc_E, Branch_E;
input [31:0]RD1_E, RD2_E, Imm_Ext_E;
input [2:0]ALUControl_E;

output RegWrite_M, ResultSrc_M, MemWrite_M;
output [31:0] AluResult_M, WriteData_M;
output [31:0]AluResult_M, WriteData_M;

//Interim wires
wire [31:0]AluResult_i;

//Declaration of Registers
reg RegWrite_reg, ResultSrc_reg, MemWrite_reg;
reg [31:0] AluResult_reg, WriteData_reg;
reg [31:0]AluResult_reg, WriteData_reg;

