
`timescale 1ns / 1ps

`include "dff.v"

module tb_dff;

  localparam WIDTH = 4;

  reg clk_i;
  reg rst_ni;
  reg [WIDTH-1 : 0] i;
  wire [WIDTH-1 : 0] o;

  dff #(
      .Width(WIDTH)
  ) uut (
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      .i(i),
      .o(o)
  );

  always #5 clk_i <= ~clk_i;

  initial begin
    $dumpfile("tb_dff.vcd");
    $dumpvars(0, tb_dff);
    clk_i <= 0;
    rst_ni <= 0;
    i <= 4'h5;
    #1 rst_ni <= 1;
    #9 i <= 4'h7;
    #3 i <= 4'h9;
    #4 i <= 4'h2;
    #2 i <= 4'h6;
    #5 i <= 4'h3;
    #9 i <= 4'h4;
    $finish;
  end
endmodule
