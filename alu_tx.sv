class alu_tx;
  rand  logic [7:0] a;
  rand  logic [7:0] b;
  rand  logic [1:0] sel;
        logic [7:0] out ;

  function print();
     $display ("I AM IN ALU_TX");
     $display ("value for a= %0d,b=%0d ,sel=%0d and out=%0d",a,b,sel,out); 
   endfunction 
 
constraint a_greater_b {a > b;}
constraint b_not_eqaul_zero {b>0;}

endclass 
  