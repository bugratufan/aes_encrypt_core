library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package aes_pkg is
  type DATA_BLOCK is array (0 to 3, 0 to 3) of std_logic_vector(7 downto 0);
  type DATA_COLUMN is array (0 to 3) of std_logic_vector(7 downto 0);
  type MIX_COL_DATA_COLUMN is array (0 to 3) of std_logic_vector(10 downto 0);
  type BYTEARRAY is array (0 to 255) of std_logic_vector(7 downto 0);
  type SBOX_INOUT_TYPE is array(0 to 15) of std_logic_vector(7 downto 0);
  type DATA_COLUMN_ARRAY is array (0 to 3) of DATA_COLUMN;


end package aes_pkg;
