module twoSorter8(
  input  logic [7:0] x,
  input  logic [7:0] y,
  output logic [7:0] lower,
  output logic [7:0] higher);
  logic net0;

  logic [7:0] vec0;
  logic [7:0] vec1;
  logic [7:0] vec2;
  logic [7:0] vec3;
  assign higher = vec3;
  assign lower = vec2;
  assign vec3 = net0 ? vec1 : vec0;
  assign vec2 = net0 ? vec0 : vec1;
  assign net0 = vec0 < vec1;
  assign vec1 = y;
  assign vec0 = x;
endmodule: twoSorter8