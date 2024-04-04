library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component decoder is
port(
  e, s1, s0 : in std_logic;
  o : out std_logic_vector(3 downto 0) );
end component;

signal e, s1, s0 : std_logic;
signal o : std_logic_vector(3 downto 0);


begin

  -- Connect DUT
  DUT: decoder port map(e, s1, s0, o);

  process
  begin
    e  <= '0';
    s1 <= 'X';
    s0 <= 'X';
    wait for 1 ns;
    assert(o="0000") report "Fail 0/X/X" severity error;
  
    e  <= '1';
    s1 <= '0';
    s0 <= '0';
    wait for 1 ns;
    assert(o="0001") report "Fail 1/0/0" severity error;
    
    e  <= '1';
    s1 <= '0';
    s0 <= '1';
    wait for 1 ns;
    assert(o="0010") report "Fail 1/0/1" severity error;
 
    e  <= '1';
    s1 <= '1';
    s0 <= '0';
    wait for 1 ns;
    assert(o="0100") report "Fail 1/1/0" severity error;
  
    e  <= '1';
    s1 <= '1';
    s0 <= '1';
    wait for 1 ns;
    assert(o="1000") report "Fail 1/1/1" severity error;

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;