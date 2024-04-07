library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate is
port(
  a,b: in std_logic;
  q: out std_logic);
end xor_gate;

architecture rtl of xor_gate is
begin
  process(a,b) is
  begin
    q <= a xor b;
  end process;
end rtl;
