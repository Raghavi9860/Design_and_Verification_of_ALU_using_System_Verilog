module alu_top();
  logic clk,rst;
   alu_intf intf (clk,rst);
   alu_tb tb ();
   alu a1 (intf.a,intf.b,intf.sel,clk,rst,intf.out);
   
   initial
    clk=0;
    always 
   #5 clk=~clk;
  
  initial 
    begin 
      rst=1;
   #10 rst=0;
     end 
    
  initial 
     begin 
    alu_cfg::vif=intf; 
    end 
endmodule 
