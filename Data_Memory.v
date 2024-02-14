module Data_Memory(clk,rst,WE,WD,A,RD);

    input clk,rst,WE;
    input [31:0]A;
    input [31:0]WD;
    output [31:0]RD;

    reg [31:0] mem [255:0];

    integer i;
    always @(negedge rst) 
        begin
            if (!rst)
                begin
                    for (i=0 ; i<256 ; i=i+1 )
                        begin
                            mem[i] <= i*30000 ;
                        end
                end
       end


      always@(A)      
         if (WE) 
            mem[A] <= WD ;
              
assign RD = mem[A] ;
endmodule