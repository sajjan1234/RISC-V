`include "PC.v"
`include "Instruction_Memory.v"
`include "PC_Adder.v"

module fetch_cycle(clk, rst, PC_Next_F, Instr_D);

//Port Declaration
input clk, rst;
input [31:0]PC_Next_F;
output [31:0]Instr_D;

//Interim Wires
wire [31:0]PC_F, Instr_F;

// Declaration of Register
reg [31:0] InstrF_reg, PCPlus_F;

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

always @(posedge clk ,negedge rst)
    begin
        if (rst == 1'b0) 
            begin
                InstrF_reg   <= 32'd0;
            end
        else
            begin
                InstrF_reg   <= Instr_F;
            end
    end
        //Declaration of outputs 
        assign Instr_D       <= (rst == 1'b0) ? 32'd0 : InstrF_reg;
    
endmodule












