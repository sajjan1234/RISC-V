module memory(next_IR,dataout,next_ALUResult,rst,clk2,RD2_Top,ALUResult,RD_Instr);
output reg [31:0]dataout,next_IR,next_ALUResult;
input clk2,rst;
input [31:0]RD2_Top,ALUResult,RD_Instr;

wire [31:0]ReadData;
wire MemWrite;

Data_Memory Data_Memory(
                        .clk(clk2),
                        .rst(rst),
                        .WE(MemWrite),
                        .WD(RD2_Top),
                        .A(ALUResult),
                        .RD(ReadData)
    );



Control_Unit_Top Control_Unit_Top(
                            .Op(RD_Instr[6:0]),
                            .MemWrite(MemWrite)
                            
    );
always@(posedge clk2)
begin
dataout<=ReadData;
next_IR<=RD_Instr;
next_ALUResult<=ALUResult;
end
endmodule
