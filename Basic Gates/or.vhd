library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate is
port(
  a,b: in std_logic;
  q: out std_logic);
end or_gate;

architecture rtl of or_gate is
begin
  process(a,b) is
  begin
    q <= a or b;
  end process;
end rtl;
