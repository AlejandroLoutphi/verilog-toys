`include "hadder.v"
`include "fadder.v"

module rc_adder #(
    parameter Width = 4
) (
    input [Width-1 : 0] a_i,
    input [Width-1 : 0] b_i,
    output [Width-1 : 0] result_o,
    output carry_o
);

  genvar width_c;

  wire [Width-1 : 0] adder_carries;
  assign carry_o = adder_carries[Width-1];

  hadder adder_0 (
      .a_i(a_i[0]),
      .b_i(b_i[0]),
      .result_o(result_o[0]),
      .carry_o(adder_carries[0])
  );

  generate
    for (width_c = 1; width_c < Width; width_c = width_c + 1) begin : g_fadders
      fadder adder_n (
          .a_i(a_i[width_c]),
          .b_i(b_i[width_c]),
          .carry_i(adder_carries[width_c-1]),
          .result_o(result_o[width_c]),
          .carry_o(adder_carries[width_c])
      );
    end
  endgenerate
endmodule
