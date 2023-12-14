`include "Control_Unit_Top.v"
`include "Sign_Extend.v"
`include "Register_File.v"
`include "Mux.v"

module Decode_cycle(clk, rst, Instr_D, PC_D, PCPlusD, 
                    RegWrite_E, ImmSrc_E, ALUSrc_E, MemWrite_E,
                    ResultSrc_E, Branch_E, ALUControl_E,
                    WE3_D, WD3_D, RD1_E, RD2_E, Imm_Ext_E,Mux1_E
                    );

//Declaration of ports
input clk, rst, WE3_D;
input [31:0]Instr_D, PC_D, PCPlusD, WD3_D;

output RegWrite_E, ALUSrc_E, MemWrite_E, ResultSrc_E, Branch_E;
output [1:0]ImmSrc_E;
output [2:0]ALUControl_E;
output [31:0]RD1_E, RD2_E, Imm_Ext_E, Mux1_E;

//Interim wires
wire RegWrite_D, ALUSrc_D, MemWrite_D, ResultSrc_D, Branch_D;
wire [1:0]ImmSrc_D;
wire [2:0]ALUControl_D;
wire [31:0]RD1_D, RD2_D, Imm_Ext_D, Mux1_D;

//Declaration Of Registers
reg RegWrite_reg, ALUSrc_reg, MemWrite_reg, ResultSrc_reg, Branch_reg;
reg [1:0]ImmSrc_reg;
reg [2:0]ALUControl_reg;
reg [31:0]RD1_reg, RD2_reg, Imm_Ext_reg, Mux1_reg;

//Instantiation of modules
Control_Unit_Top Control_unit(
    .Op(),
    .RegWrite(),
    .ImmSrc(),
    .ALUSrc(),
    .MemWrite(),
    .ResultSrc(),
    .Branch(),
    .funct3(),
    .funct7(),
    .ALUControl()
);

Register_File Reg_file(
    .clk(),
    .rst(),
    .WE3(),
    .WD3(),
    .A1(),
    .A2(),
    .A3(),
    .RD1(),
    .RD2()
);

Mux Mux1(
    .a(),
    .b(),
    .s(),
    .c()
);

Sign_Extend sign_extnd(
    .In(),
    .Imm_Ext(),
    .ImmSrc()
);

always@(posedge clk , negedge rst)
begin
    if(rst == 0)
        begin
            RegWrite_reg    = 32'h0;
            ALUSrc_reg      = 32'h0;
            MemWrite_reg    = 32'h0;
            ResultSrc_reg   = 32'h0;
            Branch_reg      = 32'h0;
            Imm_Ext_reg     = 32'h0;
            ImmSrc_reg      = 32'h0;
            ALUControl_reg  = 32'h0;
            RD1_reg         = 32'h0;
            RD2_reg         = 32'h0;
            Mux1_reg        = 32'h0;
        end
    else
        begin
            RegWrite_reg    = RegWrite_D;
            ALUSrc_reg      = ALUSrc_D;
            MemWrite_reg    = MemWrite_D;
            ResultSrc_reg   = ResultSrc_D;
            Branch_reg      = Branch_D;
            Imm_Ext_reg     = Imm_Ext_D;
            ImmSrc_reg      = ImmSrc_D;
            ALUControl_reg  = ALUControl_D;
            RD1_reg         = RD1_D;
            RD2_reg         = RD2_D;
            Mux1_reg        = Mux1_D;
        end
end

        assign RegWrite_E   <= (rst == 0) ? 32'h0 : RegWrite_reg;    
        assign ALUSrc_E     <= (rst == 0) ? 32'h0 : ALUSrc_reg;      
        assign MemWrite_E   <= (rst == 0) ? 32'h0 : MemWrite_reg;  
        assign ResultSrc_E  <= (rst == 0) ? 32'h0 : ResultSrc_reg; 
        assign Branch_E     <= (rst == 0) ? 32'h0 : Branch_reg;     
        assign Imm_Ext_E    <= (rst == 0) ? 32'h0 : Imm_Ext_reg;    
        assign ImmSrc_E     <= (rst == 0) ? 32'h0 : ImmSrc_reg;     
        assign ALUControl_E <= (rst == 0) ? 32'h0 : ALUControl_reg;  
        assign RD1_E        <= (rst == 0) ? 32'h0 : RD1_reg;         
        assign RD2_E        <= (rst == 0) ? 32'h0 : RD2_reg;
        assign Mux1_E       <= (rst == 0) ? 32'h0 : Mux1_reg;

endmodule         




