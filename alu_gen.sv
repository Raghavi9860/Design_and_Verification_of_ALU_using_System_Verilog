typedef class alu_cfg; 
class alu_gen;
alu_tx tx;
mailbox #(alu_tx) gen2drv;

function new ();
this.gen2drv=alu_cfg::gen2drv;
endfunction   


task run();
 begin 
 for (int i=0;i<=15; i++)
   begin 
    tx=new();
    assert(tx.randomize());
    $display ("I am in the ALU_GEN");
     tx.print();
      gen2drv.put(tx);
     $display ("PACKET NUMBER %0d ",i);
     end 
 end     
endtask 
endclass 
