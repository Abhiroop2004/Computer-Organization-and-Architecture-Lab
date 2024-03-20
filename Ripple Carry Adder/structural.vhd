library ieee;
use ieee.std_logic_1164.all;
 
entity full_adder_vhdl_code is
Port ( A,B,Cin : in std_logic;
	S,Cout : out std_logic);
end full_adder_vhdl_code;
 
architecture Behavioral of full_adder_vhdl_code is
begin
	S <= (A xor B) xor Cin;
	Cout <= (A and B) or (A xor B);
end Behavioral;

library IEEE;
use IEEE.std_logic_1164.all;

entity Ripple_Adder is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end Ripple_Adder;

architecture Behavioral of Ripple_Adder is
-- Full Adder VHDL Code Component Decalaration
component full_adder_vhdl_code
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
Cout : out STD_LOGIC);
end component;

-- Intermediate Carry declaration
signal c1,c2,c3: STD_LOGIC;
begin
-- Port Mapping Full Adder 4 times
FA1: full_adder_vhdl_code port map( A(0), B(0), Cin, S(0), c1);
FA2: full_adder_vhdl_code port map( A(1), B(1), c1, S(1), c2);
FA3: full_adder_vhdl_code port map( A(2), B(2), c2, S(2), c3);
FA4: full_adder_vhdl_code port map( A(3), B(3), c3, S(3), Cout);
end Behavioral;
