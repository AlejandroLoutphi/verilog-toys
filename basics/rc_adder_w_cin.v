`include "fadder.v"

module rc_adder_w_cin #(
    parameter Width = 4
) (
    input [Width-1 : 0] a_i,
    input [Width-1 : 0] b_i,
    output carry_i,
    output [Width-1 : 0] result_o,
    output carry_o
);

  genvar width_c;

  wire [Width : 0] adder_carries;
  assign carry_o = adder_carries[Width];

  generate
    for (width_c = 0; width_c < Width; width_c = width_c + 1) begin : g_fadders
      fadder adder_n (
          .a_i(a_i[width_c]),
          .b_i(b_i[width_c]),
          .carry_i(adder_carries[width_c]),
          .result_o(result_o[width_c]),
          .carry_o(adder_carries[width_c+1])
      );
    end
  endgenerate
endmodule
