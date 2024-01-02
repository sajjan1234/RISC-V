module ALU(A,B,Result,ALUControl);

    input [31:0]A,B;
    input [2:0]ALUControl;
    output reg [31:0]Result;

    wire Zero , Negative;

    always@(*)
        begin
            if(ALUControl == 3'b000)        //Summation/Addition
                Result  = A + B; 

            else if(ALUControl == 3'b001)   //Subtraction
                begin
                    if(A > B)
                        Result  = A - B;
                    else
                        Result  = B - A;
                end

            else if(ALUControl == 3'b010)   //Logical AND
                Result  = A & B;

            else if(ALUControl == 3'b011)   //Logical OR
                Result  = A | B;

            else if(ALUControl == 3'b100)   //Logical XOR
                Result = A ^ B;

            else if(ALUControl == 3'b101)   //Set on less than
                Result = (A < B) ? 1 : 0;

            else if(ALUControl == 3'b110)   //Shift left
                Result = A << B ;

            else if(ALUControl == 3'b111)   //Shift Right
                Result = A >> B ;
        end

        assign Zero = &(~Result);

        assign Negative = Result[31];

endmodule
