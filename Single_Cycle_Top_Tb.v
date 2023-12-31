`include "Single_Cycle_Top.v"

module RISC_V_tb();
    
    reg clk,rst;
    RISC_V RISC_V(.clk(clk),.rst(rst));

    initial begin
        $dumpfile("RISC V.vcd");
        $dumpvars(0);
    end

    initial
        begin
            clk = 1'b1;
            forever
            #5clk = ~clk;
        end
    
    initial
        begin
            rst <= 1'b0;
            #10;

            rst <=1'b1;
            #190;

            rst <= 1'b0;
            #30
            $finish;
        end
   
endmodule