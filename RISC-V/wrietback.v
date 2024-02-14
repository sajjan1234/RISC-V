module writeback(next_IR,result,RegWrite,rst,clk1,ALUResult,ReadData,RD_Instr);
output reg [31:0]result,next_IR;
output RegWrite;
input [31:0] RD_Instr,ALUResult,ReadData;
input clk1,rst;
wire [31:0] Result;
wire ResultSrc;

 Mux Mux_DataMemory_to_Register(
                            .a(ALUResult),
                            .b(ReadData),
                            .s(ResultSrc),
                            .c(Result)
    );
/*Register_File Register_File(
                            .clk(clk1),
                            .rst(rst),
                            .A3(RD_Instr[11:7]),
                            .WE3(RegWrite),
                            .WD3(Result)
                            
    );*/

Control_Unit_Top Control_Unit_Top(
                            .Op(RD_Instr[6:0]),
                            
                            .RegWrite(RegWrite),
                            .ResultSrc(ResultSrc)
    );

always@(posedge clk1)
begin
next_IR<=RD_Instr;
result<=Result;
end
endmodule
