`include "ALU.v"
`include "Mux.v"

module execute_cycle(clk, rst, RD1_E, RD2_E, AluControl_E, RegWrite_E, ImmExt_E, ALUSrc_E, MemWrite_E,
                    ResultSrc_E, Branch_E, RegWrite_M, ResultSrc_M, MemWrite_M,WriteData_M, AluResult_M, );

//declaration of I/O ports
input clk, rst, RegWrite_E, ALUSrc_E, MemWrite_E, ResultSrc_E, Branch_E;
input [31:0]RD1_E, RD2_E, ImmExt_E;
input [2:0]ALUControl_E;

output [31:0]AluResult_M, WriteData_M;
output RegWrite_M, ResultSrc_M, MemWrite_M;

//Interim wires
wire [31:0]AluResult_i,SrcB_i;

//Declaration of Registers
reg [31:0]AluResult_M_r, WriteData_M_r;
reg RegWrite_M_r, ResultSrc_M_r, MemWrite_M_r;

//Instantiation of modules
ALU alu(
    .A(RD1_E),
    .B(SrcB_i),
    .Result(AluResult_i),
    .ALUControl(ALUControl_E)
);

Mux mux(
    .a(RD2_E),
    .b(ImmExt_E),
    .s(ALUSrc_E),
    .c(SrcB_i)
);

always@(posedge clk, negedge rst)
    begin
        if(rst == 1'b0)
            begin
                AluResult_M_r <= 32'h0;
                WriteData_M_r <= 32'h0;
                RegWrite_M_r  <= 1'b0;
                ResultSrc_M_r <= 1'b0;
                MemWrite_M_r  <= 1'b0;
            end
        else
            begin
                AluResult_M_r <= AluResult_i;
                WriteData_M_r <= RD2_E;
                RegWrite_M_r  <= RegWrite_E;
                ResultSrc_M_r <= ResultSrc_E;
                MemWrite_M_r  <= MemWrite_E;
            end
    end

    assign AluResult_M   <= AluResult_M_r; 
    assign WriteData_M   <= WriteData_M_r;
    assign RegWrite_M    <= RegWrite_M_r;
    assign ResultSrc_M   <= ResultSrc_M_r;
    assign MemWrite_M    <= MemWrite_M_r;

endmodule





