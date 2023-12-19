`include "Data_Memory.v"

module memory_cycle(clk, rst, Regwrite_M, ResultSrc_M, Memwrite_M, 
                    AluResult_M, WriteData_M, Regwrite_R, ResultSrc_R, AluResult_R, ReadData_R);

//declaration of I/O ports
input clk, rst, Regwrite_M, ResultSrc_M, Memwrite_M;
input [31:0] AluResult_M, WriteData_M;

output Regwrite_R, ResultSrc_R;
output [31:0] AluResult_R, ReadData_R;

//Interim Wires
wire [31:0] ReadData_i;

//declaration of registers
reg Regwrite_R_reg, ResultSrc_R_reg;
reg [31:0] AluResult_R_reg, ReadData_R_reg;

//Instantiation of modules
Data_Memory data_mem(
    .clk(clk),
    .rst(rst),
    .WE(MemWrite_M),
    .WD(WriteData_M),
    .A(AluResult_M),
    .RD(ReadData_i)
);

always@(posedge clk, negedge rst)
begin
    if(rst == 1'b0)
        begin
            Regwrite_R_reg      <= 1'b0;
            ResultSrc_R_reg     <= 1'b0;
            AluResult_R_reg     <= 32'h0;
            ReadData_R_reg      <= 32'h0;
        end
    else
        begin
            Regwrite_R_reg      <= Regwrite_M;
            ResultSrc_R_reg     <= ResultSrc_M;
            AluResult_R_reg     <= AluResult_M;
            ReadData_R_reg      <= ReadData_i;
        end
end

assign Regwrite_R       <= Regwrite_R_reg;
assign ResultSrc_R      <= ResultSrc_R_reg;
assign AluResult_R      <= AluResult_R_reg;
assign ReadData_R       <= ReadData_R_reg;
endmodule
