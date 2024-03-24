library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_tb is
end entity;

architecture tb of DFF_tb is
component D_FLIPFLOP_SOURCE is
Port ( D, CLK, RST : in STD_LOGIC;
Q, Qb : out STD_LOGIC);
end component ;

signal D, CLK, RST, Q, Qb : STD_LOGIC;

begin
dut: D_FLIPFLOP_SOURCE port map(
D => D,
CLK => CLK,
RST => RST,
Q => Q,
Qb => Qb);


--CLK <= not CLK after 1 ns;
  clk_process: process
  begin
  	for i in 1 to 4 loop
    	CLK <= '1';
        wait for 1 ns;
        CLK <= '0';
        wait for 1 ns;
    end loop;
  wait;
  end process;
  
t:process
begin
	RST <= '0';
	D <= '0';
wait for 1 ns;
	RST <= '1';
	D <= '0';
wait for 1 ns;
	RST <= '0';
    D <= '1';
wait for 1 ns;
	RST <= '1';
    D <= '1';
wait for 1 ns;
    RST <= '0';
	D <= '0';
wait for 1 ns;
	RST <= '1';
	D <= '0';
wait for 1 ns;
	RST <= '0';
    D <= '1';
wait for 1 ns;
	RST <= '1';
    D <= '1';
wait;
end process;
end tb;
