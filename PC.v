module PC_Module(PC_Next,clk,rst,PC);
    input clk,rst;
    input [31:0]PC_Next;
    output [31:0]PC;
    reg [31:0]PC;

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            PC <= {32{1'b0}};
        else
            PC <= PC_Next;
    end
endmodule
