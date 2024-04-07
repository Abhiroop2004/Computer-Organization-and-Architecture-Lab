library ieee;
use ieee.std_logic_1164.all;

entity SRFF is
port(S, R, CLK : in std_logic;
	Q, Qnot : out std_logic);
end SRFF;

architecture Behavioural of SRFF is
begin
  process(S, R, CLK) is
  begin
  	if rising_edge(CLK) then
    	if ((S xor R) = '1') then
      		Q <= S;
      		Qnot <= R;
    	end if;
	end if;
  end process;
end Behavioural;
