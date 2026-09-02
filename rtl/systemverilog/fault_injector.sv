/*
*
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
* Verilog File to Inject Transient and Permanent faults into AES core
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
*
*/
module fault_injector (en,mode,func,round,round_stop,row,column,bit_index,round_in,
  error,data_in_sb,data_in_sr,data_in_mx,data_in_kx,data_out_sb,data_out_sr,data_out_mx,
  data_out_kx);


 // Inputs and Outputs Declaration-----------------------------------
 input en,mode;
 input [3:0]bit_index,func,round,round_stop,round_in;
 input [1:0] row,column;
 input [127:0] data_in_sb;
 input [127:0] data_in_sr;
 input [127:0] data_in_mx;
 input [127:0] data_in_kx;
 output reg error;
 output reg[127:0] data_out_sb,data_out_sr,data_out_mx,data_out_kx;

// Registers and Wires Declaration------------------------------------
  reg [127:0] temp;
  reg fault_bit;
  reg [7:0] fault_byte;

// Control Statements using Always blocks------------------------------
always @ (*)
begin
if (en == 1)
begin
error = 0;
  if (mode == 0)
  begin
  priority if (round == round_in)
  begin
      if (round == 0)
      begin
        if (func == 0)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_bit = data_in_kx[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
      if (round == 10)
      begin
        if (func == 0)
        begin
        temp = data_in_sb;
        fault_bit = data_in_sb[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_sb = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        temp = data_in_sr;
        fault_bit = data_in_sr[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_sr = temp;
        data_out_sb = data_in_sb;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_bit = data_in_kx[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
      else if (round != 10 && round != 0)
      begin
        if (func == 0)
        begin
        temp = data_in_sb;
        fault_bit = data_in_sb[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_sb = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        temp = data_in_sr;
        fault_bit = data_in_sr[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_sr = temp;
        data_out_sb = data_in_sb;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        temp = data_in_mx;
        fault_bit = data_in_mx[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_mx = temp;
        data_out_sr = data_in_sr;
        data_out_sb = data_in_sb;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_bit = data_in_kx[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
  end
  else if (round_in >= round && round_in <= round_stop)
  begin
      if (round == 0)
      begin
        if (func == 0)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_bit = data_in_kx[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
      if (round == 10)
      begin
        if (func == 0)
        begin
        temp = data_in_sb;
        fault_bit = data_in_sb[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_sb = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        temp = data_in_sr;
        fault_bit = data_in_sr[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_sr = temp;
        data_out_sb = data_in_sb;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_bit = data_in_kx[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
      else if (round != 10 && round != 0)
      begin
        if (func == 0)
        begin
        temp = data_in_sb;
        fault_bit = data_in_sb[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_sb = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        temp = data_in_sr;
        fault_bit = data_in_sr[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_sr = temp;
        data_out_sb = data_in_sb;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        temp = data_in_mx;
        fault_bit = data_in_mx[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_mx = temp;
        data_out_sr = data_in_sr;
        data_out_sb = data_in_sb;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_bit = data_in_kx[32*row + 8*column + bit_index];
        temp[32*row + 8*column + bit_index] = ~ fault_bit;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
  end
  else
  begin
    data_out_sr = data_in_sr;
    data_out_sb = data_in_sb;
    data_out_mx = data_in_mx;
    data_out_kx = data_in_kx;
  end
  end

  
  
  if (mode == 1)
  begin
  priority if (round == round_in)
  begin
      if (round == 0)
      begin
        if (func == 0)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_byte = data_in_kx[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
      if (round == 10)
      begin
        if (func == 0)
        begin
        temp = data_in_sb;
        fault_byte = data_in_sb[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_sb = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        temp = data_in_sr;
        fault_byte = data_in_sr[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_sr = temp;
        data_out_sb = data_in_sb;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_byte = data_in_kx[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
      else if (round != 10 && round != 0)
      begin
        if (func == 0)
        begin
        temp = data_in_sb;
        fault_byte = data_in_sb[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_sb = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        temp = data_in_sr;
        fault_byte = data_in_sr[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_sr = temp;
        data_out_sb = data_in_sb;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        temp = data_in_mx;
        fault_byte = data_in_mx[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_mx = temp;
        data_out_sr = data_in_sr;
        data_out_sb = data_in_sb;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_byte = data_in_kx[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
    end
  else if (round_in >= round && round_in <= round_stop)
  begin
      if (round == 0)
      begin
        if (func == 0)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_byte = data_in_kx[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
      if (round == 10)
      begin
        if (func == 0)
        begin
        temp = data_in_sb;
        fault_byte = data_in_sb[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_sb = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        temp = data_in_sr;
        fault_byte = data_in_sr[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_sr = temp;
        data_out_sb = data_in_sb;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        error = 1;
        data_out_sb = data_in_sb;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_byte = data_in_kx[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
      else if (round != 10 && round != 0)
      begin
        if (func == 0)
        begin
        temp = data_in_sb;
        fault_byte = data_in_sb[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_sb = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 1)
        begin
        temp = data_in_sr;
        fault_byte = data_in_sr[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_sr = temp;
        data_out_sb = data_in_sb;
        data_out_mx = data_in_mx;
        data_out_kx = data_in_kx;
        end
        if (func == 2)
        begin
        temp = data_in_mx;
        fault_byte = data_in_mx[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_mx = temp;
        data_out_sr = data_in_sr;
        data_out_sb = data_in_sb;
        data_out_kx = data_in_kx;
        end
        if (func == 3)
        begin
        temp = data_in_kx;
        fault_byte = data_in_kx[(32*row + 8*column) +:8];
        temp[(32*row + 8*column) +:8] = ~ fault_byte;
        data_out_kx = temp;
        data_out_sr = data_in_sr;
        data_out_mx = data_in_mx;
        data_out_sb = data_in_sb;
        end
      end
  end
  else
  begin
    data_out_sr = data_in_sr;
    data_out_sb = data_in_sb;
    data_out_mx = data_in_mx;
    data_out_kx = data_in_kx;
  end
end

end
else if (en == 0)
begin
data_out_sr = data_in_sr;
data_out_sb = data_in_sb;
data_out_mx = data_in_mx;
data_out_kx = data_in_kx;
end
end

endmodule //fault_injector
/*
// Inputs to this module to control fault insertion.


// Inputs and Outputs to the AES core to insert faults
input         [127:000] keyXor_0_out,
input         [127:000] keyXor_10_out,
input         [127:000] keyXor_out,
input         [127:000] shiftRow_out,
input         [127:000] mixColoumns_out,
input         [127:000] sbox_out,
output        [127:000] keyXor_0_eff_out,
output        [127:000] keyXor_10_eff_out,
output        [127:000] keyXor_eff_out,
output        [127:000] shiftRow_eff_out,
output        [127:000] mixColumns_eff_out,
output        [127:000] sbox_eff_out

);

*/
