module fatch(next_IR,rst,clk1);
input rst,clk1;
output reg [31:0]next_IR;

wire [31:0]PC_Top,RD_Instr,Next_PC;


PC_Module PC(
        .clk(clk1),
        .rst(rst),
        .PC(PC_Top),
        .PC_Next(Next_PC)
     );
PC_Adder PC_Adder(
                    .a(PC_Top),
                    .b(32'd1),
                    .c(Next_PC)
    );

Instruction_Memory IM(
                            .PC(PC_Top),
                            .IR(RD_Instr)
    );

always @(posedge clk1)
begin 
next_IR<=RD_Instr;
end
endmodule