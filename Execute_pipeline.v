`include "ALU.v"

module execute_cycle(rs1_E, rs2_E, AluControl_E, Result_E, WriteData_E, RegWrite_E, ImmSrc_E, ALUSrc_E, MemWrite_E,
                    ResultSrc_E, Branch_E);

//declaration of ports
input [31:0]rs1_E, rs2_E;
input [2:0]ALUControl_E;

output [31:0]Result_E, WriteData_E;

//Interim wires
wire [31:0]Result_i, WriteData_i;

//Declaration of Registers
