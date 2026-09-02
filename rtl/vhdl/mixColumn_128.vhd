
library ieee;
use ieee.std_logic_1164.all;
use work.std_logic_textio.all;
use work.std_logic_signed.all;
use work.std_logic_unsigned.all;
use work.std_logic_arith.all;
use std.textio.all;
use work.aes128Pkg.all;
 
entity mixColumn_128 is
  port (
    --! @brief Input to the S-box.
    In_DI_128  : in Matrix;
    --! @brief Substituted output of the S-box.
    Out_DO_128 : out Matrix);
end mixColumn_128;
 
architecture behavioral of mixColumn_128 is 

component mixColumn
	port (
	--! @brief Input to the "MixColumn" function.
	In_DI  : in  Word;
	--! @brief Output of the "MixColumn" function.
	Out_DO : out Word);
end component;

--signals

signal In_DI_128_sig : Matrix;
signal Out_DO_128_sig : Matrix;
	
begin


In_DI_128_sig(0)(0) <= In_DI_128(0)(0);
In_DI_128_sig(0)(1) <= In_DI_128(1)(0);
In_DI_128_sig(0)(2) <= In_DI_128(2)(0);
In_DI_128_sig(0)(3) <= In_DI_128(3)(0);

In_DI_128_sig(1)(0) <= In_DI_128(0)(1);
In_DI_128_sig(1)(1) <= In_DI_128(1)(1);
In_DI_128_sig(1)(2) <= In_DI_128(2)(1);
In_DI_128_sig(1)(3) <= In_DI_128(3)(1);

In_DI_128_sig(2)(0) <= In_DI_128(0)(2);
In_DI_128_sig(2)(1) <= In_DI_128(1)(2);
In_DI_128_sig(2)(2) <= In_DI_128(2)(2);
In_DI_128_sig(2)(3) <= In_DI_128(3)(2);

In_DI_128_sig(3)(0) <= In_DI_128(0)(3);
In_DI_128_sig(3)(1) <= In_DI_128(1)(3);
In_DI_128_sig(3)(2) <= In_DI_128(2)(3);
In_DI_128_sig(3)(3) <= In_DI_128(3)(3);

mixColumn_0: mixColumn PORT MAP (In_DI_128_sig(0), Out_DO_128_sig(0));
mixColumn_1: mixColumn PORT MAP (In_DI_128_sig(1), Out_DO_128_sig(1));
mixColumn_2: mixColumn PORT MAP (In_DI_128_sig(2), Out_DO_128_sig(2));
mixColumn_3: mixColumn PORT MAP (In_DI_128_sig(3), Out_DO_128_sig(3));

Out_DO_128(0)(0) <= Out_DO_128_sig(0)(0);
Out_DO_128(0)(1) <= Out_DO_128_sig(1)(0);
Out_DO_128(0)(2) <= Out_DO_128_sig(2)(0);
Out_DO_128(0)(3) <= Out_DO_128_sig(3)(0);

Out_DO_128(1)(0) <= Out_DO_128_sig(0)(1);
Out_DO_128(1)(1) <= Out_DO_128_sig(1)(1);
Out_DO_128(1)(2) <= Out_DO_128_sig(2)(1);
Out_DO_128(1)(3) <= Out_DO_128_sig(3)(1);

Out_DO_128(2)(0) <= Out_DO_128_sig(0)(2);
Out_DO_128(2)(1) <= Out_DO_128_sig(1)(2);
Out_DO_128(2)(2) <= Out_DO_128_sig(2)(2);
Out_DO_128(2)(3) <= Out_DO_128_sig(3)(2);

Out_DO_128(3)(0) <= Out_DO_128_sig(0)(3);
Out_DO_128(3)(1) <= Out_DO_128_sig(1)(3);
Out_DO_128(3)(2) <= Out_DO_128_sig(2)(3);
Out_DO_128(3)(3) <= Out_DO_128_sig(3)(3);

end;
