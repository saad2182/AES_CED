// Module to flatten and de-flatten input signals to&from arrays
module flat_deflat (
	input [7:0] sb_in_arr [3:0][3:0],    // 
	input [7:0] sr_in_arr [3:0][3:0] , // 
	input [7:0] mc_in_arr [3:0][3:0],
	input [7:0] kx_in_arr [3:0][3:0],
	input [127:0] sb_in_eff,
	input [127:0] sr_in_eff,
	input [127:0] mc_in_eff,
	input [127:0] kx_in_eff,
	output [127:0] sb_out_arr,
	output [127:0] sr_out_arr,
	output [127:0] mc_out_arr,
	output [127:0] kx_out_arr,
    output [7:0] sb_out_eff [3:0][3:0],
    output [7:0] sr_out_eff [3:0][3:0], 
	output [7:0] mc_out_eff [3:0][3:0],
    output [7:0] kx_out_eff [3:0][3:0]
);

// Flattening SBOX Signals
assign sb_out_arr[127:120] = sb_in_arr[3][3];
assign sb_out_arr[119:112] = sb_in_arr[2][3];
assign sb_out_arr[111:104] = sb_in_arr[1][3];
assign sb_out_arr[103:096] = sb_in_arr[0][3];
assign sb_out_arr[095:088] = sb_in_arr[3][2];
assign sb_out_arr[087:080] = sb_in_arr[2][2];
assign sb_out_arr[079:072] = sb_in_arr[1][2];
assign sb_out_arr[071:064] = sb_in_arr[0][2];
assign sb_out_arr[063:056] = sb_in_arr[3][1];
assign sb_out_arr[055:048] = sb_in_arr[2][1];
assign sb_out_arr[047:040] = sb_in_arr[1][1];
assign sb_out_arr[039:032] = sb_in_arr[0][1];
assign sb_out_arr[031:024] = sb_in_arr[3][0];
assign sb_out_arr[023:016] = sb_in_arr[2][0];
assign sb_out_arr[015:008] = sb_in_arr[1][0];
assign sb_out_arr[007:000] = sb_in_arr[0][0];

// De-Flattening SBOX Signals
assign sb_out_eff[3][3] = sb_in_eff[127:120];
assign sb_out_eff[2][3] = sb_in_eff[119:112];
assign sb_out_eff[1][3] = sb_in_eff[111:104];
assign sb_out_eff[0][3] = sb_in_eff[103:096];
assign sb_out_eff[3][2] = sb_in_eff[095:088];
assign sb_out_eff[2][2] = sb_in_eff[087:080];
assign sb_out_eff[1][2] = sb_in_eff[079:072];
assign sb_out_eff[0][2] = sb_in_eff[071:064];
assign sb_out_eff[3][1] = sb_in_eff[063:056];
assign sb_out_eff[2][1] = sb_in_eff[055:048];
assign sb_out_eff[1][1] = sb_in_eff[047:040];
assign sb_out_eff[0][1] = sb_in_eff[039:032];
assign sb_out_eff[3][0] = sb_in_eff[031:024];
assign sb_out_eff[2][0] = sb_in_eff[023:016];
assign sb_out_eff[1][0] = sb_in_eff[015:008];
assign sb_out_eff[0][0] = sb_in_eff[007:000]; 

// Flattening Shift Rows Signals
assign sr_out_arr[127:120] = sr_in_arr[3][3];
assign sr_out_arr[119:112] = sr_in_arr[2][3];
assign sr_out_arr[111:104] = sr_in_arr[1][3];
assign sr_out_arr[103:096] = sr_in_arr[0][3];
assign sr_out_arr[095:088] = sr_in_arr[3][2];
assign sr_out_arr[087:080] = sr_in_arr[2][2];
assign sr_out_arr[079:072] = sr_in_arr[1][2];
assign sr_out_arr[071:064] = sr_in_arr[0][2];
assign sr_out_arr[063:056] = sr_in_arr[3][1];
assign sr_out_arr[055:048] = sr_in_arr[2][1];
assign sr_out_arr[047:040] = sr_in_arr[1][1];
assign sr_out_arr[039:032] = sr_in_arr[0][1];
assign sr_out_arr[031:024] = sr_in_arr[3][0];
assign sr_out_arr[023:016] = sr_in_arr[2][0];
assign sr_out_arr[015:008] = sr_in_arr[1][0];
assign sr_out_arr[007:000] = sr_in_arr[0][0];

// De-Flattening Shift Rows Signals
assign sr_out_eff[3][3] = sr_in_eff[127:120];
assign sr_out_eff[2][3] = sr_in_eff[119:112];
assign sr_out_eff[1][3] = sr_in_eff[111:104];
assign sr_out_eff[0][3] = sr_in_eff[103:096];
assign sr_out_eff[3][2] = sr_in_eff[095:088];
assign sr_out_eff[2][2] = sr_in_eff[087:080];
assign sr_out_eff[1][2] = sr_in_eff[079:072];
assign sr_out_eff[0][2] = sr_in_eff[071:064];
assign sr_out_eff[3][1] = sr_in_eff[063:056];
assign sr_out_eff[2][1] = sr_in_eff[055:048];
assign sr_out_eff[1][1] = sr_in_eff[047:040];
assign sr_out_eff[0][1] = sr_in_eff[039:032];
assign sr_out_eff[3][0] = sr_in_eff[031:024];
assign sr_out_eff[2][0] = sr_in_eff[023:016];
assign sr_out_eff[1][0] = sr_in_eff[015:008];
assign sr_out_eff[0][0] = sr_in_eff[007:000]; 

// Flattening Mix Columns Signals
assign mc_out_arr[127:120] = mc_in_arr[3][3];
assign mc_out_arr[119:112] = mc_in_arr[2][3];
assign mc_out_arr[111:104] = mc_in_arr[1][3];
assign mc_out_arr[103:096] = mc_in_arr[0][3];
assign mc_out_arr[095:088] = mc_in_arr[3][2];
assign mc_out_arr[087:080] = mc_in_arr[2][2];
assign mc_out_arr[079:072] = mc_in_arr[1][2];
assign mc_out_arr[071:064] = mc_in_arr[0][2];
assign mc_out_arr[063:056] = mc_in_arr[3][1];
assign mc_out_arr[055:048] = mc_in_arr[2][1];
assign mc_out_arr[047:040] = mc_in_arr[1][1];
assign mc_out_arr[039:032] = mc_in_arr[0][1];
assign mc_out_arr[031:024] = mc_in_arr[3][0];
assign mc_out_arr[023:016] = mc_in_arr[2][0];
assign mc_out_arr[015:008] = mc_in_arr[1][0];
assign mc_out_arr[007:000] = mc_in_arr[0][0];

// De-Flattening Mix Columns Signals
assign mc_out_eff[3][3] = mc_in_eff[127:120];
assign mc_out_eff[2][3] = mc_in_eff[119:112];
assign mc_out_eff[1][3] = mc_in_eff[111:104];
assign mc_out_eff[0][3] = mc_in_eff[103:096];
assign mc_out_eff[3][2] = mc_in_eff[095:088];
assign mc_out_eff[2][2] = mc_in_eff[087:080];
assign mc_out_eff[1][2] = mc_in_eff[079:072];
assign mc_out_eff[0][2] = mc_in_eff[071:064];
assign mc_out_eff[3][1] = mc_in_eff[063:056];
assign mc_out_eff[2][1] = mc_in_eff[055:048];
assign mc_out_eff[1][1] = mc_in_eff[047:040];
assign mc_out_eff[0][1] = mc_in_eff[039:032];
assign mc_out_eff[3][0] = mc_in_eff[031:024];
assign mc_out_eff[2][0] = mc_in_eff[023:016];
assign mc_out_eff[1][0] = mc_in_eff[015:008];
assign mc_out_eff[0][0] = mc_in_eff[007:000]; 

// Flattening Key XOR Signals
assign kx_out_arr[127:120] = kx_in_arr[3][3];
assign kx_out_arr[119:112] = kx_in_arr[2][3];
assign kx_out_arr[111:104] = kx_in_arr[1][3];
assign kx_out_arr[103:096] = kx_in_arr[0][3];
assign kx_out_arr[095:088] = kx_in_arr[3][2];
assign kx_out_arr[087:080] = kx_in_arr[2][2];
assign kx_out_arr[079:072] = kx_in_arr[1][2];
assign kx_out_arr[071:064] = kx_in_arr[0][2];
assign kx_out_arr[063:056] = kx_in_arr[3][1];
assign kx_out_arr[055:048] = kx_in_arr[2][1];
assign kx_out_arr[047:040] = kx_in_arr[1][1];
assign kx_out_arr[039:032] = kx_in_arr[0][1];
assign kx_out_arr[031:024] = kx_in_arr[3][0];
assign kx_out_arr[023:016] = kx_in_arr[2][0];
assign kx_out_arr[015:008] = kx_in_arr[1][0];
assign kx_out_arr[007:000] = kx_in_arr[0][0];

// De-Flattening Key XOR Signals
assign kx_out_eff[3][3] = kx_in_eff[127:120];
assign kx_out_eff[2][3] = kx_in_eff[119:112];
assign kx_out_eff[1][3] = kx_in_eff[111:104];
assign kx_out_eff[0][3] = kx_in_eff[103:096];
assign kx_out_eff[3][2] = kx_in_eff[095:088];
assign kx_out_eff[2][2] = kx_in_eff[087:080];
assign kx_out_eff[1][2] = kx_in_eff[079:072];
assign kx_out_eff[0][2] = kx_in_eff[071:064];
assign kx_out_eff[3][1] = kx_in_eff[063:056];
assign kx_out_eff[2][1] = kx_in_eff[055:048];
assign kx_out_eff[1][1] = kx_in_eff[047:040];
assign kx_out_eff[0][1] = kx_in_eff[039:032];
assign kx_out_eff[3][0] = kx_in_eff[031:024];
assign kx_out_eff[2][0] = kx_in_eff[023:016];
assign kx_out_eff[1][0] = kx_in_eff[015:008];
assign kx_out_eff[0][0] = kx_in_eff[007:000]; 


endmodule

/*
	key_sig[3][3] = key_tb_sig[127:120];
	key_sig[2][3] = key_tb_sig[119:112];
	key_sig[1][3] = key_tb_sig[111:104];
	key_sig[0][3] = key_tb_sig[103:096];
	key_sig[3][2] = key_tb_sig[095:088];
	key_sig[2][2] = key_tb_sig[087:080];
	key_sig[1][2] = key_tb_sig[079:072];
	key_sig[0][2] = key_tb_sig[071:064];
	key_sig[3][1] = key_tb_sig[063:056];
	key_sig[2][1] = key_tb_sig[055:048];
	key_sig[1][1] = key_tb_sig[047:040];
	key_sig[0][1] = key_tb_sig[039:032];
	key_sig[3][0] = key_tb_sig[031:024];
	key_sig[2][0] = key_tb_sig[023:016];
	key_sig[1][0] = key_tb_sig[015:008];
	key_sig[0][0] = key_tb_sig[007:000];
*/