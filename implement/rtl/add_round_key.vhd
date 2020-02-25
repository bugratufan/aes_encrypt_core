library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;

entity add_round_key is
  port (
    data_in : in DATA_BLOCK;
    cipher_block : in DATA_BLOCK;
    data_out : out DATA_BLOCK
  );
end entity;


architecture arch of add_round_key is
begin
  data_out(0,0) <= data_in(0,0) xor cipher_block(0,0);
  data_out(0,1) <= data_in(0,1) xor cipher_block(0,1);
  data_out(0,2) <= data_in(0,2) xor cipher_block(0,2);
  data_out(0,3) <= data_in(0,3) xor cipher_block(0,3);
  data_out(1,0) <= data_in(1,0) xor cipher_block(1,0);
  data_out(1,1) <= data_in(1,1) xor cipher_block(1,1);
  data_out(1,2) <= data_in(1,2) xor cipher_block(1,2);
  data_out(1,3) <= data_in(1,3) xor cipher_block(1,3);
  data_out(2,0) <= data_in(2,0) xor cipher_block(2,0);
  data_out(2,1) <= data_in(2,1) xor cipher_block(2,1);
  data_out(2,2) <= data_in(2,2) xor cipher_block(2,2);
  data_out(2,3) <= data_in(2,3) xor cipher_block(2,3);
  data_out(3,0) <= data_in(3,0) xor cipher_block(3,0);
  data_out(3,1) <= data_in(3,1) xor cipher_block(3,1);
  data_out(3,2) <= data_in(3,2) xor cipher_block(3,2);
  data_out(3,3) <= data_in(3,3) xor cipher_block(3,3);
end architecture;
