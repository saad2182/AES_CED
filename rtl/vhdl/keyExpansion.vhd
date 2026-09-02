library ieee;
use ieee.std_logic_1164.all;
use work.std_logic_textio.all;
use work.std_logic_signed.all;
use work.std_logic_unsigned.all;
use work.std_logic_arith.all;
use std.textio.all;
use work.aes128Pkg.all;

entity keyExpansion is
  port (
    user_key : in Matrix;
	round_1_key : out Matrix;
	round_2_key : out Matrix;
	round_3_key : out Matrix;
	round_4_key : out Matrix;
	round_5_key : out Matrix;
	round_6_key : out Matrix;
	round_7_key : out Matrix;
	round_8_key : out Matrix;
	round_9_key : out Matrix;
	round_10_key : out Matrix);
end entity keyExpansion;

architecture Behavioral of keyExpansion is

component sbox
	port (
		In_DI  : in  Byte;
		Out_DO : out Byte);
end component;

constant rc1 : Byte := "00000001";
constant rc2 : Byte := "00000010";
constant rc3 : Byte := "00000100";
constant rc4 : Byte := "00001000";
constant rc5 : Byte := "00010000";
constant rc6 : Byte := "00100000";
constant rc7 : Byte := "01000000";
constant rc8 : Byte := "10000000";
constant rc9 : Byte := "00011011";
constant rc10 : Byte := "00110110";

signal w0, w1, w2, w3, w4, w5, w6, w7, ws3, gout_1 : Word;
signal ws3_1_xor : Byte;

signal w0_2, w1_2, w2_2, w3_2, ws3_2, w4_2, w5_2, w6_2, w7_2, gout_2 : Word;
signal ws3_2_xor : Byte;

signal w0_3, w1_3, w2_3, w3_3, ws3_3, w4_3, w5_3, w6_3, w7_3, gout_3 : Word;
signal ws3_3_xor : Byte;

signal w0_4, w1_4, w2_4, w3_4, ws3_4, w4_4, w5_4, w6_4, w7_4, gout_4 : Word;
signal ws3_4_xor : Byte;

signal w0_5, w1_5, w2_5, w3_5, ws3_5, w4_5, w5_5, w6_5, w7_5, gout_5 : Word;
signal ws3_5_xor : Byte;

signal w0_6, w1_6, w2_6, w3_6, ws3_6, w4_6, w5_6, w6_6, w7_6, gout_6 : Word;
signal ws3_6_xor : Byte;

signal w0_7, w1_7, w2_7, w3_7, ws3_7, w4_7, w5_7, w6_7, w7_7, gout_7 : Word;
signal ws3_7_xor : Byte;

signal w0_8, w1_8, w2_8, w3_8, ws3_8, w4_8, w5_8, w6_8, w7_8, gout_8 : Word;
signal ws3_8_xor : Byte;

signal w0_9, w1_9, w2_9, w3_9, ws3_9, w4_9, w5_9, w6_9, w7_9, gout_9 : Word;
signal ws3_9_xor : Byte;

signal w0_10, w1_10, w2_10, w3_10, ws3_10, w4_10, w5_10, w6_10, w7_10, gout_10 : Word;
signal ws3_10_xor : Byte;


begin
---------------------------------------
--round 1
---------------------------------------
w0(0) <= user_key (0)(0);
w0(1) <= user_key (1)(0);
w0(2) <= user_key (2)(0);
w0(3) <= user_key (3)(0);

w1(0) <= user_key (0)(1);
w1(1) <= user_key (1)(1);
w1(2) <= user_key (2)(1);
w1(3) <= user_key (3)(1);

w2(0) <= user_key (0)(2);
w2(1) <= user_key (1)(2);
w2(2) <= user_key (2)(2);
w2(3) <= user_key (3)(2);

w3(0) <= user_key (0)(3);
w3(1) <= user_key (1)(3);
w3(2) <= user_key (2)(3);
w3(3) <= user_key (3)(3);

sbox_1_a: sbox PORT MAP (w3(0), ws3(0));
sbox_1_b: sbox PORT MAP (w3(1), ws3(1));
sbox_1_c: sbox PORT MAP (w3(2), ws3(2));
sbox_1_d: sbox PORT MAP (w3(3), ws3(3));

ws3_1_xor <= ws3(1) xor rc1;

gout_1(0) <= ws3_1_xor;
gout_1(1) <= ws3(2);
gout_1(2) <= ws3(3);
gout_1(3) <= ws3(0);

w4(0) <= w0(0) xor gout_1(0);
w4(1) <= w0(1) xor gout_1(1);
w4(2) <= w0(2) xor gout_1(2);
w4(3) <= w0(3) xor gout_1(3);

w5(0) <= w4(0) xor w1(0);
w5(1) <= w4(1) xor w1(1);
w5(2) <= w4(2) xor w1(2);
w5(3) <= w4(3) xor w1(3);

w6(0) <= w5(0) xor w2(0);
w6(1) <= w5(1) xor w2(1);
w6(2) <= w5(2) xor w2(2);
w6(3) <= w5(3) xor w2(3);

w7(0) <= w6(0) xor w3(0);
w7(1) <= w6(1) xor w3(1);
w7(2) <= w6(2) xor w3(2);
w7(3) <= w6(3) xor w3(3);

round_1_key(0)(0) <= w4(0);
round_1_key(0)(1) <= w5(0);
round_1_key(0)(2) <= w6(0);
round_1_key(0)(3) <= w7(0);

round_1_key(1)(0) <= w4(1);
round_1_key(1)(1) <= w5(1);
round_1_key(1)(2) <= w6(1);
round_1_key(1)(3) <= w7(1);

round_1_key(2)(0) <= w4(2);
round_1_key(2)(1) <= w5(2);
round_1_key(2)(2) <= w6(2);
round_1_key(2)(3) <= w7(2);

round_1_key(3)(0) <= w4(3);
round_1_key(3)(1) <= w5(3);
round_1_key(3)(2) <= w6(3);
round_1_key(3)(3) <= w7(3);

---------------------------------------
--round 2
---------------------------------------
w0_2 <= w4;
w1_2 <= w5;
w2_2 <= w6;
w3_2 <= w7;

sbox_2_a: sbox PORT MAP (w3_2(0), ws3_2(0));
sbox_2_b: sbox PORT MAP (w3_2(1), ws3_2(1));
sbox_2_c: sbox PORT MAP (w3_2(2), ws3_2(2));
sbox_2_d: sbox PORT MAP (w3_2(3), ws3_2(3));

ws3_2_xor <= ws3_2(1) xor rc2;

gout_2(0) <= ws3_2_xor;
gout_2(1) <= ws3_2(2);
gout_2(2) <= ws3_2(3);
gout_2(3) <= ws3_2(0);

w4_2(0) <= w0_2(0) xor gout_2(0);
w4_2(1) <= w0_2(1) xor gout_2(1);
w4_2(2) <= w0_2(2) xor gout_2(2);
w4_2(3) <= w0_2(3) xor gout_2(3);

w5_2(0) <= w4_2(0) xor w1_2(0);
w5_2(1) <= w4_2(1) xor w1_2(1);
w5_2(2) <= w4_2(2) xor w1_2(2);
w5_2(3) <= w4_2(3) xor w1_2(3);

w6_2(0) <= w5_2(0) xor w2_2(0);
w6_2(1) <= w5_2(1) xor w2_2(1);
w6_2(2) <= w5_2(2) xor w2_2(2);
w6_2(3) <= w5_2(3) xor w2_2(3);

w7_2(0) <= w6_2(0) xor w3_2(0);
w7_2(1) <= w6_2(1) xor w3_2(1);
w7_2(2) <= w6_2(2) xor w3_2(2);
w7_2(3) <= w6_2(3) xor w3_2(3);

round_2_key(0)(0) <= w4_2(0);
round_2_key(0)(1) <= w5_2(0);
round_2_key(0)(2) <= w6_2(0);
round_2_key(0)(3) <= w7_2(0);

round_2_key(1)(0) <= w4_2(1);
round_2_key(1)(1) <= w5_2(1);
round_2_key(1)(2) <= w6_2(1);
round_2_key(1)(3) <= w7_2(1);

round_2_key(2)(0) <= w4_2(2);
round_2_key(2)(1) <= w5_2(2);
round_2_key(2)(2) <= w6_2(2);
round_2_key(2)(3) <= w7_2(2);

round_2_key(3)(0) <= w4_2(3);
round_2_key(3)(1) <= w5_2(3);
round_2_key(3)(2) <= w6_2(3);
round_2_key(3)(3) <= w7_2(3);

---------------------------------------
--round 3
---------------------------------------
w0_3 <= w4_2;
w1_3 <= w5_2;
w2_3 <= w6_2;
w3_3 <= w7_2;

sbox_3_a: sbox PORT MAP (w3_3(0), ws3_3(0));
sbox_3_b: sbox PORT MAP (w3_3(1), ws3_3(1));
sbox_3_c: sbox PORT MAP (w3_3(2), ws3_3(2));
sbox_3_d: sbox PORT MAP (w3_3(3), ws3_3(3));

ws3_3_xor <= ws3_3(1) xor rc3;

gout_3(0) <= ws3_3_xor;
gout_3(1) <= ws3_3(2);
gout_3(2) <= ws3_3(3);
gout_3(3) <= ws3_3(0);

w4_3(0) <= w0_3(0) xor gout_3(0);
w4_3(1) <= w0_3(1) xor gout_3(1);
w4_3(2) <= w0_3(2) xor gout_3(2);
w4_3(3) <= w0_3(3) xor gout_3(3);

w5_3(0) <= w4_3(0) xor w1_3(0);
w5_3(1) <= w4_3(1) xor w1_3(1);
w5_3(2) <= w4_3(2) xor w1_3(2);
w5_3(3) <= w4_3(3) xor w1_3(3);

w6_3(0) <= w5_3(0) xor w2_3(0);
w6_3(1) <= w5_3(1) xor w2_3(1);
w6_3(2) <= w5_3(2) xor w2_3(2);
w6_3(3) <= w5_3(3) xor w2_3(3);

w7_3(0) <= w6_3(0) xor w3_3(0);
w7_3(1) <= w6_3(1) xor w3_3(1);
w7_3(2) <= w6_3(2) xor w3_3(2);
w7_3(3) <= w6_3(3) xor w3_3(3);

round_3_key(0)(0) <= w4_3(0);
round_3_key(0)(1) <= w5_3(0);
round_3_key(0)(2) <= w6_3(0);
round_3_key(0)(3) <= w7_3(0);

round_3_key(1)(0) <= w4_3(1);
round_3_key(1)(1) <= w5_3(1);
round_3_key(1)(2) <= w6_3(1);
round_3_key(1)(3) <= w7_3(1);

round_3_key(2)(0) <= w4_3(2);
round_3_key(2)(1) <= w5_3(2);
round_3_key(2)(2) <= w6_3(2);
round_3_key(2)(3) <= w7_3(2);

round_3_key(3)(0) <= w4_3(3);
round_3_key(3)(1) <= w5_3(3);
round_3_key(3)(2) <= w6_3(3);
round_3_key(3)(3) <= w7_3(3);

---------------------------------------
--round 4
---------------------------------------
w0_4 <= w4_3;
w1_4 <= w5_3;
w2_4 <= w6_3;
w3_4 <= w7_3;

sbox_4_a: sbox PORT MAP (w3_4(0), ws3_4(0));
sbox_4_b: sbox PORT MAP (w3_4(1), ws3_4(1));
sbox_4_c: sbox PORT MAP (w3_4(2), ws3_4(2));
sbox_4_d: sbox PORT MAP (w3_4(3), ws3_4(3));

ws3_4_xor <= ws3_4(1) xor rc4;

gout_4(0) <= ws3_4_xor;
gout_4(1) <= ws3_4(2);
gout_4(2) <= ws3_4(3);
gout_4(3) <= ws3_4(0);

w4_4(0) <= w0_4(0) xor gout_4(0);
w4_4(1) <= w0_4(1) xor gout_4(1);
w4_4(2) <= w0_4(2) xor gout_4(2);
w4_4(3) <= w0_4(3) xor gout_4(3);

w5_4(0) <= w4_4(0) xor w1_4(0);
w5_4(1) <= w4_4(1) xor w1_4(1);
w5_4(2) <= w4_4(2) xor w1_4(2);
w5_4(3) <= w4_4(3) xor w1_4(3);

w6_4(0) <= w5_4(0) xor w2_4(0);
w6_4(1) <= w5_4(1) xor w2_4(1);
w6_4(2) <= w5_4(2) xor w2_4(2);
w6_4(3) <= w5_4(3) xor w2_4(3);

w7_4(0) <= w6_4(0) xor w3_4(0);
w7_4(1) <= w6_4(1) xor w3_4(1);
w7_4(2) <= w6_4(2) xor w3_4(2);
w7_4(3) <= w6_4(3) xor w3_4(3);

round_4_key(0)(0) <= w4_4(0);
round_4_key(0)(1) <= w5_4(0);
round_4_key(0)(2) <= w6_4(0);
round_4_key(0)(3) <= w7_4(0);

round_4_key(1)(0) <= w4_4(1);
round_4_key(1)(1) <= w5_4(1);
round_4_key(1)(2) <= w6_4(1);
round_4_key(1)(3) <= w7_4(1);

round_4_key(2)(0) <= w4_4(2);
round_4_key(2)(1) <= w5_4(2);
round_4_key(2)(2) <= w6_4(2);
round_4_key(2)(3) <= w7_4(2);

round_4_key(3)(0) <= w4_4(3);
round_4_key(3)(1) <= w5_4(3);
round_4_key(3)(2) <= w6_4(3);
round_4_key(3)(3) <= w7_4(3);

---------------------------------------
--round 5
---------------------------------------
w0_5 <= w4_4;
w1_5 <= w5_4;
w2_5 <= w6_4;
w3_5 <= w7_4;

sbox_5_a: sbox PORT MAP (w3_5(0), ws3_5(0));
sbox_5_b: sbox PORT MAP (w3_5(1), ws3_5(1));
sbox_5_c: sbox PORT MAP (w3_5(2), ws3_5(2));
sbox_5_d: sbox PORT MAP (w3_5(3), ws3_5(3));

ws3_5_xor <= ws3_5(1) xor rc5;

gout_5(0) <= ws3_5_xor;
gout_5(1) <= ws3_5(2);
gout_5(2) <= ws3_5(3);
gout_5(3) <= ws3_5(0);

w4_5(0) <= w0_5(0) xor gout_5(0);
w4_5(1) <= w0_5(1) xor gout_5(1);
w4_5(2) <= w0_5(2) xor gout_5(2);
w4_5(3) <= w0_5(3) xor gout_5(3);

w5_5(0) <= w4_5(0) xor w1_5(0);
w5_5(1) <= w4_5(1) xor w1_5(1);
w5_5(2) <= w4_5(2) xor w1_5(2);
w5_5(3) <= w4_5(3) xor w1_5(3);

w6_5(0) <= w5_5(0) xor w2_5(0);
w6_5(1) <= w5_5(1) xor w2_5(1);
w6_5(2) <= w5_5(2) xor w2_5(2);
w6_5(3) <= w5_5(3) xor w2_5(3);

w7_5(0) <= w6_5(0) xor w3_5(0);
w7_5(1) <= w6_5(1) xor w3_5(1);
w7_5(2) <= w6_5(2) xor w3_5(2);
w7_5(3) <= w6_5(3) xor w3_5(3);

round_5_key(0)(0) <= w4_5(0);
round_5_key(0)(1) <= w5_5(0);
round_5_key(0)(2) <= w6_5(0);
round_5_key(0)(3) <= w7_5(0);

round_5_key(1)(0) <= w4_5(1);
round_5_key(1)(1) <= w5_5(1);
round_5_key(1)(2) <= w6_5(1);
round_5_key(1)(3) <= w7_5(1);

round_5_key(2)(0) <= w4_5(2);
round_5_key(2)(1) <= w5_5(2);
round_5_key(2)(2) <= w6_5(2);
round_5_key(2)(3) <= w7_5(2);

round_5_key(3)(0) <= w4_5(3);
round_5_key(3)(1) <= w5_5(3);
round_5_key(3)(2) <= w6_5(3);
round_5_key(3)(3) <= w7_5(3);

---------------------------------------
--round 6
---------------------------------------
w0_6 <= w4_5;
w1_6 <= w5_5;
w2_6 <= w6_5;
w3_6 <= w7_5;

sbox_6_a: sbox PORT MAP (w3_6(0), ws3_6(0));
sbox_6_b: sbox PORT MAP (w3_6(1), ws3_6(1));
sbox_6_c: sbox PORT MAP (w3_6(2), ws3_6(2));
sbox_6_d: sbox PORT MAP (w3_6(3), ws3_6(3));

ws3_6_xor <= ws3_6(1) xor rc6;

gout_6(0) <= ws3_6_xor;
gout_6(1) <= ws3_6(2);
gout_6(2) <= ws3_6(3);
gout_6(3) <= ws3_6(0);

w4_6(0) <= w0_6(0) xor gout_6(0);
w4_6(1) <= w0_6(1) xor gout_6(1);
w4_6(2) <= w0_6(2) xor gout_6(2);
w4_6(3) <= w0_6(3) xor gout_6(3);

w5_6(0) <= w4_6(0) xor w1_6(0);
w5_6(1) <= w4_6(1) xor w1_6(1);
w5_6(2) <= w4_6(2) xor w1_6(2);
w5_6(3) <= w4_6(3) xor w1_6(3);

w6_6(0) <= w5_6(0) xor w2_6(0);
w6_6(1) <= w5_6(1) xor w2_6(1);
w6_6(2) <= w5_6(2) xor w2_6(2);
w6_6(3) <= w5_6(3) xor w2_6(3);

w7_6(0) <= w6_6(0) xor w3_6(0);
w7_6(1) <= w6_6(1) xor w3_6(1);
w7_6(2) <= w6_6(2) xor w3_6(2);
w7_6(3) <= w6_6(3) xor w3_6(3);

round_6_key(0)(0) <= w4_6(0);
round_6_key(0)(1) <= w5_6(0);
round_6_key(0)(2) <= w6_6(0);
round_6_key(0)(3) <= w7_6(0);

round_6_key(1)(0) <= w4_6(1);
round_6_key(1)(1) <= w5_6(1);
round_6_key(1)(2) <= w6_6(1);
round_6_key(1)(3) <= w7_6(1);

round_6_key(2)(0) <= w4_6(2);
round_6_key(2)(1) <= w5_6(2);
round_6_key(2)(2) <= w6_6(2);
round_6_key(2)(3) <= w7_6(2);

round_6_key(3)(0) <= w4_6(3);
round_6_key(3)(1) <= w5_6(3);
round_6_key(3)(2) <= w6_6(3);
round_6_key(3)(3) <= w7_6(3);

---------------------------------------
--round 7
---------------------------------------
w0_7 <= w4_6;
w1_7 <= w5_6;
w2_7 <= w6_6;
w3_7 <= w7_6;

sbox_7_a: sbox PORT MAP (w3_7(0), ws3_7(0));
sbox_7_b: sbox PORT MAP (w3_7(1), ws3_7(1));
sbox_7_c: sbox PORT MAP (w3_7(2), ws3_7(2));
sbox_7_d: sbox PORT MAP (w3_7(3), ws3_7(3));

ws3_7_xor <= ws3_7(1) xor rc7;

gout_7(0) <= ws3_7_xor;
gout_7(1) <= ws3_7(2);
gout_7(2) <= ws3_7(3);
gout_7(3) <= ws3_7(0);

w4_7(0) <= w0_7(0) xor gout_7(0);
w4_7(1) <= w0_7(1) xor gout_7(1);
w4_7(2) <= w0_7(2) xor gout_7(2);
w4_7(3) <= w0_7(3) xor gout_7(3);

w5_7(0) <= w4_7(0) xor w1_7(0);
w5_7(1) <= w4_7(1) xor w1_7(1);
w5_7(2) <= w4_7(2) xor w1_7(2);
w5_7(3) <= w4_7(3) xor w1_7(3);

w6_7(0) <= w5_7(0) xor w2_7(0);
w6_7(1) <= w5_7(1) xor w2_7(1);
w6_7(2) <= w5_7(2) xor w2_7(2);
w6_7(3) <= w5_7(3) xor w2_7(3);

w7_7(0) <= w6_7(0) xor w3_7(0);
w7_7(1) <= w6_7(1) xor w3_7(1);
w7_7(2) <= w6_7(2) xor w3_7(2);
w7_7(3) <= w6_7(3) xor w3_7(3);

round_7_key(0)(0) <= w4_7(0);
round_7_key(0)(1) <= w5_7(0);
round_7_key(0)(2) <= w6_7(0);
round_7_key(0)(3) <= w7_7(0);

round_7_key(1)(0) <= w4_7(1);
round_7_key(1)(1) <= w5_7(1);
round_7_key(1)(2) <= w6_7(1);
round_7_key(1)(3) <= w7_7(1);

round_7_key(2)(0) <= w4_7(2);
round_7_key(2)(1) <= w5_7(2);
round_7_key(2)(2) <= w6_7(2);
round_7_key(2)(3) <= w7_7(2);

round_7_key(3)(0) <= w4_7(3);
round_7_key(3)(1) <= w5_7(3);
round_7_key(3)(2) <= w6_7(3);
round_7_key(3)(3) <= w7_7(3);

---------------------------------------
--round 8
---------------------------------------
w0_8 <= w4_7;
w1_8 <= w5_7;
w2_8 <= w6_7;
w3_8 <= w7_7;

sbox_8_a: sbox PORT MAP (w3_8(0), ws3_8(0));
sbox_8_b: sbox PORT MAP (w3_8(1), ws3_8(1));
sbox_8_c: sbox PORT MAP (w3_8(2), ws3_8(2));
sbox_8_d: sbox PORT MAP (w3_8(3), ws3_8(3));

ws3_8_xor <= ws3_8(1) xor rc8;

gout_8(0) <= ws3_8_xor;
gout_8(1) <= ws3_8(2);
gout_8(2) <= ws3_8(3);
gout_8(3) <= ws3_8(0);

w4_8(0) <= w0_8(0) xor gout_8(0);
w4_8(1) <= w0_8(1) xor gout_8(1);
w4_8(2) <= w0_8(2) xor gout_8(2);
w4_8(3) <= w0_8(3) xor gout_8(3);

w5_8(0) <= w4_8(0) xor w1_8(0);
w5_8(1) <= w4_8(1) xor w1_8(1);
w5_8(2) <= w4_8(2) xor w1_8(2);
w5_8(3) <= w4_8(3) xor w1_8(3);

w6_8(0) <= w5_8(0) xor w2_8(0);
w6_8(1) <= w5_8(1) xor w2_8(1);
w6_8(2) <= w5_8(2) xor w2_8(2);
w6_8(3) <= w5_8(3) xor w2_8(3);

w7_8(0) <= w6_8(0) xor w3_8(0);
w7_8(1) <= w6_8(1) xor w3_8(1);
w7_8(2) <= w6_8(2) xor w3_8(2);
w7_8(3) <= w6_8(3) xor w3_8(3);

round_8_key(0)(0) <= w4_8(0);
round_8_key(0)(1) <= w5_8(0);
round_8_key(0)(2) <= w6_8(0);
round_8_key(0)(3) <= w7_8(0);

round_8_key(1)(0) <= w4_8(1);
round_8_key(1)(1) <= w5_8(1);
round_8_key(1)(2) <= w6_8(1);
round_8_key(1)(3) <= w7_8(1);

round_8_key(2)(0) <= w4_8(2);
round_8_key(2)(1) <= w5_8(2);
round_8_key(2)(2) <= w6_8(2);
round_8_key(2)(3) <= w7_8(2);

round_8_key(3)(0) <= w4_8(3);
round_8_key(3)(1) <= w5_8(3);
round_8_key(3)(2) <= w6_8(3);
round_8_key(3)(3) <= w7_8(3);

---------------------------------------
--round 9
---------------------------------------
w0_9 <= w4_8;
w1_9 <= w5_8;
w2_9 <= w6_8;
w3_9 <= w7_8;

sbox_9_a: sbox PORT MAP (w3_9(0), ws3_9(0));
sbox_9_b: sbox PORT MAP (w3_9(1), ws3_9(1));
sbox_9_c: sbox PORT MAP (w3_9(2), ws3_9(2));
sbox_9_d: sbox PORT MAP (w3_9(3), ws3_9(3));

ws3_9_xor <= ws3_9(1) xor rc9;

gout_9(0) <= ws3_9_xor;
gout_9(1) <= ws3_9(2);
gout_9(2) <= ws3_9(3);
gout_9(3) <= ws3_9(0);

w4_9(0) <= w0_9(0) xor gout_9(0);
w4_9(1) <= w0_9(1) xor gout_9(1);
w4_9(2) <= w0_9(2) xor gout_9(2);
w4_9(3) <= w0_9(3) xor gout_9(3);

w5_9(0) <= w4_9(0) xor w1_9(0);
w5_9(1) <= w4_9(1) xor w1_9(1);
w5_9(2) <= w4_9(2) xor w1_9(2);
w5_9(3) <= w4_9(3) xor w1_9(3);

w6_9(0) <= w5_9(0) xor w2_9(0);
w6_9(1) <= w5_9(1) xor w2_9(1);
w6_9(2) <= w5_9(2) xor w2_9(2);
w6_9(3) <= w5_9(3) xor w2_9(3);

w7_9(0) <= w6_9(0) xor w3_9(0);
w7_9(1) <= w6_9(1) xor w3_9(1);
w7_9(2) <= w6_9(2) xor w3_9(2);
w7_9(3) <= w6_9(3) xor w3_9(3);

round_9_key(0)(0) <= w4_9(0);
round_9_key(0)(1) <= w5_9(0);
round_9_key(0)(2) <= w6_9(0);
round_9_key(0)(3) <= w7_9(0);

round_9_key(1)(0) <= w4_9(1);
round_9_key(1)(1) <= w5_9(1);
round_9_key(1)(2) <= w6_9(1);
round_9_key(1)(3) <= w7_9(1);

round_9_key(2)(0) <= w4_9(2);
round_9_key(2)(1) <= w5_9(2);
round_9_key(2)(2) <= w6_9(2);
round_9_key(2)(3) <= w7_9(2);

round_9_key(3)(0) <= w4_9(3);
round_9_key(3)(1) <= w5_9(3);
round_9_key(3)(2) <= w6_9(3);
round_9_key(3)(3) <= w7_9(3);

---------------------------------------
--round 10
---------------------------------------
w0_10 <= w4_9;
w1_10 <= w5_9;
w2_10 <= w6_9;
w3_10 <= w7_9;

sbox_10_a: sbox PORT MAP (w3_10(0), ws3_10(0));
sbox_10_b: sbox PORT MAP (w3_10(1), ws3_10(1));
sbox_10_c: sbox PORT MAP (w3_10(2), ws3_10(2));
sbox_10_d: sbox PORT MAP (w3_10(3), ws3_10(3));

ws3_10_xor <= ws3_10(1) xor rc10;

gout_10(0) <= ws3_10_xor;
gout_10(1) <= ws3_10(2);
gout_10(2) <= ws3_10(3);
gout_10(3) <= ws3_10(0);

w4_10(0) <= w0_10(0) xor gout_10(0);
w4_10(1) <= w0_10(1) xor gout_10(1);
w4_10(2) <= w0_10(2) xor gout_10(2);
w4_10(3) <= w0_10(3) xor gout_10(3);

w5_10(0) <= w4_10(0) xor w1_10(0);
w5_10(1) <= w4_10(1) xor w1_10(1);
w5_10(2) <= w4_10(2) xor w1_10(2);
w5_10(3) <= w4_10(3) xor w1_10(3);

w6_10(0) <= w5_10(0) xor w2_10(0);
w6_10(1) <= w5_10(1) xor w2_10(1);
w6_10(2) <= w5_10(2) xor w2_10(2);
w6_10(3) <= w5_10(3) xor w2_10(3);

w7_10(0) <= w6_10(0) xor w3_10(0);
w7_10(1) <= w6_10(1) xor w3_10(1);
w7_10(2) <= w6_10(2) xor w3_10(2);
w7_10(3) <= w6_10(3) xor w3_10(3);

round_10_key(0)(0) <= w4_10(0);
round_10_key(0)(1) <= w5_10(0);
round_10_key(0)(2) <= w6_10(0);
round_10_key(0)(3) <= w7_10(0);

round_10_key(1)(0) <= w4_10(1);
round_10_key(1)(1) <= w5_10(1);
round_10_key(1)(2) <= w6_10(1);
round_10_key(1)(3) <= w7_10(1);

round_10_key(2)(0) <= w4_10(2);
round_10_key(2)(1) <= w5_10(2);
round_10_key(2)(2) <= w6_10(2);
round_10_key(2)(3) <= w7_10(2);

round_10_key(3)(0) <= w4_10(3);
round_10_key(3)(1) <= w5_10(3);
round_10_key(3)(2) <= w6_10(3);
round_10_key(3)(3) <= w7_10(3);
---------------------------------------
 
end architecture Behavioral;