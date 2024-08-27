`timescale 1ns / 1ps

`include "cl_adder_w_cin.v"

module tb_cl_adder_w_cin;
  localparam WIDTH = 4;
  reg [WIDTH-1 : 0] a_i;
  reg [WIDTH-1 : 0] b_i;
  reg carry_i;
  wire [WIDTH-1 : 0] result_o;
  wire carry_o;

  cl_adder_w_cin #(
      .Width(WIDTH)
  ) uut (
      .a_i(a_i),
      .b_i(b_i),
      .carry_i(carry_i),
      .result_o(result_o),
      .carry_o(carry_o)
  );

  initial begin
    $dumpfile("tb_cl_adder_w_cin.vcd");
    $dumpvars(0, tb_cl_adder_w_cin);
    a_i <= 4'h4;
    b_i <= 4'hf;
    carry_i <= 1'b1;
    #100 $finish;
  end
endmodule
