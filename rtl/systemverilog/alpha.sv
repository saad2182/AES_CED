// Module to perform alpha permutations
module alpha(
   input [7:0] in [3:0][3:0],
   output [7:0] out [3:0][3:0]
);

assign out[0][3] = in[0][0];
assign out[0][0] = in[0][1];
assign out[0][1] = in[0][2];
assign out[0][2] = in[0][3];
assign out[1][3] = in[1][0];
assign out[1][0] = in[1][1];
assign out[1][1] = in[1][2];
assign out[1][2] = in[1][3];
assign out[2][3] = in[2][0];
assign out[2][0] = in[2][1];
assign out[2][1] = in[2][2];
assign out[2][2] = in[2][3];
assign out[3][3] = in[3][0];
assign out[3][0] = in[3][1];
assign out[3][1] = in[3][2];
assign out[3][2] = in[3][3];

endmodule

