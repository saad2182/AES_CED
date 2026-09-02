
library ieee;
use ieee.std_logic_1164.all;
use work.std_logic_textio.all;
use work.std_logic_signed.all;
use work.std_logic_unsigned.all;
use work.std_logic_arith.all;
use std.textio.all;
use work.aes128Pkg.all;

entity shiftRow_128 is
  port (
    In_DI : in Matrix;
    Out_DO : out Matrix);
end entity shiftRow_128;

architecture Behavioral of shiftRow_128 is
  
begin

Out_DO(0)(0) <= In_DI(0)(0);
Out_DO(0)(1) <= In_DI(0)(1);
Out_DO(0)(2) <= In_DI(0)(2);
Out_DO(0)(3) <= In_DI(0)(3);

Out_DO(1)(0) <= In_DI(1)(1);
Out_DO(1)(1) <= In_DI(1)(2);
Out_DO(1)(2) <= In_DI(1)(3);
Out_DO(1)(3) <= In_DI(1)(0);

Out_DO(2)(0) <= In_DI(2)(2);
Out_DO(2)(1) <= In_DI(2)(3);
Out_DO(2)(2) <= In_DI(2)(0);
Out_DO(2)(3) <= In_DI(2)(1);

Out_DO(3)(0) <= In_DI(3)(3);
Out_DO(3)(1) <= In_DI(3)(0);
Out_DO(3)(2) <= In_DI(3)(1);
Out_DO(3)(3) <= In_DI(3)(2);

end architecture Behavioral;