
library ieee;
use ieee.std_logic_1164.all;
use work.std_logic_textio.all;
use work.std_logic_signed.all;
use work.std_logic_unsigned.all;
use work.std_logic_arith.all;
use std.textio.all;
use work.aes128Pkg.all;
 
entity sbox_128 is
  port (
    --! @brief Input to the S-box.
    In_DI_128  : in  Matrix;
    --! @brief Substituted output of the S-box.
    Out_DO_128 : out Matrix
    --! Parity signal for every byte output from lower s-box module
    );
end sbox_128;
 
architecture behavioral of sbox_128 is 

component sbox
  port (
	--! @brief Input to the S-box.
	In_DI  : in  Byte;
	--! @brief Substituted output of the S-box.
	Out_DO : out Byte
	--! Parity bit for each S-Box output Byte
	);
end component;

--signals

signal In_DI_sig, Out_DO_sig : Matrix;
	
begin

In_DI_sig <= In_DI_128;

sbox_0: sbox PORT MAP (In_DI_sig(0)(0), Out_DO_sig(0)(0));
sbox_1: sbox PORT MAP (In_DI_sig(0)(1), Out_DO_sig(0)(1));
sbox_2: sbox PORT MAP (In_DI_sig(0)(2), Out_DO_sig(0)(2));
sbox_3: sbox PORT MAP (In_DI_sig(0)(3), Out_DO_sig(0)(3));
sbox_4: sbox PORT MAP (In_DI_sig(1)(0), Out_DO_sig(1)(0));
sbox_5: sbox PORT MAP (In_DI_sig(1)(1), Out_DO_sig(1)(1));
sbox_6: sbox PORT MAP (In_DI_sig(1)(2), Out_DO_sig(1)(2));
sbox_7: sbox PORT MAP (In_DI_sig(1)(3), Out_DO_sig(1)(3));
sbox_8: sbox PORT MAP (In_DI_sig(2)(0), Out_DO_sig(2)(0));
sbox_9: sbox PORT MAP (In_DI_sig(2)(1), Out_DO_sig(2)(1));
sbox_10: sbox PORT MAP (In_DI_sig(2)(2), Out_DO_sig(2)(2));
sbox_11: sbox PORT MAP (In_DI_sig(2)(3), Out_DO_sig(2)(3));
sbox_12: sbox PORT MAP (In_DI_sig(3)(0), Out_DO_sig(3)(0));
sbox_13: sbox PORT MAP (In_DI_sig(3)(1), Out_DO_sig(3)(1));
sbox_14: sbox PORT MAP (In_DI_sig(3)(2), Out_DO_sig(3)(2));
sbox_15: sbox PORT MAP (In_DI_sig(3)(3), Out_DO_sig(3)(3));

Out_DO_128 <= Out_DO_sig;
	
end;


