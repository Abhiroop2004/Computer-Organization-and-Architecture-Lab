library ieee;
use ieee.std_logic_1164.all;

entity JKFF is
port(J, K, CLK : in std_logic;
	Q, Qnot : out std_logic);
end JKFF;

architecture Behavioural of JKFF is
begin
  process(J, K, CLK) is
  begin
  	if rising_edge(CLK) then
  	if ((J xor K) = '1') then
      Q <= J;
      Qnot <= K;
    elsif (J='1' and K='1') then
    	Q <=  not Q;
        Qnot <= not Qnot;
    end if;
    end if;
  end process;
end Behavioural;
