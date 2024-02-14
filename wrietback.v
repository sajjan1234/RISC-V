module writeback(next_IR,result,Write,rst,clk1,ALUResult,ReadData,RD_Instr,contrl_sig);
output reg signed [31:0]result;
output reg [31:0]next_IR;
output reg Write;
//output reg [7:0]ctrl_sig;
input [31:0] RD_Instr;
input signed [31:0]ALUResult,ReadData;
input clk1,rst;
input [7:0]contrl_sig;
wire [31:0] Result;
//wire ResultSrc,RegWrite;

 Mux Mux_DataMemory_to_Register(
                            .a(ALUResult),
                            .b(ReadData),
                            .s(contrl_sig[0]),
                            .c(Result)
    );


/*Control_Unit_Top Control_Unit_Top(
                            .Op(RD_Instr[6:0]),
                            
                            .RegWrite(RegWrite),
                            .ResultSrc(ResultSrc)
    );*/

always@(posedge clk1)
begin
next_IR<=RD_Instr;
result<=Result;
Write<=contrl_sig[1];
end
endmodule
