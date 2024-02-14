 module ALU(A,B,Result,ALUControl);

    input signed [31:0]A,B;
    input [3:0]ALUControl;
    output reg signed [31:0]Result;
   reg [31:0]temp;
    wire Zero , Negative;

    always@(*)
        begin
            if(ALUControl == 4'b0000)        //Summation/Addition
                Result  = A + B; 

            else if(ALUControl == 4'b0001)   //Subtraction
                begin
                    //if(A > B)
                        Result  = A - B;
                   // else
                       // Result  = B - A;
                end

            else if(ALUControl == 4'b0010)   //Logical AND
                Result  = A & B;

            else if(ALUControl == 4'b0011)   //Logical OR
                Result  = A | B;

            else if(ALUControl == 4'b0100)   //Logical XOR
                Result = A ^ B;

            else if(ALUControl == 4'b0101)   //Set on less than
                Result = (A < B) ? 1 : 0;

            else if(ALUControl == 4'b0110)   //Shift left
                Result = A << B[4:0] ;

            else if(ALUControl == 4'b0111)   //Shift Right
                Result = A >> B[4:0] ;

            else if(ALUControl==4'b1000)   //unsigned less than
                Result=($unsigned(A)<B)?1:0;
            else if(ALUControl==4'b1001)
                begin
                 temp=A>>B[4:0];
                Result={A[31],temp[30:0]};
                end
        end

        assign Zero = &(~Result);

        assign Negative = Result[31];

endmodule
