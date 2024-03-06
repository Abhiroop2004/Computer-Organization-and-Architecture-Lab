library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity testbench is
end testbench;

architecture tb of testbench is
component DECODER is
Port ( A,B : in STD_LOGIC;
Y3,Y2,Y1,Y0 : out STD_LOGIC);
end component;

signal A, B, Y3, Y2, Y1, Y0 : STD_LOGIC;

begin

DUT: DECODER port map(
A => A, B => B,
Y0 => Y0, Y1 => Y1,
Y2 => Y2, Y3 => Y3);

process 
begin

A <= '0';
B <= '0';
wait for 10 ns;
assert(Y0='1');

A <= '0';
B <= '1';
wait for 10 ns;
assert(Y1='1');

A <= '1';
B <= '0';
wait for 10 ns;
assert(Y2='1');

A <= '1';
B <= '1';
wait for 10 ns;
assert(Y3='1');

A <= '0';
B <= '0';
assert false report "Test done." severity note;
wait;

end process;
end tb;
