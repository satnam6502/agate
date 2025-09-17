module adder16(
  input  logic [15:0] x,
  input  logic [15:0] y,
  output logic [16:0] sum);

  logic [15:0] vec0;
  logic [15:0] vec1;
  logic [16:0] vec2;
  assign sum = vec2;
  assign vec2 = vec0 + vec1;
  assign vec1 = y;
  assign vec0 = x;
endmodule: adder16