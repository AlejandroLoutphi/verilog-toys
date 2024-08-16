
`timescale 1ns / 1ps

`include "shift_reg.v"

module tb_shift_reg;
  localparam WIDTH = 8;
  localparam SIZE = 3;
  reg clk;
  reg we_i;
  reg rst_ni;
  reg [WIDTH-1 : 0] data_i;
  wire [WIDTH-1 : 0] data_o;

  shift_reg #(
      .Width(WIDTH),
      .Size (SIZE)
  ) uut (
      .clk_i (clk),
      .we_i  (we_i),
      .rst_ni(rst_ni),
      .data_i(data_i),
      .data_o(data_o)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("tb_shift_reg.vcd");
    $dumpvars(0, tb_shift_reg);
    clk <= 0;
    we_i <= 0;
    data_i <= 8'hf0;
    rst_ni <= 0;
    #1 rst_ni <= 1;
    #13 we_i <= 1;
    #10 data_i <= 8'ha0;
    #10 we_i <= 0;
    #5 data_i <= 8'h80;
    we_i <= 1;
    #10 data_i <= 8'h60;
    #10 data_i <= 8'h49;
    #10 data_i <= 8'h20;
    rst_ni <= 0;
    #10 data_i <= 8'h15;
    #10 data_i <= 8'h19;
    rst_ni <= 1;
    #10 data_i <= 8'hc3;
    $finish;
  end
endmodule
