module ALU_Decoder(ALUOp,funct3,funct7,ALUControl);

    input [1:0]ALUOp;
    input [2:0]funct3;
    input [6:0]funct7;
    output reg [3:0]ALUControl;

    always @(*) 
        begin
            case (ALUOp)
                2'b00:
                    begin
                    ALUControl = 4'b0000 ; //lw,sw
                    end
                2'b01:
                    begin
                    ALUControl = 4'b0001 ; //beq
                    end
                2'b10:
                begin
                    case (funct3)
                        3'b000:
                            begin
                            if (funct7 == 7'h20) //{op[5],funct7[5]} == 2'b11
                                begin
                                ALUControl = 4'b0001 ; //sub
                                end
                            else
                                begin
                                ALUControl = 4'b0000 ; //add
                                end
                            end
                        3'b001:
                            begin
                                ALUControl = 4'b0110 ; //shift left (sll)
                            end 
                        3'b010:
                            begin
                                ALUControl = 4'b0101 ; //slt  //sltu is no implimented
                            end
                        3'b011:
         		    begin
                               ALUControl=4'b1000; //sltu 
                            end
                        3'b100:
                            begin
                                ALUControl = 4'b0100 ; //xor
                            end
                         3'b101:
                            begin
                              if(funct7==7'h20)
 				begin
				ALUControl = 4'b1001;//sra
                                end
                               else
				begin
                                ALUControl = 4'b0111 ; //shift right(srl)  //sra is not implimented
                                end
			     end
                         3'b110:
                            begin
                                ALUControl = 4'b0011 ; //or
                            end
                        3'b111:
                            begin
                                ALUControl = 4'b0010 ; //and
                            end               
                        default:
                            begin
                                ALUControl = 4'b0000 ;
                            end
                    endcase
                end

                2'b11:
                begin
                    case (funct3)
                        3'b000:
                            begin
                                ALUControl = 4'b0000 ; //add
                            end
                        3'b001:
                            begin
                                ALUControl = 4'b0110 ; //shift left (sll)
                            end 
                        3'b010:
                            begin
                                ALUControl = 4'b0101 ; //slt  //sltu is no implimented
                            end
                        3'b011:
         		    begin
                               ALUControl=4'b1000; //sltu 
                            end
                        3'b100:
                            begin
                                ALUControl = 4'b0100 ; //xor
                            end
                         3'b101:
                            begin
                              if(funct7==7'h20)
 				begin
				ALUControl = 4'b1001;//sra
                                end
                               else
				begin
                                ALUControl = 4'b0111 ; //shift right(srl)  //sra is not implimented
                                end
			     end
                         3'b110:
                            begin
                                ALUControl = 4'b0011 ; //or
                            end
                        3'b111:
                            begin
                                ALUControl = 4'b0010 ; //and
                            end               
                        default:
                            begin
                                ALUControl = 4'b0000 ;
                            end
                    endcase
                end
                default:
                    begin
                        ALUControl = 4'b0000 ;
                    end
            endcase
        end
endmodule