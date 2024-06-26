library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
port(
  a,b,c: in std_logic;
  sum,carry: out std_logic);
end full_adder;

architecture dataflow of full_adder is
begin
  process(a, b, c) is
  begin
    sum <= (a xor b) xor c;
    carry <= (a and b) or (c and b) or (c and a);
  end process;
end dataflow;
