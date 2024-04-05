library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
 
entity decoder is
port(
	e, s0, s1: in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(3 downto 0) );
end decoder;


architecture Behavioral of decoder is
begin
	process(e, s0, s1, o) is
	begin
    	if(e='1') then
    		if(s1='0') then
            	o <= (0 => not s0, 1 => s0, others => '0');
    		elsif(s1='1') then
    			o <= (2 => not s0, 3 => s0, others => '0');
			end if;
        end if;
  	end process;
end Behavioral;