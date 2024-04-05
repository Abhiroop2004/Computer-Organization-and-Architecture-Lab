library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity encoder is
port(
	i : in std_logic_vector(3 downto 0);
    o1, o0 : out std_logic );
end encoder;


architecture dataflow of encoder is
begin
	process(i, o0, o1) is
	begin
    	o0 <= i(1) or i(3);
        o1 <= i(2) or i(3);  
	end process;
end dataflow;