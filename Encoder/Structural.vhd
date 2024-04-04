library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity encoder is
port(
	i : in std_logic_vector(3 downto 0);
    o1, o0 : out std_logic );
end encoder;


library ieee;
use ieee.std_logic_1164.all;
entity orgate is
    port ( i1, i2 : in std_logic;
           o1 : out std_logic);
end orgate;
architecture dataflow of orgate is begin
    o1 <= i1 or i2;
end dataflow;


architecture Structural of encoder is
	component orgate -- and component declaration
	port (i1, i2: in std_logic;
		  o1: out std_logic);
	end component;
begin
	c0: orgate port map (i1 => i(1), i2 => i(3), o1 => o0);
    c1: orgate port map (i1 => i(2), i2 => i(3), o1 => o1);
end Structural;