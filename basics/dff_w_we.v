module dff_we #(
    parameter Width = 1
) (
    input clk_i,
    input rst_ni,
    input we_i,
    input [Width-1 : 0] i,
    output reg [Width-1 : 0] o
);

  always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      o <= 0;
    end else if (we_i) begin
      o <= i;
    end
  end
endmodule
