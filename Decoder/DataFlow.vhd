library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity decoder is
port(
	e, s0, s1: in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(3 downto 0) );
end decoder;


architecture dataflow of decoder is
begin
	process(e, s0, s1, o) is
	begin
    	o <= ( 0=>(e and (not s0) and (not s1)) , 1=>(e and s0 and (not s1)), 2=>(e and (not s0) and s1), 3=>(e and s0 and s1), others=>'0');  
	end process;
end dataflow;

