// Module to perform State Machine operation for AES along with CED //
module ced_controller (
	input     clk,                           // Clock
	input     rst,                           // Asynchronous reset active low
	input [1:0] ced_mode,                    // Input Mode controller to determine which way the state machine will work
	input [3:0] ced_round,                   // Determines which round to repeat in CED Mode 2
	input [7:0] keyXor_0_eff_sig [3:0][3:0], // Effective fault injected input from initial permutation / round 0
	input [7:0] keyXor_10_sig [3:0][3:0],    // Effective input from round 10
	input [7:0] keyXor_out_eff_sig[3:0][3:0],// Effective fault injected input from rounds 1 to 9
	output     [7:0] data_reg_sig [3:0][3:0],// Output from this module as "state" register output from AES rounds
	output      done_sig,                    // Output signal to state that the AES rounds are done
	output     [3:0] key_index_vector_sig,   // Output nibble for fault injector to track the AES round iteration
	output reg fault_detected,               // Output signal to show that a fault has been detected by the CED
	output     [3:0] fault_location,         // output signal to show where the fault has been detected by the CED
	input [7:0] key_sig_0_eff_in[3:0][3:0],
	input [7:0] key_round_eff_in[3:0][3:0],
	input [7:0] key_sig_10_eff_in[3:0][3:0],
	output[7:0] key_sig_0_eff_out[3:0][3:0],
	output[7:0] key_round_eff_out[3:0][3:0],
	output[7:0] key_sig_10_eff_out[3:0][3:0],
	input [7:0] text_in[3:0][3:0],
	output[7:0] sbox_out[3:0][3:0]
);

//Local registers
reg [7:0]   state_reg[3:0][3:0];
reg [3:0]   key_index;
reg         done;
reg         state;
reg         repeat_ced;
reg [7:0] key_0_out[3:0][3:0];
reg [7:0] key_round_out[3:0][3:0];
reg [7:0] key_10_out[3:0][3:0];
reg [7:0] sbox_out_eff[3:0][3:0];

// Local Wires
wire [7:0] keyXor_0_eff_sig_per[3:0][3:0];
wire [7:0] keyXor_out_eff_sig_per[3:0][3:0];
wire [7:0] keyXor_10_sig_per[3:0][3:0];
wire [7:0] keyXor_0_eff_sig_save[3:0][3:0];
wire [7:0] keyXor_out_eff_sig_save[3:0][3:0];
wire [7:0] keyXor_10_sig_save[3:0][3:0];
wire [7:0] keyXor_0_eff_sig_ced[3:0][3:0];
wire [7:0] keyXor_out_eff_sig_ced[3:0][3:0];
wire [7:0] keyXor_10_sig_ced[3:0][3:0];
wire [7:0] key_0_in_per[3:0][3:0];
wire [7:0] key_round_in_per[3:0][3:0];
wire [7:0] key_10_in_per[3:0][3:0];
wire [7:0] sbox_in_per[3:0][3:0];
wire [7:0] zeros[3:0][3:0];
reg [7:0] prev_round_out_key0[3:0][3:0];
wire [7:0] prev_round_out_per_key0[3:0][3:0];
reg [7:0] prev_round_out_keys[3:0][3:0];
reg [7:0] prev_round_out_keys_new[3:0][3:0];
wire [7:0] prev_round_out_per_keys[3:0][3:0];
wire [7:0] prev_round_out_per_keys_new[3:0][3:0];
reg [7:0] prev_round_out_key10[3:0][3:0];
wire [7:0] prev_round_out_per_key10[3:0][3:0];
wire       cmp_key_0, cmp_key_10, cmp_key_out;
wire repeat_ced_mode2;

// Assignment operations
assign data_reg_sig = state_reg;
assign key_index_vector_sig = key_index;
assign done_sig = done;

assign fault_location = fault_detected ? key_index : fault_location;

assign keyXor_0_eff_sig_save = repeat_ced ? keyXor_0_eff_sig : keyXor_0_eff_sig_save;
assign keyXor_out_eff_sig_save = repeat_ced ? keyXor_out_eff_sig : keyXor_out_eff_sig;
assign keyXor_10_sig_save = repeat_ced ? keyXor_10_sig : keyXor_10_sig_save;

assign key_sig_0_eff_out = key_0_out;
assign key_round_eff_out = key_round_out;
assign key_sig_10_eff_out = key_10_out;
assign sbox_out = sbox_out_eff;

assign repeat_ced_mode2 = (ced_round == key_index) ? 1'b1 : 1'b0;

//assign prev_round_out_key0 = repeat_ced ? keyXor_0_eff_sig : prev_round_out_key0;
//assign prev_round_out_keys = repeat_ced ? keyXor_out_eff_sig : prev_round_out_keys;
//assign prev_round_out_key10 = repeat_ced ? keyXor_10_sig : prev_round_out_key10;


always @(posedge clk) begin : proc_state_reg
	if(rst) begin
		key_index <= 4'd0;
		done      <= 1'b0;
		state     <= 1'b1;
		repeat_ced <= 1'b0;
		state_reg <= zeros;
		prev_round_out_key0 <= zeros;
		prev_round_out_keys <= zeros;
		prev_round_out_key10 <= zeros;
		prev_round_out_keys_new <= zeros;
	end 
    else if (done) begin
	    key_index <= 4'd12;
    end
	else begin
		if(state == 1'b1) begin
			if(ced_mode == 2'b00) begin // Normal AES round
				if(key_index == 4'd0) begin
					repeat_ced <= 1'b0;
					state_reg <= keyXor_0_eff_sig;
					key_0_out <= key_sig_0_eff_in;
				end
				else if(key_index < 4'd11) begin
					repeat_ced <= 1'b0;
					state_reg <= keyXor_out_eff_sig;
					key_round_out <= key_round_eff_in;
				end
				else if(key_index == 4'd11) begin
					repeat_ced <= 1'b0;
					state_reg <= keyXor_10_sig;
					key_10_out <= key_sig_10_eff_in;
					done      <= 1'b1;
				end
				state <= 1'b0;
			end
			/////////////////////////////////////////////////////////////////////////////////////////////
			else if(ced_mode == 2'b01) begin
				/* AES Rounds with 1 time repetition for CED */
				if(key_index == 4'd0 && ~repeat_ced) begin
					repeat_ced <= 1'b1; //repeat this round again
					state_reg <= keyXor_0_eff_sig; //output is initial permutation output
					key_0_out <= key_sig_0_eff_in; //key for round 0 is same as key_sig[0]
					//sbox_out_eff <= text_in; //should be text in
					prev_round_out_key0 <= keyXor_0_eff_sig;
				state <= 1'b0;
				end
				else if(key_index == 4'd0 && repeat_ced) begin
					repeat_ced <= 1'b0;  //do not repeat this round again
					//sbox_out_eff <= prev_round_out_per_key0; //sbox input is permutated previous round output
					state_reg <= keyXor_0_eff_sig; //output is repeated initial permuattion round
					key_0_out <= key_0_in_per; //key for round 0 is permutated key_sig[0]
					prev_round_out_keys_new <= prev_round_out_key0;
					if(cmp_key_0 == 1'b1) begin //fault detection logic
						fault_detected <= 1'b1;
					end
					else begin
						fault_detected <= 1'b0;
					end
				state <= 1'b0;
				end
				else if(key_index < 4'd11 && ~repeat_ced) begin
					repeat_ced <= 1'b1;  //repeat this round in the next state clock cycle
					state_reg <= keyXor_out_eff_sig; 
					key_round_out <= key_round_eff_in;
					prev_round_out_keys <= keyXor_out_eff_sig;
					prev_round_out_key10 <= keyXor_out_eff_sig;
					if(key_index == 4'd1) begin
						sbox_out_eff <= prev_round_out_keys_new; //prev_round_out_key0
					end
					else begin
					    sbox_out_eff <= prev_round_out_keys;
					end 
				state <= 1'b0;
				end
				else if(key_index < 4'd11 && repeat_ced) begin
					repeat_ced = 1'b0;
					state_reg <= keyXor_out_eff_sig;
					key_round_out <= key_round_in_per;
					if(key_index == 4'd1) begin
						sbox_out_eff <= prev_round_out_per_keys_new;//round out from round 0 permutated
					end
					else begin 
						sbox_out_eff <= prev_round_out_per_keys;;
					end
					if(cmp_key_out == 1'b1) begin
						fault_detected <= 1'b1;
					end
					else begin
						fault_detected <= 1'b0;
					end
				state <= 1'b0;
				end
				else if(key_index == 4'd11 && ~repeat_ced) begin
					repeat_ced = 1'b1;
					state_reg <= keyXor_10_sig;
					key_10_out <= key_sig_10_eff_in;
					sbox_out_eff <= prev_round_out_key10;
				state <= 1'b0;
				end
				else if(key_index == 4'd11 && repeat_ced) begin
					repeat_ced = 1'b0;
					state_reg <= keyXor_10_sig;
					sbox_out_eff <= prev_round_out_per_key10 ;
					key_10_out <= key_10_in_per;
					if(cmp_key_10 == 1'b1) begin
						fault_detected <= 1'b1;
					end
					else begin
						fault_detected <= 1'b0;
					end
				state <= 1'b0;
				end
			end
			//////////////////////////////////////////////////////////////////////////////////////////
			else if(ced_mode == 2'b10) begin
				/*AES Rounds with selected CED approach*/
				if(key_index == 4'd0 && ~repeat_ced_mode2) begin
					state_reg <= keyXor_0_eff_sig;
					key_0_out <= key_sig_0_eff_in;
				state <= 1'b1;
				end
				else if(key_index == 4'd0 && repeat_ced_mode2) begin
					state_reg <= keyXor_0_eff_sig_per;
					if(cmp_key_0 == 1'b1) begin
						fault_detected <= 1'b1;
					end
					else begin
						fault_detected <= 1'b0;
					end
				state <= 1'b1;
				end
				else if(key_index < 4'd11 && ~repeat_ced_mode2) begin
					state_reg <= keyXor_out_eff_sig;
					key_round_out <= key_round_eff_in;
				state <= 1'b1;
				end
				else if(key_index < 4'd11 && repeat_ced_mode2) begin
					state_reg <= keyXor_out_eff_sig_per;
					if(cmp_key_out == 1'b1) begin
						fault_detected <= 1'b1;
					end
					else begin
						fault_detected <= 1'b0;
					end
				state <= 1'b1;
				end
				else if(key_index == 4'd11 && ~repeat_ced_mode2) begin
					state_reg <= keyXor_10_sig;
					key_10_out <= key_sig_10_eff_in;
				state <= 1'b1;
				end
				else if(key_index == 4'd11 && repeat_ced_mode2) begin
					state_reg <= keyXor_10_sig_per;
					if(cmp_key_10 == 1'b1) begin
						fault_detected <= 1'b1;
					end
					else begin
						fault_detected <= 1'b0;
					end
				state <= 1'b1;
				end
			end
			else begin
                key_index <= 4'd0;
                done <= 1'b0;
			end
		end
		///////////////////////////////////////////////////////////////////////////////////////////////
		else if(state == 1'b0 && done == 1'b0 && ced_mode == 2'b00) begin
			 state <= 1'b1;
			 key_index <= key_index + 1;
		end
		else if(state == 1'b0 && done == 1'b0 && ced_mode == 2'b01) begin
			 if(repeat_ced) begin
			 	state <= 1'b1;
			 end
			 else begin
			 	state <= 1'b1;
			 	key_index <= key_index + 1;
			 end
		end
		else if(state == 1'b0 && done == 1'b0 && ced_mode == 2'b10) begin
			if(repeat_ced_mode2) begin
			 	state <= 1'b0;
			 	repeat_ced = 1'b1;
			 end
			 else begin
			 	state <= 1'b0;
			 	key_index <= key_index + 1;
			 end		
		end
	end
end



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Alpha and Inverse Alpha Permutations
//

alpha alpha_data_0 (prev_round_out_key0, prev_round_out_per_key0);
alpha alpha_data_out (prev_round_out_keys, prev_round_out_per_keys);
alpha alpha_data_10 (prev_round_out_key10, prev_round_out_per_key10);

alpha alpha_data_new(prev_round_out_keys_new, prev_round_out_per_keys_new);


alpha alpha_key_in_0 (key_sig_0_eff_in, key_0_in_per);
alpha alpha_key_in_round (key_round_eff_in, key_round_in_per);
alpha alpha_key_in_10 (key_sig_10_eff_in, key_10_in_per);


inv_alpha alpha_key_0_ced (keyXor_0_eff_sig, keyXor_0_eff_sig_ced);
inv_alpha alpha_key_out_ced (keyXor_out_eff_sig, keyXor_out_eff_sig_ced);
inv_alpha alpha_key_10_ced (keyXor_10_sig, keyXor_10_sig_ced);


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   CED Operations
//

assign cmp_key_0 = (keyXor_0_eff_sig_save == keyXor_0_eff_sig_ced) ? 1'b0 : 1'b1; 
assign cmp_key_out = (keyXor_out_eff_sig_save == keyXor_out_eff_sig_ced) ? 1'b0 : 1'b1; 
assign cmp_key_10 = (keyXor_10_sig_save == keyXor_10_sig_ced) ? 1'b0 : 1'b1; 


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//    MISC
//

assign zeros[0][0] = 8'd0;
assign zeros[0][1] = 8'd0;
assign zeros[0][2] = 8'd0;
assign zeros[0][3] = 8'd0;
assign zeros[1][0] = 8'd0;
assign zeros[1][1] = 8'd0;
assign zeros[1][2] = 8'd0;
assign zeros[1][3] = 8'd0;
assign zeros[2][0] = 8'd0;
assign zeros[2][1] = 8'd0;
assign zeros[2][2] = 8'd0;
assign zeros[2][3] = 8'd0;
assign zeros[3][0] = 8'd0;
assign zeros[3][1] = 8'd0;
assign zeros[3][2] = 8'd0;
assign zeros[3][3] = 8'd0;



endmodule
