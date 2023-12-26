`include "Mux.v"

module writeback_cycle(clk, rst, ResultSrc_wb, AluResult_wb, ReadData_wb, Result_wb);

//declaration of I/O ports
input clk, rst, ResultSrc_wb;
input [31:0] AluResult_wb, ReadData_wb;

output [31:0] Result_wb;

//instantiation of modules
Mux mux_data_2_reg(
    .a(AluResult_wb),
    .b(ReadData_wb),
    .s(ResultSrc_wb),
    .c(Result_wb)
);


