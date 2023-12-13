`include "PC.v"
`include "Instruction_Memory.v"
`include "PC_Adder.v"


module fetch_pipeline(clk, rst, PC_Next_F, Instr_D, PC_D, PCPlusD);

input clk, rst;
input [31:0]PC_Next_F;
output reg [31:0]Instr_D, PC_D, PCPlusD;

wire [31:0]PC_F, PCPlus_F, Instr_F;

PC_Module PC_Mod_F(
    .clk(clk),
    .rst(rst),
    .PC(PC_F),
    .PC_Next(PCPlus_F)
);

Instruction_Memory Instr_F(
    .A(PC_F),
    .RD(Instr_F)
);

PC_Adder PC_Adder_F(
    .a(PC_F),
    .b(32'd1),
    .c(PCPlus_F)
);












