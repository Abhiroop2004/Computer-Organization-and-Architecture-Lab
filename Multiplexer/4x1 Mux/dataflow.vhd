library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
port(
  a,b,c,d,s1,s2: in std_logic;
  y: out std_logic);
end mux;

architecture rtl of mux is
begin
	process(a,b,c,d,s1,s1,y) is
    begin
    	y<= ((((not s1) and (not s2)) and a) or (((not s1) and s2) and b)) or (((s1 and (not s2)) and c) or ((s1 and s2) and d));
    end process;
end rtl;
