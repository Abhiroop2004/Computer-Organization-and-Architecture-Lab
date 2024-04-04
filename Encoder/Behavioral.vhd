library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity encoder is
port(
	i : in std_logic_vector(3 downto 0);
    o1, o0 : out std_logic );
end encoder;


architecture Behavioral of encoder is
begin
	process(i, o0, o1) is
	begin
    	o0 <= '0';
        o1 <= '0';
    	if(i(1)='1' or i(3)='1') then
        	o0 <= '1';
        end if;
        if(i(2)='1' or i(3)='1') then
        	o1 <= '1';
        end if;
  	end process;
end Behavioral;
