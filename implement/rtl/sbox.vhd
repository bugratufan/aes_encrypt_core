library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;

entity sbox is
  port (
    data_in : in std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0)
  );
end entity;

architecture arch of sbox is

  constant encrypt_table : BYTEARRAY := (
    0	=> X"63", 1 => X"7C", 2 => X"77", 3 => X"7B", 4 => X"F2", 5 => X"6B", 6 => X"6F", 7 => X"C5",
    8	=> X"30", 9 => X"01", 10 => X"67", 11 => X"2B", 12 => X"FE", 13 => X"D7", 14 => X"AB", 15 => X"76",
    16	=> X"CA", 17 => X"82", 18 => X"C9", 19 => X"7D", 20 => X"FA", 21 => X"59", 22 => X"47", 23 => X"F0",
    24	=> X"AD", 25 => X"D4", 26 => X"A2", 27 => X"AF", 28 => X"9C", 29 => X"A4", 30 => X"72", 31 => X"C0",
    32	=> X"B7", 33 => X"FD", 34 => X"93", 35 => X"26", 36 => X"36", 37 => X"3F", 38 => X"F7", 39 => X"CC",
    40	=> X"34", 41 => X"A5", 42 => X"E5", 43 => X"F1", 44 => X"71", 45 => X"D8", 46 => X"31", 47 => X"15",
    48	=> X"04", 49 => X"C7", 50 => X"23", 51 => X"C3", 52 => X"18", 53 => X"96", 54 => X"05", 55 => X"9A",
    56	=> X"07", 57 => X"12", 58 => X"80", 59 => X"E2", 60 => X"EB", 61 => X"27", 62 => X"B2", 63 => X"75",
    64	=> X"09", 65 => X"83", 66 => X"2C", 67 => X"1A", 68 => X"1B", 69 => X"6E", 70 => X"5A", 71 => X"A0",
    72	=> X"52", 73 => X"3B", 74 => X"D6", 75 => X"B3", 76 => X"29", 77 => X"E3", 78 => X"2F", 79 => X"84",
    80	=> X"53", 81 => X"D1", 82 => X"00", 83 => X"ED", 84 => X"20", 85 => X"FC", 86 => X"B1", 87 => X"5B",
    88	=> X"6A", 89 => X"CB", 90 => X"BE", 91 => X"39", 92 => X"4A", 93 => X"4C", 94 => X"58", 95 => X"CF",
    96	=> X"D0", 97 => X"EF", 98 => X"AA", 99 => X"FB", 100 => X"43", 101 => X"4D", 102 => X"33", 103 => X"85",
    104 => X"45", 105 => X"F9", 106 => X"02", 107 => X"7F", 108 => X"50", 109 => X"3C", 110 => X"9F", 111 => X"A8",
    112 => X"51", 113 => X"A3", 114 => X"40", 115 => X"8F", 116 => X"92", 117 => X"9D", 118 => X"38", 119 => X"F5",
    120 => X"BC", 121 => X"B6", 122 => X"DA", 123 => X"21", 124 => X"10", 125 => X"FF", 126 => X"F3", 127 => X"D2",
    128 => X"CD", 129 => X"0C", 130 => X"13", 131 => X"EC", 132 => X"5F", 133 => X"97", 134 => X"44", 135 => X"17",
    136 => X"C4", 137 => X"A7", 138 => X"7E", 139 => X"3D", 140 => X"64", 141 => X"5D", 142 => X"19", 143 => X"73",
    144 => X"60", 145 => X"81", 146 => X"4F", 147 => X"DC", 148 => X"22", 149 => X"2A", 150 => X"90", 151 => X"88",
    152 => X"46", 153 => X"EE", 154 => X"B8", 155 => X"14", 156 => X"DE", 157 => X"5E", 158 => X"0B", 159 => X"DB",
    160 => X"E0", 161 => X"32", 162 => X"3A", 163 => X"0A", 164 => X"49", 165 => X"06", 166 => X"24", 167 => X"5C",
    168 => X"C2", 169 => X"D3", 170 => X"AC", 171 => X"62", 172 => X"91", 173 => X"95", 174 => X"E4", 175 => X"79",
    176 => X"E7", 177 => X"C8", 178 => X"37", 179 => X"6D", 180 => X"8D", 181 => X"D5", 182 => X"4E", 183 => X"A9",
    184 => X"6C", 185 => X"56", 186 => X"F4", 187 => X"EA", 188 => X"65", 189 => X"7A", 190 => X"AE", 191 => X"08",
    192 => X"BA", 193 => X"78", 194 => X"25", 195 => X"2E", 196 => X"1C", 197 => X"A6", 198 => X"B4", 199 => X"C6",
    200 => X"E8", 201 => X"DD", 202 => X"74", 203 => X"1F", 204 => X"4B", 205 => X"BD", 206 => X"8B", 207 => X"8A",
    208 => X"70", 209 => X"3E", 210 => X"B5", 211 => X"66", 212 => X"48", 213 => X"03", 214 => X"F6", 215 => X"0E",
    216 => X"61", 217 => X"35", 218 => X"57", 219 => X"B9", 220 => X"86", 221 => X"C1", 222 => X"1D", 223 => X"9E",
    224 => X"E1", 225 => X"F8", 226 => X"98", 227 => X"11", 228 => X"69", 229 => X"D9", 230 => X"8E", 231 => X"94",
    232 => X"9B", 233 => X"1E", 234 => X"87", 235 => X"E9", 236 => X"CE", 237 => X"55", 238 => X"28", 239 => X"DF",
    240 => X"8C", 241 => X"A1", 242 => X"89", 243 => X"0D", 244 => X"BF", 245 => X"E6", 246 => X"42", 247 => X"68",
    248 => X"41", 249 => X"99", 250 => X"2D", 251 => X"0F", 252 => X"B0", 253 => X"54", 254 => X"BB", 255 => X"16"
    );


begin
  data_out <= encrypt_table(to_integer(UNSIGNED(data_in)));

end architecture;
