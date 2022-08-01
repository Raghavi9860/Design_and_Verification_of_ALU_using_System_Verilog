interface alu_intf (input logic clk, input logic rst);
  logic [7:0] a,b;
  logic [1:0] sel;
  logic [7:0] out;
endinterface