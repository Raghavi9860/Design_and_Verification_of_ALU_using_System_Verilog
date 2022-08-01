class alu_cfg;
static mailbox # (alu_tx) gen2drv=new(); 
static mailbox # (alu_tx) mon2scb=new();
static mailbox # (alu_tx) mon2cov=new();
static virtual alu_intf vif;
endclass 