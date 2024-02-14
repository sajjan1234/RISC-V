module test_top;
reg clk1, clk2,rst;
integer k;
RISC mips(rst,clk1,clk2);
initial
begin

mips.f1.IM.IR_mem[0] = 32'b010000000101_00000_000_00001_0010011; // ADDI R1,R0,10  //00800093
mips.f1.IM.IR_mem[1] = 32'b000000000011_00000_000_00010_0010011; // ADDI R2,R0,20 //00300113
mips.f1.IM.IR_mem[2] = 32'b011111111101_00000_000_00011_0010011; // ADDI R3,R0,25 //01900193
//mips.f1.IM.IR_mem[3] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.
//mips.f1.IM.IR_mem[4] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.
//mips.f1.IM.IR_mem[5] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.
//mips.f1.IM.IR_mem[6] = 32'h0073e3b3; // OR R7,R7,R7 -- dummy instr.

//R-Type instruction
/*mips.f1.IM.IR_mem[3] = 32'b0000000_00001_00011_000_00100_0110011; 
mips.f1.IM.IR_mem[4] = 32'b0100000_00100_00011_000_00101_0110011;
mips.f1.IM.IR_mem[5] = 32'b0100000_00010_00101_101_01001_0110011; 
mips.f1.IM.IR_mem[6] = 32'b0000000_00010_00001_111_01000_0110011; 
mips.f1.IM.IR_mem[7] = 32'b0000000_00001_00100_001_00110_0110011; 
mips.f1.IM.IR_mem[8] = 32'b0000000_00010_00101_010_00111_0110011;*/

//I-type instruction
/*mips.f1.IM.IR_mem[3] = 32'b111111111100_00011_010_00100_0010011; //slti r4 r3 -4
mips.f1.IM.IR_mem[4] = 32'b111111111111_00011_011_00101_0010011; //sltiu r5 r3 -4 
mips.f1.IM.IR_mem[5] = 32'b000000000001_00011_100_00110_0010011; //xori r6 r3 1
mips.f1.IM.IR_mem[6] = 32'b000000000001_00011_110_00111_0010011; //ori r7 r3 1
mips.f1.IM.IR_mem[7] = 32'b000000000001_00011_111_01000_0010011; //andi r8 r3 1
mips.f1.IM.IR_mem[8] = 32'b000000000001_00011_001_01001_0010011; //slli r9 r3 1
mips.f1.IM.IR_mem[9] = 32'b000000000001_00011_101_01010_0010011; //srli r10 r3 1
mips.f1.IM.IR_mem[10] = 32'b010000000001_00011_101_01011_0010011; //srai r11 r3 1*/

//load instruction
/*mips.f1.IM.IR_mem[3] = 32'b000000000100_00010_000_00100_0000011; 
mips.f1.IM.IR_mem[4] = 32'b000000000100_00010_001_00101_0000011; 
mips.f1.IM.IR_mem[5] = 32'b000000000100_00010_010_00110_0000011; 
mips.f1.IM.IR_mem[6] = 32'b000000000100_00010_100_00111_0000011; 
mips.f1.IM.IR_mem[7] = 32'b000000000100_00010_101_01000_0000011;*/

//S-type instruction
mips.f1.IM.IR_mem[3] = 32'b0000000_00001_00010_000_00100_0100011;
mips.f1.IM.IR_mem[4] = 32'b0000000_00001_00010_001_00101_0100011;
mips.f1.IM.IR_mem[5] = 32'b0000000_00001_00010_010_00111_0100011;
//mips.m1.Instruction_Memory.IR_mem[8] = 32'hfc000000; // HLT

rst=1;
clk1 = 0; clk2 = 0;
#2
rst=0;
#5
rst=1;
repeat (40) // Generating two-phase clock
begin
#5 clk1 = 11; #5 clk1 = 0;
//#5 clk2 = 1; #5 clk2 = 0;
end


end

initial
begin
/*for (k=0; k<31; k=k+1)
mips.d1.Reg[k] = k;*/
#500

for(k=0; k<12; k=k+1)
$display ("R%1d - %d , M%1d -%d", k, mips.d1.Register_File.reg_memory[k],k,mips.m1.Data_Memory.mem[k]);
end


endmodule
