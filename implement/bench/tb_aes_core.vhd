Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity tb_aes_core is
end entity;

architecture bench of tb_aes_core is
  component aes_core is
    port (
      clk       : in std_logic;
      data_in   : in std_logic_vector(127 downto 0);
      data_out  : out std_logic_vector(127 downto 0);
      reset_n   : in std_logic
    );
  end component;

  signal clk       : std_logic;
  signal reset_n   : std_logic;
  signal data_in   : std_logic_vector(127 downto 0);
  signal data_out  : std_logic_vector(127 downto 0);
begin
  DUT: aes_core port map(
    clk => clk,
    data_in => data_in,
    data_out => data_out,
    reset_n => reset_n
  );


  process
  begin
    reset_n <= '0';
    wait for 3 ns;
    reset_n <= '1';
    wait;
  end process;

  process
  begin
    clk <= '0';
    wait for 2 ns;
    clk <= '1';
    wait for 2 ns;
  end process;
end architecture;
