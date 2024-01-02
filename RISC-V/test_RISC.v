module test_top;
reg clk1, clk2,rst;
integer k;
RISC mips(rst,clk1,clk2);
initial
begin

mips.f1.IM.IR_mem[0] = 32'h00a00093; // ADDI R1,R0,10
mips.f1.IM.IR_mem[1] = 32'h01400113; // ADDI R2,R0,20
mips.f1.IM.IR_mem[2] = 32'h01900193; // ADDI R3,R0,25
mips.f1.IM.IR_mem[3] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.
mips.f1.IM.IR_mem[4] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.
mips.f1.IM.IR_mem[5] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.
mips.f1.IM.IR_mem[6] = 32'h00110233; // ADD R4,R1,R2
mips.f1.IM.IR_mem[7] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.
mips.f1.IM.IR_mem[8] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.
mips.f1.IM.IR_mem[9] = 32'h004182b3; // ADD R5,R4,R3
//mips.m1.Instruction_Memory.IR_mem[8] = 32'hfc000000; // HLT

rst=1;
clk1 = 0; clk2 = 0;
#2
rst=0;
#5
rst=1;
repeat (20) // Generating two-phase clock
begin
#5 clk1 = 1; #5 clk1 = 0;
#5 clk2 = 1; #5 clk2 = 0;
end


end

initial
begin
/*for (k=0; k<31; k=k+1)
mips.d1.Reg[k] = k;*/
#500

for(k=0; k<32; k=k+1)
$display ("R%1d - %2d", k, mips.d1.Register_File.reg_memory[k]);
end


endmodule
