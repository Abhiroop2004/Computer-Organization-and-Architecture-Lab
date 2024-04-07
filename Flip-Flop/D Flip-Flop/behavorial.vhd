library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FLIPFLOP_SOURCE is
Port ( D, CLK : in  STD_LOGIC;
Q, Qb : out  STD_LOGIC);
end D_FLIPFLOP_SOURCE;

architecture Behavioral of D_FLIPFLOP_SOURCE is
begin
process (D, CLK)
begin     
if (CLK='1') then 
    if (D='0') then
        Q <= '0';
        Qb <= '1';
    else
        Q <= '1';
        Qb <= '0';
     end if;   
end if;
end process;
end Behavioral;
