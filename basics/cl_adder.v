module cl_adder #(
    parameter Width = 4
) (
    input [Width-1 : 0] a_i,
    input [Width-1 : 0] b_i,
    output [Width-1 : 0] result_o,
    output carry_o
);
  genvar width_c;

  wire [Width-1 : 0] gen_carry;
  wire [Width-1 : 0] prop_carry;
  assign gen_carry  = a_i & b_i;
  assign prop_carry = a_i | b_i;

  wire [Width-1 : 0] has_carry;
  assign has_carry[0] = gen_carry[0];
  assign result_o[0] = a_i[0] ^ b_i[0];
  assign carry_o = has_carry[Width-1];
  generate
    for (width_c = 1; width_c < Width; width_c = width_c + 1) begin : g_adder
      assign result_o[width_c] = a_i[width_c] ^ b_i[width_c] ^ has_carry[width_c-1];
      assign has_carry[width_c] = gen_carry[width_c] | (has_carry[width_c-1] & prop_carry[width_c]);
    end
  endgenerate
endmodule
