`include "ALU.v"
`include "Mux.v"

module execute_cycle(RD1_E, RD2_E, AluControl_E, RegWrite_E, ImmExt_E, ALUSrc_E, MemWrite_E,
                    ResultSrc_E, Branch_E, RegWrite_M, ResultSrc_M, MemWrite_M,WriteData_M, AluResult_M, );

//declaration of ports
input RegWrite_E, ALUSrc_E, MemWrite_E, ResultSrc_E, Branch_E;
input [31:0]RD1_E, RD2_E, ImmExt_E;
input [2:0]ALUControl_E;

output [31:0]AluResult_M, WriteData_M;
output RegWrite_M, ResultSrc_M, MemWrite_M;

//Interim wires
wire [31:0]AluResult_i;

//Declaration of Registers
reg [31:0]AluResult_M_r, WriteData_M_r;
reg RegWrite_M_r, ResultSrc_M_r, MemWrite_M_r;

//Instantiation of modules
ALU alu(
    .A(),
    .B(),
    .Result(),
    .ALUControl()
);

Mux mux(
    .a(),
    .b(),
    .s(),
    .c()
);





