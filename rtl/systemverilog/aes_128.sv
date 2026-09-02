
module aes_128 (
input clock,
input reset,
input [7:0] data [3:0][3:0],
input [7:0] key [3:0][3:0],
output [7:0] ciphertext [3:0][3:0],
output done,
input en_FI,
input mode_FI,
input [1:0] ced_mode,
input [3:0] ced_round,
input [3:0] func_FI,
input [3:0] round_FI,
input [3:0] round_stop_FI,
input [1:0] row_FI,
input [1:0] column_FI,
input [3:0] bit_index_FI,
output      error_FI,
//added signals
output		fault_detected,
output [3:0] fault_location
);

wire [127:0] data_in_sb, data_in_sr, data_in_mx, data_in_kx;
wire [127:0] data_out_sb, data_out_sr, data_out_mx, data_out_kx;
wire [7:0] keyXor_out_eff_sig_comb [3:0][3:0];
reg  [7:0] keyXor_out_sig_comb [3:0][3:0];
wire done_sig;
wire faulty_sig;
wire state;
wire clock_sig;
wire reset_sig;
wire [7:0] key_sig [10:0][3:0][3:0];
wire [7:0] data_sig [3:0][3:0];
wire [7:0] data_reg_sig [3:0][3:0];
wire [7:0] user_key_sig [3:0][3:0];
wire [7:0] key_round [3:0][3:0];
wire [7:0] keyXor_0_out_sig [3:0][3:0];
reg  [7:0] keyXor_0_out_eff_sig [3:0][3:0];
wire [7:0] keyXor_10_out_sig [3:0][3:0];
reg  [7:0] keyXor_10_out_eff_sig [3:0][3:0];
wire [7:0] keyXor_out_sig [3:0][3:0];
reg  [7:0] keyXor_out_eff_sig [3:0][3:0];
wire [7:0] sbox_out_sig [3:0][3:0];
wire [7:0] sbox_out_eff_sig [3:0][3:0];
wire [7:0] shiftRow_out_sig [3:0][3:0];
wire [7:0] shiftRow_out_eff_sig [3:0][3:0];
wire [7:0] mixColumn_out_sig [3:0][3:0];
wire [7:0] mixColumn_out_eff_sig [3:0][3:0];
wire [3:0] key_index;
wire [3:0] key_index_vector_sig;
wire [7:0] key_sig_0_eff [3:0][3:0];
wire [7:0] key_sig_10_eff[3:0][3:0];
wire [7:0] key_round_eff [3:0][3:0];
wire [7:0] sbox_eff[3:0][3:0];

//Added signals
wire [15:0] parity_16;

assign clock_sig = clock;
assign reset_sig = reset;
assign data_sig = data;
assign user_key_sig = key;
assign key_sig[0] = key;
assign key_round = key_sig[key_index];
assign ciphertext = data_reg_sig;
assign done = done_sig;
assign key_index = key_index_vector_sig;
/* You should build your components around the following input/output signals:-
-- data_reg_sig/sbox_out_eff_sig: input/output of sbox operation for rounds 1-9
-- sbox_out_eff_sig/shiftRow_out_eff_sig: input/output shiftrow operation for rounds 1-9
-- shiftRow_out_eff_sig/mixColumn_out_eff_sig: input/output of mixcolumn operation for rounds 1-9
-- mixColumn_out_eff_sig/keyXor_out_eff_sig : input/output of keyXor operation for rounds 1-9
*/
//state_machine state_machine_x (clock_sig, reset_sig, keyXor_0_out_eff_sig, keyXor_out_eff_sig, keyXor_10_out_sig, data_reg_sig, done_sig, key_index_vector_sig);
keyExpansion keyExpansion_x (user_key_sig,key_sig[1],key_sig[2],key_sig[3],key_sig[4],key_sig[5],key_sig[6],key_sig[7],key_sig[8],key_sig[9],key_sig[10]);
keyXor_128 keyXor_128_a (data_sig, key_sig_0_eff, keyXor_0_out_sig);
sbox_128 sbox_128_x (sbox_eff, sbox_out_sig);
shiftRow_128 shiftRow_128_x (sbox_out_eff_sig, shiftRow_out_sig);
mixColumn_128 mixColumn_128_x (shiftRow_out_eff_sig, mixColumn_out_sig);
keyXor_128 keyXor_128_b (mixColumn_out_eff_sig, key_round_eff, keyXor_out_sig);
keyXor_128 keyXor_128_c (shiftRow_out_eff_sig, key_sig_10_eff, keyXor_10_out_sig);
/*fault_injector fault_injector_x (faulty_sig, fault_round_sig, fault_function_sig, fault_word_sig, fault_byte_sig, fault_bit_sig, fault_word2_sig,
	fault_byte2_sig, fault_bit2_sig, key_index_vector_sig, keyXor_0_out_sig, keyXor_10_out_sig, keyXor_out_sig, sbox_out_sig,
	shiftRow_out_sig, mixColumn_out_sig, keyXor_0_out_eff_sig, keyXor_10_out_eff_sig, keyXor_out_eff_sig, sbox_out_eff_sig,
	shiftRow_out_eff_sig, mixColumn_out_eff_sig);*/
ced_controller ced_controller_x(clock_sig, reset_sig, ced_mode, ced_round, keyXor_0_out_sig, keyXor_10_out_sig, keyXor_out_sig, data_reg_sig, done_sig, key_index_vector_sig, fault_detected, fault_location,
            key_sig[0], key_round, key_sig[10], key_sig_0_eff, key_round_eff, key_sig_10_eff, data_sig, sbox_eff);

fault_injector fault_injector_x (en_FI,mode_FI,func_FI,round_FI,round_stop_FI,row_FI,column_FI,bit_index_FI,key_index_vector_sig,error_FI,
  data_in_sb,data_in_sr,data_in_mx,data_in_kx,
  data_out_sb,data_out_sr,data_out_mx,data_out_kx);

flat_deflat flat_deflat_x ( sbox_out_sig, mixColumn_out_sig, shiftRow_out_sig, keyXor_out_sig_comb, data_out_sb, data_out_sr, data_out_mx, data_out_kx,
    data_in_sb, data_in_sr, data_in_mx, data_in_kx, sbox_out_eff_sig, mixColumn_out_eff_sig, shiftRow_out_eff_sig, keyXor_out_eff_sig_comb);

always @(*) begin : proc_keys
  if(key_index_vector_sig == 4'd0) begin
  	keyXor_out_sig_comb = keyXor_0_out_sig;
  	keyXor_0_out_eff_sig = keyXor_out_eff_sig_comb;
  end
  else if(key_index_vector_sig < 4'd11) begin
  	keyXor_out_sig_comb = keyXor_out_sig;
  	keyXor_out_eff_sig = keyXor_out_eff_sig_comb;
  end
  else if(key_index_vector_sig == 4'd11) begin
  	keyXor_out_sig_comb = keyXor_10_out_sig;
  	keyXor_10_out_eff_sig = keyXor_out_eff_sig_comb;
  end
end

endmodule
