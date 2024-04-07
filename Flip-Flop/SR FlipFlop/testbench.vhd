library ieee;
use ieee.std_logic_1164.all;

entity SRFF_tb is
end entity; 

architecture tb of SRFF_tb is
component SRFF
port(S, R, CLK : in std_logic;
	Q, Qnot : out std_logic);
end component;

signal S, R, CLK, Q, Qnot : std_logic;

begin
DUT: SRFF port map (S, R, CLK, Q, Qnot);
    process
    begin
		S <= '0';   R <='0'; CLK <='0';  wait for 10 ns;
        assert (Q='0' and Qnot='1') report "Fail 0/0" severity error;
        S <= '0';   R <='0'; CLK <='1';  wait for 10 ns;
        assert (Q='0' and Qnot='1') report "Fail 0/0" severity error;
        
    	S <= '1';   R <='0'; CLK <='0';  wait for 10 ns;
        assert (Q='0' and Qnot='1') report "Fail 1/0" severity error;
        S <= '1';   R <='0'; CLK <='1';  wait for 10 ns;
        assert (Q='1' and Qnot='0') report "Fail 1/0" severity error;
        
        S <= '0';   R <='1'; CLK <='0';  wait for 10 ns;
        assert (Q='1' and Qnot='0') report "Fail 0/1" severity error;
        S <= '0';   R <='1'; CLK <='1';  wait for 10 ns;
        assert (Q='0' and Qnot='1') report "Fail 0/1" severity error;
                
        assert false report "Test done." severity note;                
    wait;
    end process;
end; 
