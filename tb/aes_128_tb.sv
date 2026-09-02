
module aes_128_tb();

// testbench signals
reg [127:0] key_tb_sig;
reg [127:0] data_tb_sig;

// input signals
reg clock_sig;
reg reset_sig;
reg faulty_sig;
reg [7:0] key_sig [3:0][3:0];
reg [7:0] data_sig [3:0][3:0];
reg en_FI;
reg mode_FI;
reg [1:0] ced_mode;
reg [3:0] ced_round;
reg [3:0] func_FI;
reg [3:0] round_FI;
reg [3:0] round_stop_FI;
reg [1:0] row_FI;
reg [1:0] column_FI;
reg [3:0] bit_index_FI;
// output signals
wire [7:0] ciphertext_sig [3:0][3:0];
wire done_sig;
wire error_FI;
wire fault_detected;
wire [3:0] fault_location;
reg [127:0] ciphertext;
string input_path;
string output_path;

// file handlers
integer data_file, scan_file, out_file, count;

// design under test
aes_128 DUT (
	.clock         (clock_sig), 
	.reset         (reset_sig), 
	.data          (data_sig), 
	.key           (key_sig), 
	.ciphertext    (ciphertext_sig), 
	.done          (done_sig), 
	.en_FI         (en_FI),
	.mode_FI       (mode_FI),
  .ced_mode      (ced_mode),
  .ced_round     (ced_round), 
	.func_FI       (func_FI),
	.round_FI      (round_FI),
	.round_stop_FI (round_stop_FI),
	.row_FI        (row_FI),
	.column_FI     (column_FI),
	.bit_index_FI  (bit_index_FI),
	.error_FI      (error_FI),
	.fault_detected(fault_detected),
	.fault_location(fault_location)
	);

initial begin
	if (!$value$plusargs("INPUT=%s", input_path))
		input_path = "tb/vectors/default.txt";
	if (!$value$plusargs("OUTPUT=%s", output_path))
		output_path = "build/ciphertext.txt";

	data_file = $fopen(input_path, "r");
	if (!data_file) begin
		$display("error opening input file for reading");
		$finish;
	end
	
	out_file = $fopen(output_path, "w");
	if (!out_file) begin
		$display("error opening output file for writing");
		$finish;
	end

	scan_file = $fscanf(data_file, "%x %x %x %x %x %x %x %x %x %x\n", 
		en_FI, mode_FI, ced_mode, ced_round, func_FI, round_FI, round_stop_FI, row_FI, column_FI, bit_index_FI); 
	#2
	
	scan_file = $fscanf(data_file, "%x\n", key_tb_sig);
	#2
	key_sig[3][3] = key_tb_sig[127:120];
	key_sig[2][3] = key_tb_sig[119:112];
	key_sig[1][3] = key_tb_sig[111:104];
	key_sig[0][3] = key_tb_sig[103:96];
	key_sig[3][2] = key_tb_sig[95:88];
	key_sig[2][2] = key_tb_sig[87:80];
	key_sig[1][2] = key_tb_sig[79:72];
	key_sig[0][2] = key_tb_sig[71:64];
	key_sig[3][1] = key_tb_sig[63:56];
	key_sig[2][1] = key_tb_sig[55:48];
	key_sig[1][1] = key_tb_sig[47:40];
	key_sig[0][1] = key_tb_sig[39:32];
	key_sig[3][0] = key_tb_sig[31:24];
	key_sig[2][0] = key_tb_sig[23:16];
	key_sig[1][0] = key_tb_sig[15:8];
	key_sig[0][0] = key_tb_sig[7:0];
	
	scan_file = $fscanf(data_file, "%x\n", data_tb_sig);
	#2
	data_sig[3][3] = data_tb_sig[127:120];
	data_sig[2][3] = data_tb_sig[119:112];
	data_sig[1][3] = data_tb_sig[111:104];
	data_sig[0][3] = data_tb_sig[103:96];
	data_sig[3][2] = data_tb_sig[95:88];
	data_sig[2][2] = data_tb_sig[87:80];
	data_sig[1][2] = data_tb_sig[79:72];
	data_sig[0][2] = data_tb_sig[71:64];
	data_sig[3][1] = data_tb_sig[63:56];
	data_sig[2][1] = data_tb_sig[55:48];
	data_sig[1][1] = data_tb_sig[47:40];
	data_sig[0][1] = data_tb_sig[39:32];
	data_sig[3][0] = data_tb_sig[31:24];
	data_sig[2][0] = data_tb_sig[23:16];
	data_sig[1][0] = data_tb_sig[15:8];
	data_sig[0][0] = data_tb_sig[7:0];
	
	clock_sig <= 1'b0;
	reset_sig <= 1'b0;
	#40;
	reset_sig <= 1'b1;
	#40;
	reset_sig <= 1'b0;
	count = 0;
	clock_sig <= 1'b0;

    $monitor("-%h-", ciphertext);	
	
	#2000
	
   ciphertext[127:120] = ciphertext_sig[3][3];
   ciphertext[119:112] = ciphertext_sig[2][3];
   ciphertext[111:104] = ciphertext_sig[1][3];
   ciphertext[103:096] = ciphertext_sig[0][3];
   ciphertext[095:088] = ciphertext_sig[3][2];
   ciphertext[087:080] = ciphertext_sig[2][2];
   ciphertext[079:072] = ciphertext_sig[1][2];
   ciphertext[071:064] = ciphertext_sig[0][2];
   ciphertext[063:056] = ciphertext_sig[3][1];
   ciphertext[055:048] = ciphertext_sig[2][1];
   ciphertext[047:040] = ciphertext_sig[1][1];
   ciphertext[039:032] = ciphertext_sig[0][1];
   ciphertext[031:024] = ciphertext_sig[3][0];
   ciphertext[023:016] = ciphertext_sig[2][0];
   ciphertext[015:008] = ciphertext_sig[1][0];
   ciphertext[007:000] = ciphertext_sig[0][0];
   
   $monitor("-%h-", ciphertext);
	
	$fwrite(out_file, "%x", ciphertext_sig[3][3]);
	$fwrite(out_file, "%x", ciphertext_sig[2][3]);
	$fwrite(out_file, "%x", ciphertext_sig[1][3]);
	$fwrite(out_file, "%x", ciphertext_sig[0][3]);
	$fwrite(out_file, "%x", ciphertext_sig[3][2]);
	$fwrite(out_file, "%x", ciphertext_sig[2][2]);
	$fwrite(out_file, "%x", ciphertext_sig[1][2]);
	$fwrite(out_file, "%x", ciphertext_sig[0][2]);
	$fwrite(out_file, "%x", ciphertext_sig[3][1]);
	$fwrite(out_file, "%x", ciphertext_sig[2][1]);
	$fwrite(out_file, "%x", ciphertext_sig[1][1]);
	$fwrite(out_file, "%x", ciphertext_sig[0][1]);
	$fwrite(out_file, "%x", ciphertext_sig[3][0]);
	$fwrite(out_file, "%x", ciphertext_sig[2][0]);
	$fwrite(out_file, "%x", ciphertext_sig[1][0]);
	$fwrite(out_file, "%x\n", ciphertext_sig[0][0]);
	
	$display("----------------------------------------");
	$display("Ciphertext: %032h", ciphertext);
	$display("Fault detected: %b (round %0d)", fault_detected, fault_location);
	$display("Fault-injector configuration error: %b", error_FI);
	$display("Done - ciphertext written to %s", output_path);
	$display("----------------------------------------");
  
	$finish;
		
end

always #20 clock_sig <= ~clock_sig;

endmodule
