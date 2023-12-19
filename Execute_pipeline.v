`include "ALU.v"
`include "Mux.v"

module execute_cycle(RD1_E, RD2_E, AluControl_E, WriteData_E, RegWrite_E, ImmExt_E, ALUSrc_E, MemWrite_E,
                    ResultSrc_E, Branch_E, RegWrite_M, ResultSrc_M, MemWrite_M,WriteData_M, AluResult_M, );

//declaration of ports
input [31:0]RD1_E, RD2_E;
input [2:0]ALUControl_E;

output [31:0]AluResult_M, WriteData_M;
output RegWrite_M, ResultSrc_M, MemWrite_M;

//Interim wires
wire [31:0]AluResult_i;

//Declaration of Registers

