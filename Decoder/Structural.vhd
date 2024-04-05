library ieee;
use ieee.std_logic_1164.all;
entity decoder is
port(
	e, s1, s0 : in std_logic;
	o : out std_logic_vector(3 downto 0) );
end decoder;


library ieee;
use ieee.std_logic_1164.all;
entity andgate is
    port ( i1, i2, i3 : in std_logic;
           o1 : out std_logic);
end andgate;
architecture dataflow of andgate is begin
    o1 <= i1 and i2 and i3;
end dataflow;


architecture Structural of decoder is
	component andgate -- and component declaration
	port (i1, i2, i3: in std_logic;
		  o1: out std_logic);
	end component;
begin
	c0: andgate port map (i1 => e, i2 => not s1, i3 => not s0, o1 => o(0));
    c1: andgate port map (i1 => e, i2 => not s1, i3 => s0, o1 => o(1));
    c2: andgate port map (i1 => e, i2 => s1, i3 => not s0, o1 => o(2));
    c3: andgate port map (i1 => e, i2 => s1, i3 => s0, o1 => o(3));
end Structural;