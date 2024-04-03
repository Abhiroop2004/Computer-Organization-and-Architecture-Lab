library ieee;
use ieee.std_logic_1164.all;

entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

component Ripple_Adder
port(A, B : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	S : out std_logic_vector(3 downto 0);
	Cout : out std_logic);
end component;

signal A, B, S : std_logic_vector(3 downto 0);
signal Cin, Cout : std_logic;

begin
DUT: Ripple_Adder port map ( A, B, Cin, S, Cout);
    process
    begin
        A <= "1000"; B <= "0001"; Cin <= '0'; wait for 10 ns;
        assert (S="1001" and Cout='0') report "Fail 1000/0001/0" severity error;
        A <= "0100"; B <= "0010"; Cin <= '1'; wait for 10 ns;
        assert (S="0111" and Cout='0') report "Fail 0100/0010/1" severity error;
        A <= "0010"; B <= "0100"; Cin <= '0'; wait for 10 ns;
        assert (S="0110" and Cout='0') report "Fail 0010/0100/0" severity error;
        A <= "0001"; B <= "1000"; Cin <= '1'; wait for 10 ns;
        assert (S="1010" and Cout='0') report "Fail 0001/1000/1" severity error;
        A <= "0000"; B <= "0000"; Cin <= '0'; wait for 10 ns;
        assert (S="0000" and Cout='0') report "Fail 0000/0000/0" severity error;
        A <= "1111"; B <= "1111"; Cin <= '1'; wait for 10 ns;
        assert (S="1111" and Cout='1') report "Fail 1111/1111/1" severity error;
        A <= "0110"; B <= "0110"; Cin <= '0'; wait for 10 ns;
        assert (S="1100" and Cout='0') report "Fail 0110/0110/0" severity error;
        
        assert false report "Test done." severity note;
    wait;
    end process;
end; 
