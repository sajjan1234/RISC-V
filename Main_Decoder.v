module Main_Decoder(Op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

    input  [6:0] Op ;
    output reg Branch ;
    output reg ResultSrc ; 
    output reg MemWrite ;
    output reg ALUSrc ;
    output reg [1:0] ImmSrc ; 
    output reg RegWrite ;
    output reg [1:0] ALUOp;

    always @(*) 
        begin
            case (Op)
            //-- R-instructions
            7'b0110011: //add, sub, and, or, xor, slt, shift right, shift left
                begin
                    Branch = 1'b0 ;
                    ResultSrc = 1'b0 ;
                    MemWrite = 1'b0 ;
                    ALUSrc = 1'b0 ;
                    ImmSrc = 2'b00 ;
                    RegWrite = 1'b1 ;
                    ALUOp = 2'b10 ;
                end
            //-- I-instructions
            7'b0010011: //addi, andi, ori, xori, shift left, shift right, slt
                begin
                Branch = 1'b0 ;
                ResultSrc = 1'b0 ;
                MemWrite = 1'b0 ;
                ALUSrc = 1'b1 ;
                ImmSrc = 2'b00 ;
                RegWrite = 1'b1 ;
                ALUOp = 2'b10 ;
                end
            7'b0000011: //lw
                begin
                Branch = 1'b0 ;
                ResultSrc = 2'b1 ;
                MemWrite = 1'b0 ;
                ALUSrc = 1'b1 ;
                ImmSrc = 2'b00 ; 
                RegWrite = 1'b1 ;
                ALUOp = 2'b00 ;
                end
            //-- B-instructions
            7'b1100011: //beq,bne
                begin
                Branch = 1'b1 ;
                ResultSrc = 1'b0 ;
                MemWrite = 1'b0 ;
                ALUSrc = 1'b0 ;
                ImmSrc = 2'b10 ;
                RegWrite = 1'b0 ;
                ALUOp = 2'b01 ;
                end
            //-- S-instructions
            7'b0100011: //sw
                begin
                Branch = 1'b0 ;
                ResultSrc = 1'b0 ;
                MemWrite = 1'b1 ;
                ALUSrc = 1'b1 ;
                ImmSrc = 2'b01 ;
                RegWrite = 1'b0 ;
                ALUOp = 2'b00 ;
                end
            default:
                begin
                Branch = 1'b0 ;
                ResultSrc = 1'b0 ;
                MemWrite = 1'b0 ;
                ALUSrc = 1'b0 ;
                ImmSrc = 2'b00 ;
                RegWrite = 1'b0 ;
                ALUOp = 2'b00 ;
                end
            endcase
        end

endmodule