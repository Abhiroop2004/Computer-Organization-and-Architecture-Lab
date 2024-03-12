library ieee;
use ieee.std_logic_1164.all;

entity CLA is
    port (A, B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        S : out std_logic_vector(3 downto 0);
        Cout : out std_logic;
        G,P,C : out std_logic_vector(3 downto 0));
end CLA;

architecture Dataflow of CLA is
begin
    G(0) <= A(0) and B(0);
    P(0) <= A(0) xor B(0);
    C(0) <= G(0) or (P(0) and Cin);

    G(1) <= A(1) and B(1);
    P(1) <= A(1) xor B(1);
    C(1) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);

    G(2) <= A(2) and B(2);
    P(2) <= A(2) xor B(2);
    C(2) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);

    G(3) <= A(3) and B(3);
    P(3) <= A(3) xor B(3);
    C(3) <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin);
	
    S(0) <= P(0) xor Cin;
    S(1) <= P(1) xor C(0);
    S(2) <= P(2) xor C(1);
    S(3) <= P(3) xor C(2);
    -- Carry-out calculation
    Cout <= C(3);
end Dataflow;
