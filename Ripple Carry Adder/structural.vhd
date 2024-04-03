library ieee;
use ieee.std_logic_1164.all;
 
entity full_adder is
Port ( A,B,Cin : in std_logic;
	S,Cout : out std_logic);
end full_adder;
 
architecture Dataflow of full_adder is
begin
	S <= (A xor B) xor Cin;
	Cout <= (A and B) or (A and Cin) or (B and Cin);
end Dataflow;

library ieee;
use ieee.std_logic_1164.all;

entity Ripple_Adder is
port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
	Cin : in STD_LOGIC;
	S : out STD_LOGIC_VECTOR (3 downto 0);
	Cout : out STD_LOGIC);
end Ripple_Adder;

architecture Structural of Ripple_Adder is
-- Full Adder VHDL Code Component Decalaration
component full_adder
port ( A, B, Cin : in STD_LOGIC;
	S, Cout : out STD_LOGIC);
end component;

-- Intermediate Carry declaration
signal c1,c2,c3: STD_LOGIC;
begin
    FA1: full_adder port map( A(0), B(0), Cin, S(0), c1);
    FA2: full_adder port map( A(1), B(1), c1, S(1), c2);
    FA3: full_adder port map( A(2), B(2), c2, S(2), c3);
    FA4: full_adder port map( A(3), B(3), c3, S(3), Cout);
end Structural;
