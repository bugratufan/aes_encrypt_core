library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;

entity shift_rows is
  port (
    data_in : in DATA_BLOCK;
    data_out : out DATA_BLOCK
  );
end entity;

architecture arch of shift_rows is
begin

  data_out(0,0) <= data_in(0,0);
  data_out(0,1) <= data_in(0,1);
  data_out(0,2) <= data_in(0,2);
  data_out(0,3) <= data_in(0,3);

  data_out(1,0) <= data_in(1,1);
  data_out(1,1) <= data_in(1,2);
  data_out(1,2) <= data_in(1,3);
  data_out(1,3) <= data_in(1,0);

  data_out(2,0) <= data_in(2,2);
  data_out(2,1) <= data_in(2,3);
  data_out(2,2) <= data_in(2,0);
  data_out(2,3) <= data_in(2,1);

  data_out(3,0) <= data_in(3,3);
  data_out(3,1) <= data_in(3,0);
  data_out(3,2) <= data_in(3,1);
  data_out(3,3) <= data_in(3,2);

end architecture;
