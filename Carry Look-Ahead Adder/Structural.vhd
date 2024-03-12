library ieee;
use ieee.std_logic_1164.all;
 
entity Partial_Full_Adder is
Port ( A : in std_logic;
B : in std_logic;
Cin : in std_logic;
S : out std_logic;
P : out std_logic;
G : out std_logic);
end Partial_Full_Adder;
 
architecture Behavioral of Partial_Full_Adder is
begin
 
S <= (A xor B) xor Cin;
P <= A xor B;
G <= A and B;
 
end Behavioral;

library ieee;
use ieee.std_logic_1164.all;

entity CLA is
Port (A : in std_logic_vector (3 downto 0);
	B : in std_logic_vector (3 downto 0);
	Cin : in std_logic;
	S : out std_logic_vector (3 downto 0);
	Cout : out std_logic);
end CLA; 

architecture Behavioral of CLA is
    component Partial_Full_Adder is
        Port (A : in std_logic;
            B : in std_logic;
            Cin : in std_logic;
            S : out std_logic;
            P : out std_logic;
            G : out std_logic);
    end component;

    signal C, P, G: std_logic_vector(3 downto 0) := (others => '0'); 

begin
    PFA1: Partial_Full_Adder port map (A(0), B(0), Cin, S(0), P(0), G(0));
    PFA2: Partial_Full_Adder port map (A(1), B(1), C(0), S(1), P(1), G(1));
    PFA3: Partial_Full_Adder port map (A(2), B(2), C(1), S(2), P(2), G(2));
    PFA4: Partial_Full_Adder port map (A(3), B(3), C(2), S(3), P(3), G(3));
	Cout <= C(3);
    
    -- Generating Carry
    c(0) <= G(0) OR (P(0) AND Cin);
    c(1) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
    c(2) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);
	C(3) <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin);
end Behavioral;
