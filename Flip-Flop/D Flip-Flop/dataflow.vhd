library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FLIPFLOP_SOURCE is
Port ( D, CLK : in  STD_LOGIC;
Q, Qb : out  STD_LOGIC);
end D_FLIPFLOP_SOURCE;

architecture dataflow of D_FLIPFLOP_SOURCE is
begin
process (D, CLK)
begin     
if rising_edge(CLK) then
	Q <= D;
    Qb <= not D;
end if;
end process;
end dataflow;
