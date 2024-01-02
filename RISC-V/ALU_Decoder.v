module ALU_Decoder(ALUOp,funct3,funct7,ALUControl);

    input [1:0]ALUOp;
    input [2:0]funct3;
    input [6:0]funct7;
    output reg [2:0]ALUControl;

    always @(*) 
        begin
            case (ALUOp)
                2'b00:
                    begin
                    ALUControl = 3'b000 ; //lw,sw
                    end
                2'b01:
                    begin
                    ALUControl = 3'b001 ; //beq
                    end
                2'b10:
                begin
                    case (funct3)
                        3'b000:
                            begin
                            if (funct7 == 7'h14) //{op[5],funct7[5]} == 2'b11
                                begin
                                ALUControl = 3'b001 ; //sub
                                end
                            else
                                begin
                                ALUControl = 3'b000 ; //add
                                end
                            end
                        3'b010:
                            begin
                                ALUControl = 3'b101 ; //slt
                            end
                        3'b110:
                            begin
                                ALUControl = 3'b011 ; //or
                            end
                        3'b111:
                            begin
                                ALUControl = 3'b010 ; //and
                            end
                        3'b100:
                            begin
                                ALUControl = 3'b100 ; //xor
                            end
                        3'b001:
                            begin
                                ALUControl = 3'b110 ; //shift left 
                            end
                        3'b101:
                            begin
                                ALUControl = 3'b111 ; //shift right
                            end
                        default:
                            begin
                                ALUControl = 3'b000 ;
                            end
                    endcase
                end
                default:
                    begin
                        ALUControl = 3'b000 ;
                    end
            endcase
        end
endmodule