module execution(next_IR,result,next_RD2_Top,clk1,RD1_Top,RD2_Top,Imm_Ext_Top,RD_Instr);

output reg [31:0]next_IR,result,next_RD2_Top;
input [31:0]RD1_Top,RD2_Top,Imm_Ext_Top,RD_Instr;
input clk1;
wire ALUSrc;
wire [2:0]ALUControl_Top;

wire [31:0]SrcB,ALUResult;


 Mux Mux_Register_to_ALU(
                            .a(RD2_Top),
                            .b(Imm_Ext_Top),
                            .s(ALUSrc),
                            .c(SrcB)
    );

    ALU ALU(
            .A(RD1_Top),
            .B(SrcB),
            .Result(ALUResult),
            .ALUControl(ALUControl_Top)
    );




Control_Unit_Top Control_Unit_Top(
                            .Op(RD_Instr[6:0]),
                            .ALUSrc(ALUSrc),
                            .funct3(RD_Instr[14:12]),
                            .funct7(RD_Instr[6:0]),
                            .ALUControl(ALUControl_Top)
    );



always @(posedge clk1)
begin
result<=ALUResult;
next_IR<=RD_Instr;
next_RD2_Top<=RD2_Top;
end

endmodule
