library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
 
entity mux is
port(
  a,b,c,d,s1,s2: in std_logic;
  y: out std_logic);
end mux;
 
architecture Behavioral of mux is 
begin 
process (a,b,c,d,s1,s2) 
 
begin 
if (s1 <= '0' and s2 <= '0') then 
y <= a; 
elsif (s1 <= '0' and s2 <= '1') then 
y <= b; 
elsif (s1 <= '1' and s2 <= '0') then 
y <= c; 
else 
y <= d; 
end if; 
end process; 
end Behavioral;
