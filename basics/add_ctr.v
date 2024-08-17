`include "dff.v"
`include "rc_adder_of_one.v"

module add_ctr #(
    parameter Width = 4
) (
    input clk_i,
    input rst_ni,
    output [Width-1 : 0] o
);

  wire [Width-1 : 0] adder_result;

  rc_adder_of_1 #(
      .Width(Width)
  ) adder0 (
      .i(o),
      .result_o(adder_result)
  );

  dff #(
      .Width(Width)
  ) dff0 (
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      .i(adder_result),
      .o(o)
  );
endmodule
