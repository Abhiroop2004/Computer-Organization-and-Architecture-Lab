library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
port(
  a,b,c: in std_logic;
  sum,carry: out std_logic);
end full_adder;

architecture behavorial of full_adder is
begin
  process(a, b, c) is
  begin
   if (b/=c) then
    sum <= not a;
    carry = a;
  else
    sum <= a;
    carry <= b;
  end if;
  end process;
end behavorial;
