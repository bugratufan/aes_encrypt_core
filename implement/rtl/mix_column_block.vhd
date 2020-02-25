library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;


entity mix_column_block is
  port (
    data_in  : in DATA_BLOCK;
    data_out : out DATA_BLOCK
  );
end entity;

architecture arch of mix_column_block is

  component mix_column is
    port (
      data_in  : in DATA_COLUMN;
      data_out : out DATA_COLUMN
    );
  end component;

  signal tmp_0 : DATA_COLUMN;
  signal tmp_1 : DATA_COLUMN;
  signal tmp_2 : DATA_COLUMN;
  signal tmp_3 : DATA_COLUMN;

  signal tmp_out_0 : DATA_COLUMN;
  signal tmp_out_1 : DATA_COLUMN;
  signal tmp_out_2 : DATA_COLUMN;
  signal tmp_out_3 : DATA_COLUMN;
begin

  u0: mix_column port map(
    data_in => tmp_0,
    data_out => tmp_out_0
  );

  u1: mix_column port map(
    data_in => tmp_1,
    data_out => tmp_out_1
  );

  u2: mix_column port map(
    data_in => tmp_2,
    data_out => tmp_out_2
  );

  u3: mix_column port map(
    data_in => tmp_3,
    data_out => tmp_out_3
  );

  tmp_0(0) <= data_in(0,0);
  tmp_0(1) <= data_in(1,0);
  tmp_0(2) <= data_in(2,0);
  tmp_0(3) <= data_in(3,0);

  tmp_1(0) <= data_in(0,1);
  tmp_1(1) <= data_in(1,1);
  tmp_1(2) <= data_in(2,1);
  tmp_1(3) <= data_in(3,1);

  tmp_2(0) <= data_in(0,2);
  tmp_2(1) <= data_in(1,2);
  tmp_2(2) <= data_in(2,2);
  tmp_2(3) <= data_in(3,2);

  tmp_3(0) <= data_in(0,3);
  tmp_3(1) <= data_in(1,3);
  tmp_3(2) <= data_in(2,3);
  tmp_3(3) <= data_in(3,3);


  data_out(0,0) <= tmp_out_0(0);
  data_out(1,0) <= tmp_out_0(1);
  data_out(2,0) <= tmp_out_0(2);
  data_out(3,0) <= tmp_out_0(3);

  data_out(0,1) <= tmp_out_1(0);
  data_out(1,1) <= tmp_out_1(1);
  data_out(2,1) <= tmp_out_1(2);
  data_out(3,1) <= tmp_out_1(3);

  data_out(0,2) <= tmp_out_2(0);
  data_out(1,2) <= tmp_out_2(1);
  data_out(2,2) <= tmp_out_2(2);
  data_out(3,2) <= tmp_out_2(3);

  data_out(0,3) <= tmp_out_3(0);
  data_out(1,3) <= tmp_out_3(1);
  data_out(2,3) <= tmp_out_3(2);
  data_out(3,3) <= tmp_out_3(3);

end architecture;
