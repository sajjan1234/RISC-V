module Data_Memory(clk,rst,WE,WD,A,RD);

    input clk,rst,WE;
    input [31:0]A;
    input [31:0]WD;
    output [31:0]RD;

    reg [31:0] mem [255:0];

    integer i;
    always @(posedge clk) 
        begin
            if (rst)
                begin
                    for (i=0 ; i<256 ; i=i+1)
                        begin
                            mem[i] <= 32'b0 ;
                        end
                end
            else if (WE) 
                    begin
                        mem[A] <= WD ;
                    end
        end
    assign RD = mem[A] ;
endmodule