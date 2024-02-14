`include "Single_Cycle_Top.v"

module RISC_V_tb();
    
    reg clk,rst;
    RISC_V RISC_V(.clk(clk),.rst(rst));

    /*initial begin
        //$dumpfile("RISC_V.vcd");
        //$dumpvars(0);
    end*/

    initial
        begin
            clk = 1'b1;
            forever
            #5 clk = ~clk;
        end
    
    initial
        begin
            rst <= 1'b0;
            #10;

            rst <=1'b1;
            #190;

            //rst <= 1'b0;
            //#30
            //$finish;
        end

#1000
for(k=0; k<10; k=k+1)
$display ("R%1d - %2d", k, mips.in.Reg[k]);
end
   
endmodule
