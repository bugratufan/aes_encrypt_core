library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;

entity mix_column is
  port (
    data_in  : in DATA_COLUMN;
    data_out : out DATA_COLUMN
  );
end entity;

architecture arch of mix_column is
  signal tmp_data : MIX_COL_DATA_COLUMN;
  signal xor_byte : MIX_COL_DATA_COLUMN;
begin

  tmp_data(0) <= "00" & (data_in(0) & '0' xor data_in(1) & '0' xor '0' & data_in(1) xor '0' & data_in(2) xor '0' & data_in(3));
  tmp_data(1) <= "00" & (data_in(1) & '0' xor data_in(2) & '0' xor '0' & data_in(2) xor '0' & data_in(3) xor '0' & data_in(0));
  tmp_data(2) <= "00" & (data_in(2) & '0' xor data_in(3) & '0' xor '0' & data_in(3) xor '0' & data_in(0) xor '0' & data_in(1));
  tmp_data(3) <= "00" & (data_in(3) & '0' xor data_in(0) & '0' xor '0' & data_in(0) xor '0' & data_in(1) xor '0' & data_in(2));

  xor_byte(0) <= tmp_data(0) when (tmp_data(0)(8) = '0') else (tmp_data(0) xor "00100011011");
  xor_byte(1) <= tmp_data(1) when (tmp_data(1)(8) = '0') else (tmp_data(1) xor "00100011011");
  xor_byte(2) <= tmp_data(2) when (tmp_data(2)(8) = '0') else (tmp_data(2) xor "00100011011");
  xor_byte(3) <= tmp_data(3) when (tmp_data(3)(8) = '0') else (tmp_data(3) xor "00100011011");

  data_out(0) <= xor_byte(0)(7 downto 0);
  data_out(1) <= xor_byte(1)(7 downto 0);
  data_out(2) <= xor_byte(2)(7 downto 0);
  data_out(3) <= xor_byte(3)(7 downto 0);

end architecture;
