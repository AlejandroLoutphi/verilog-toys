`timescale 1ns / 1ps

`include "ripple_ctr.v"

module tb_ripple_ctr;
  localparam WIDTH = 4;
  reg clk_i;
  reg rst_ni;
  wire [WIDTH-1 : 0] o;

  ripple_ctr #(
      .Width(WIDTH)
  ) uut (
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      .o(o)
  );

  always #5 clk_i = ~clk_i;

  initial begin
    $dumpfile("tb_ripple_ctr.vcd");
    $dumpvars(0, tb_ripple_ctr);
    clk_i  <= 0;
    rst_ni <= 0;
    #1 rst_ni <= 1;
    #100 $finish;
  end
endmodule
