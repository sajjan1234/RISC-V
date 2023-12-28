`include "Pipeline_top.v"

module Pipeline_tb();
    
    reg clk,rst;
    pipeline_top RISC_V_pipeline(.clk(clk),.rst(rst));

    initial begin
        $dumpfile("RISC_V_pipeline.vcd");
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
