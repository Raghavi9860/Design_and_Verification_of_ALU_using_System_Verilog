class alu_drv;
 alu_tx tx;
 virtual alu_intf vif;
 mailbox # (alu_tx) gen2drv;
   
  function new();
  this.gen2drv=alu_cfg::gen2drv;
  this.vif=alu_cfg::vif;
  endfunction  

  task run();
   forever 
     begin 
         wait (!vif.rst);
           gen2drv.get(tx);
         @ (posedge vif.clk)
            vif.a=tx.a;
            vif.b=tx.b;
            vif.sel=tx.sel; 
             $display("alu_drv::run");
       end 
  endtask 
endclass
 