class alu_mon;
alu_tx tx;
virtual alu_intf vif;
mailbox #(alu_tx) mon2scb;
mailbox #(alu_tx) mon2cov;
 
function new ();
 this.mon2scb=alu_cfg::mon2scb;
 this.mon2cov=alu_cfg::mon2cov;
 //this.vif = alu_cfg::vif;
endfunction   

 task run ();
  forever 
  begin 
    vif=alu_cfg::vif;  
    wait (!vif.rst)
     $display ("alu_mon::run");
        tx=new();
     @(posedge vif.clk)
      begin   
       tx.a=vif.a;
       tx.b=vif.b;
       tx.sel=vif.sel;
      end 
    @(posedge vif.clk)
       tx.out=vif.out;
       mon2scb.put(tx);
       mon2cov.put(tx);
   end 
endtask 
endclass
