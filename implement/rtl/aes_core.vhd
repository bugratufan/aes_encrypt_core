Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

library work;
use work.aes_pkg.all;

entity aes_core is
  port (
    clk       : in std_logic;
    data_in   : in std_logic_vector(127 downto 0);
    data_out   : out std_logic_vector(127 downto 0);
    reset_n    : in std_logic
  );
end entity;

architecture arch of aes_core is

  component add_round_key is
    port (
      data_in : in DATA_BLOCK;
      cipher_block : in DATA_BLOCK;
      data_out : out DATA_BLOCK
    );
  end component;

  component create_round_key is
    port (
      cipher_block : in DATA_BLOCK;
      round_count : in std_logic_vector(7 downto 0);
      out_block : out DATA_BLOCK
    );
  end component;

  component sbox_block is
    port (
      data_in  : in DATA_BLOCK;
      data_out : out DATA_BLOCK
    );
  end component;

  component mix_column_block is
    port (
      data_in  : in DATA_BLOCK;
      data_out : out DATA_BLOCK
    );
  end component;

  component shift_rows is
    port (
      data_in : in DATA_BLOCK;
      data_out : out DATA_BLOCK
    );
  end component;

  type state_type is (startState, initState, roundState, endState);
  signal core_state : state_type;
  signal aes_core_data_in : DATA_BLOCK := ((X"32", X"88", X"31", X"e0"),
                                           (X"43", X"5a", X"31", X"37"),
                                           (X"f6", X"30", X"98", X"07"),
                                           (X"a8", X"8d", X"a2", X"34"));

  signal aes_core_cipher : DATA_BLOCK := ((X"2b", X"28", X"ab", X"09"),
                                           (X"7e", X"ae", X"f7", X"cf"),
                                           (X"15", X"d2", X"15", X"4f"),
                                           (X"16", X"a6", X"88", X"3c"));

  signal roundKey_in : DATA_BLOCK;
  signal roundKey_out : DATA_BLOCK;
  signal roundCounter : integer range 0 to 11;

  signal ark_data_in    : DATA_BLOCK;
  signal ark_data_out   : DATA_BLOCK;
  signal ark_cipher_block: DATA_BLOCK;

  signal crk_cipher_block   : DATA_BLOCK;
  signal crk_out_block   : DATA_BLOCK;
  signal crk_round_count    : std_logic_vector(7 downto 0);

  signal sb_data_in    : DATA_BLOCK;
  signal sb_data_out   : DATA_BLOCK;

  signal sr_data_in    : DATA_BLOCK;
  signal sr_data_out   : DATA_BLOCK;

  signal mc_data_in    : DATA_BLOCK;
  signal mc_data_out   : DATA_BLOCK;

  signal tmp_data : DATA_BLOCK;

  signal ark_init_data_out : DATA_BLOCK;

begin

  u0: create_round_key port map(
    cipher_block => crk_cipher_block,
    round_count  => crk_round_count,
    out_block    => crk_out_block
  );

  u1: add_round_key port map(
    data_in      => ark_data_in,
    data_out     => ark_data_out,
    cipher_block => ark_cipher_block
  );

  u2: sbox_block port map(
    data_in => sb_data_in,
    data_out => sb_data_out
  );

  u3: shift_rows port map(
    data_in => sr_data_in,
    data_out => sr_data_out
  );

  u4: mix_column_block port map(
    data_in => mc_data_in,
    data_out => mc_data_out
  );

  process(clk, reset_n)
  begin
    if reset_n = '0' then
      core_state <= startState;
      crk_round_count <= "00000000";
    elsif(clk'event and clk = '1') then
      case( core_state ) is
        when startState =>
          ark_cipher_block <= aes_core_cipher;
          ark_data_in <= aes_core_data_in;
          crk_round_count <= "00000001";
          crk_cipher_block <= aes_core_cipher;
          core_state <= initState;
        when initState =>
          ark_data_in <= ark_data_out;
          ark_cipher_block <= crk_out_block;
          crk_cipher_block <= crk_out_block;
          crk_round_count <= crk_round_count sll 1;
          tmp_data <= ark_data_out;
          core_state <= roundState;
        when roundState  =>
          ark_data_in <= mc_data_out;
          ark_cipher_block <= crk_out_block;
          crk_cipher_block <= crk_out_block;
          crk_round_count <= crk_round_count sll 1;
          tmp_data <= ark_data_out;
          core_state <= roundState;
        when others =>
      end case;
    end if;
  end process;

  sb_data_in <= tmp_data;
  sr_data_in <= sb_data_out;
  mc_data_in <= sr_data_out;


end architecture;
