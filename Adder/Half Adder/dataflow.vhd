library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
port(
  a,b: in std_logic;
  sum,carry: out std_logic);
end half_adder;

architecture rtl of half_adder is
begin
  process(a, b) is
  begin
    sum <= a xor b;
    carry <= a and b;
  end process;
end rtl;
