library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;


entity sbox_block is
  port (
    data_in  : in DATA_BLOCK;
    data_out : out DATA_BLOCK
  );
end entity;

architecture arch of sbox_block is
  component sbox is
    port (
      data_in : in std_logic_vector(7 downto 0);
      data_out : out std_logic_vector(7 downto 0)
    );
  end component;
begin

  gen0: for i in 0 to 3 generate
    U0: sbox port map (
        data_in  => data_in(0,i),
        data_out => data_out(0,i)
    );
  end generate;

  gen1: for i in 0 to 3 generate
    U1: sbox port map (
        data_in  => data_in(1,i),
        data_out => data_out(1,i)
    );
  end generate;

  gen2: for i in 0 to 3 generate
    U2: sbox port map (
        data_in  => data_in(2,i),
        data_out => data_out(2,i)
    );
  end generate;

  gen3: for i in 0 to 3 generate
    U3: sbox port map (
        data_in  => data_in(3,i),
        data_out => data_out(3,i)
    );
  end generate;
end architecture;
