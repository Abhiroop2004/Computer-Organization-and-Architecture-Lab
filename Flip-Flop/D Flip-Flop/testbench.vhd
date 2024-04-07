library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_tb is
end entity;

architecture tb of DFF_tb is
component D_FLIPFLOP_SOURCE is
Port ( D, CLK : in STD_LOGIC;
Q, Qb : out STD_LOGIC);
end component ;

signal D, CLK, Q, Qb : STD_LOGIC;

begin
dut: D_FLIPFLOP_SOURCE port map( D, CLK, Q, Qb);

process
begin
	CLK <= '0';
	D <= '0';
wait for 10 ns; assert (Q='0' and Qb='0') report "Fail 1/0" severity error;
	CLK <= '1';
    D <= '0';
wait for 10 ns; assert (Q='0' and Qb='1') report "Fail 1/0" severity error;
	CLK <= '0';
    D <= '1'; 
wait for 10 ns; assert (Q='0' and Qb='1') report "Fail 1/0" severity error;
    CLK <= '1';
	D <= '1'; 
wait for 10 ns; assert (Q='1' and Qb='0') report "Fail 1/0" severity error;

wait;
end process;
end tb;
