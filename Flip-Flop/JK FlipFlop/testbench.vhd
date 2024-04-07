library ieee;
use ieee.std_logic_1164.all;

entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

component JKFF
port(J, K, CLK : in std_logic;
	Q, Qnot : out std_logic);
end component;

signal J, K, CLK, Q, Qnot : std_logic;

begin
DUT: JKFF port map (J, K, CLK, Q, Qnot);
    process
    begin
        J <= '1';   K <='0'; CLK <='0';  wait for 10 ns;
        assert (Q='1' and Qnot='0') report "Fail 1/0" severity error;
        J <= '1';   K <='0'; CLK <='1';  wait for 10 ns;
        assert (Q='1' and Qnot='0') report "Fail 1/0" severity error;
        
        J <= '0';   K <='1'; CLK <='0';  wait for 10 ns;
        assert (Q='1' and Qnot='0') report "Fail 0/1" severity error;
        J <= '0';   K <='1'; CLK <='1';  wait for 10 ns;
        assert (Q='0' and Qnot='1') report "Fail 0/1" severity error;
        
        J <= '1';   K <='1'; CLK <='0';  wait for 10 ns;
        assert (Q='0' and Qnot='1') report "Fail 1/1" severity error;
        J <= '1';   K <='1'; CLK <='1';  wait for 10 ns;
        assert (Q='1' and Qnot='0') report "Fail 1/1" severity error;
        
        J <= '0';   K <='0'; CLK <='0';  wait for 10 ns;
        assert (Q='1' and Qnot='0') report "Fail 0/0" severity error;
        J <= '0';   K <='0'; CLK <='1';  wait for 10 ns;
        assert (Q='1' and Qnot='0') report "Fail 0/0" severity error;
        
        assert false report "Test done." severity note;
    wait;
    end process;
end; 
