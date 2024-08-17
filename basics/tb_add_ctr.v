`timescale 1ns / 1ps

`include "add_ctr.v"

module tb_add_ctr;
  localparam WIDTH = 4;
  reg clk_i;
  reg rst_ni;
  wire [WIDTH-1 : 0] o;

  add_ctr #(
      .Width(WIDTH)
  ) uut (
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      .o(o)
  );

  always #5 clk_i = ~clk_i;

  initial begin
    $dumpfile("tb_add_ctr.vcd");
    $dumpvars(0, tb_add_ctr);
    clk_i  <= 0;
    rst_ni <= 0;
    #1 rst_ni <= 1;
    #100 $finish;
  end
endmodule
