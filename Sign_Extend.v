module Sign_Extend (In,Imm_Ext,ImmSrc);

    input [31:0]In;
    input [1:0]ImmSrc;
    output reg signed [31:0]Imm_Ext;

    always @(*) 
        begin
            case (ImmSrc)
                2'b00: //-- I-instructions
                    begin
                        Imm_Ext = $signed({ {20{In[31]}} , In[31:20] }) ;
                    end
                2'b01: //-- S-instructions
                    begin
                        Imm_Ext = $signed({ {20{In[31]}} , In[31:25] , In[11:7] }) ;
                    end
                2'b10: //-- B-instructions
                    begin
                        Imm_Ext = $signed({{20{In[31]}} , In[7] , In[30:25] , In[11:8] , 1'b0}) ;
                    end
                default:
                    begin
                        Imm_Ext = 32'b0 ;
                    end
        endcase
    end
                                
endmodule