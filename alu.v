module alu(
           input [7:0] a,b,                 
           input [1:0] sel,
           input clk,rst,
           output reg [7:0] out
    );
     
    always @(posedge clk)
    begin
        if (rst)
           out<=0;
         else 
           begin 
        case(sel)
        2'b00: // Addition
           out = a + b ; 
        2'b01: // Subtraction
           out = a - b ;
        2'b10: // Multiplication
           out = a * b;
        2'b11: // Division
           out = a/b;
          default: out= a + b ; 
        endcase  
             end 
   end

endmodule
