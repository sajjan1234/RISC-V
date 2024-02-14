module memory(next_IR,dataout,next_ALUResult,ctrl_sig,rst,clk2,RD2_Top,ALUResult,RD_Instr,contrl_sig);
output reg signed [31:0]dataout,next_ALUResult;
output reg [31:0] next_IR;
output reg [7:0]ctrl_sig;
input clk2,rst;
input signed [31:0]RD2_Top,ALUResult;
input [31:0]RD_Instr;
input [7:0]contrl_sig;
wire [31:0]ReadData;
wire MemWrite;
//wire [2:0]Mem_Control_top;

Data_Memory Data_Memory(
                        .clk(clk2),
                        .rst(rst),
                        .WE(contrl_sig[2]),
                        .WD(RD2_Top),
                        .A(ALUResult),
                        .RD(ReadData)
    );



/*Control_Unit_Top Control_Unit_Top(
                            .Op(RD_Instr[6:0]),
                            //.Mem_Control(Mem_Control_top),
                            .funct3(RD_Instr[14:12]),
                            .MemWrite(MemWrite)
                            
    );*/

always@(posedge clk2)
begin
case(RD_Instr[14:12])
   3'b000:
     dataout<=$signed({{24{ReadData[7]}},ReadData[7:0]});
   3'b001:
     dataout<=$signed({{16{ReadData[15]}},ReadData[15:0]});
   3'b010:
     dataout<=$signed(ReadData);
   3'b100:
     dataout<={{24{1'b0}},ReadData[7:0]};
   3'b101:
     dataout<={{16{1'b0}},ReadData[15:0]};
endcase

next_IR<=RD_Instr;
next_ALUResult<=ALUResult;
ctrl_sig<=contrl_sig;
end
endmodule