-- Testbench for Multiplexer
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component mux is
port(
  a,b,c,d,s1,s2:in std_logic;
  y: out std_logic);
end component;

signal a,b,c,d,s1,s2,y: std_logic;

begin

  -- Connect DUT
  DUT: mux port map(a,b,c,d, s1, s2, y);

  process
  begin
  	a <= '1';
	b <= '1';
	c <= '1';
	d <= '1';
    
    s1 <= '0';
    s2 <= '0';
    wait for 1 ns;
    assert(y=a);
    
    s1 <= '0';
    s2 <= '1';
    wait for 1 ns;
    assert(y=b);
    
    s1 <= '1';
    s2 <= '0';
    wait for 1 ns;
    assert(y=c);
  
	s1 <= '1';
    s2 <= '1';
    wait for 1 ns;
    assert(y=d);
    
    -- Clear inputs
    s1 <= '0';
    s1 <= '0';
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
