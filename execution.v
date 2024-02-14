module execution(next_IR,result,next_RD2_Top,ctrl_sig,clk1,RD1_Top,RD2_Top,Imm_Ext_Top,RD_Instr,contrl_sig);

output reg [31:0]next_IR;
output reg signed [31:0]result,next_RD2_Top;
output reg [7:0]ctrl_sig;
input signed [31:0]RD1_Top,RD2_Top,Imm_Ext_Top;
input [31:0]RD_Instr;
input clk1;
input [7:0]contrl_sig;
//input ALUSrc;
//input [3:0]ALUControl_Top;

wire signed [31:0]SrcB,ALUResult;


 Mux Mux_Register_to_ALU(
                            .a(RD2_Top),
                            .b(Imm_Ext_Top),
                            .s(contrl_sig[3]),
                            .c(SrcB)
    );

    ALU ALU(
            .A(RD1_Top),
            .B(SrcB),
            .Result(ALUResult),
            .ALUControl(contrl_sig[7:4])
    );




/*Control_Unit_Top Control_Unit_Top(
                            .Op(RD_Instr[6:0]),
                            .ALUSrc(ALUSrc),
                            .funct3(RD_Instr[14:12]),
                            .funct7(RD_Instr[31:25]),
                            .ALUControl(ALUControl_Top)
    );*/



always @(posedge clk1)
begin
case(RD_Instr[14:12])
   3'b000:
     next_RD2_Top<={{24{1'b0}},RD2_Top[7:0]};
   3'b001:
     next_RD2_Top<={{16{1'b0}},RD2_Top[15:0]};
   3'b010:
     next_RD2_Top<=RD2_Top;
endcase

result<=ALUResult;
next_IR<=RD_Instr;
//next_RD2_Top<=RD2_Top;
ctrl_sig<=contrl_sig;
end

endmodule