library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;

entity create_round_key is
  port (
    cipher_block : in DATA_BLOCK;
    round_count : in std_logic_vector(7 downto 0);
    out_block : out DATA_BLOCK
  );
end entity;

architecture arch of create_round_key is
  component sbox is
    port (
      data_in : in std_logic_vector(7 downto 0);
      data_out : out std_logic_vector(7 downto 0)
    );
  end component;

  signal first_column : DATA_COLUMN;
  signal first_column_calc : DATA_COLUMN;
  signal second_column_calc : DATA_COLUMN;
  signal third_column_calc : DATA_COLUMN;
  signal fourth_column_calc : DATA_COLUMN;

begin
  sbox_0: sbox port map(
    data_in => cipher_block(1,3),
    data_out => first_column(0)
  );
  sbox_1: sbox port map(
    data_in => cipher_block(2,3),
    data_out => first_column(1)
  );
  sbox_2: sbox port map(
    data_in => cipher_block(3,3),
    data_out => first_column(2)
  );
  sbox_3: sbox port map(
    data_in => cipher_block(0,3),
    data_out => first_column(3)
  );

  first_column_calc(0) <= first_column(0) xor round_count xor cipher_block(0,0);
  first_column_calc(1) <= first_column(1) xor cipher_block(1,0);
  first_column_calc(2) <= first_column(2) xor cipher_block(2,0);
  first_column_calc(3) <= first_column(3) xor cipher_block(3,0);

  second_column_calc(0) <= first_column_calc(0) xor cipher_block(0,1);
  second_column_calc(1) <= first_column_calc(1) xor cipher_block(1,1);
  second_column_calc(2) <= first_column_calc(2) xor cipher_block(2,1);
  second_column_calc(3) <= first_column_calc(3) xor cipher_block(3,1);

  third_column_calc(0) <= second_column_calc(0) xor cipher_block(0,2);
  third_column_calc(1) <= second_column_calc(1) xor cipher_block(1,2);
  third_column_calc(2) <= second_column_calc(2) xor cipher_block(2,2);
  third_column_calc(3) <= second_column_calc(3) xor cipher_block(3,2);

  fourth_column_calc(0) <= third_column_calc(0) xor cipher_block(0,3);
  fourth_column_calc(1) <= third_column_calc(1) xor cipher_block(1,3);
  fourth_column_calc(2) <= third_column_calc(2) xor cipher_block(2,3);
  fourth_column_calc(3) <= third_column_calc(3) xor cipher_block(3,3);


  out_block(0,0) <= first_column_calc(0);
  out_block(1,0) <= first_column_calc(1);
  out_block(2,0) <= first_column_calc(2);
  out_block(3,0) <= first_column_calc(3);

  out_block(0,1) <= second_column_calc(0);
  out_block(1,1) <= second_column_calc(1);
  out_block(2,1) <= second_column_calc(2);
  out_block(3,1) <= second_column_calc(3);

  out_block(0,2) <= third_column_calc(0);
  out_block(1,2) <= third_column_calc(1);
  out_block(2,2) <= third_column_calc(2);
  out_block(3,2) <= third_column_calc(3);

  out_block(0,3) <= fourth_column_calc(0);
  out_block(1,3) <= fourth_column_calc(1);
  out_block(2,3) <= fourth_column_calc(2);
  out_block(3,3) <= fourth_column_calc(3);

end architecture;
