module Mux (a,b,s,c);

    input [31:0]a,b;
    input s;
    output reg [31:0]c;

    always @(*) 
        begin
            case (s)
                1'b0:
                    begin
                        c = a ;
                    end
                1'b1:
                    begin
                        c = b ;
                    end
                default:
                    begin
                        c = 32'b0 ;
                    end
            endcase
        end

    
endmodule