class alu_scb;
 mailbox #(alu_tx) mon2scb;
 alu_tx tx;
 
  function new();
   this.mon2scb=alu_cfg::mon2scb;
  endfunction 

 task run ();
  forever 
     begin 
      $display("alu_scb::run");
      mon2scb.get(tx);
      case (tx.sel)
     2'b00: begin 
            if (tx.a + tx.b == tx.out)
            $display("Addition test Passes");
             else 
             $display("Addition test FAILS");
             end 
     2'b01:  begin 
             if (tx.a- tx.b == tx.out)
             $display("Subtraction Test Paased");
              else
              $display ("Subtraction test FAILS");
              end     
     2'b10:  begin  
            if (tx.a * tx.b == tx.out)
             $display ("Multiplication test Passes");
             else
              $display ("Multioplication test FAILS");
             end    
     2'b11: begin 
             if (tx.a /tx.b == tx.out)
              $display ("Division test passes");
             else 
            $display("Division test FAILS");
             end 
    default: $display("SELECT DOES NOT HAVE A VALID VALUE"); 
   endcase
     end 
 endtask 
endclass 
