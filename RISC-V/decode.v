module decode(next_IR,Imm,A,B,rst,clk2,RD_Instr,result,wr,write_IR);
output reg [31:0]Imm,A,B,next_IR;
input rst,clk2,wr;
input [31:0]RD_Instr,result,write_IR;
wire [1:0]ImmSrc;

wire [31:0] RD1_Top,RD2_Top,Imm_Ext_Top;


Register_File Register_File(
                            .clk(clk2),
                            .rst(rst),
                            .WE3(wr),
                            .WD3(result),
                            .A1(RD_Instr[19:15]),
                            .A2(RD_Instr[24:20]),
                            .A3(write_IR[11:7]),
                            .RD1(RD1_Top),
                            .RD2(RD2_Top)
    );

Sign_Extend Sign_Extend(
                        .In(RD_Instr),
                        .ImmSrc(ImmSrc),
                        .Imm_Ext(Imm_Ext_Top)
    );


Control_Unit_Top Control_Unit_Top(
                            .Op(RD_Instr[6:0]),
                            .ImmSrc(ImmSrc)
                            
    );

always @(posedge clk2 )
begin
Imm<=Imm_Ext_Top;
A<=RD1_Top;
B<=RD2_Top;
next_IR<=RD_Instr;
end
endmodule
