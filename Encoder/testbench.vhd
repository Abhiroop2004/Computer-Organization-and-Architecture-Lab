library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component encoder is
port(
  i : in std_logic_vector(3 downto 0);
  o1, o0 : out std_logic);
end component;


signal i : std_logic_vector(3 downto 0);
signal o1, o0 : std_logic;


begin

  -- Connect DUT
  DUT: encoder port map(i, o1, o0);

  process
  begin
    i <= (0=>'1', others=>'0');
    wait for 1 ns;
    assert(o1='0' and o0='0') report "Fail 0/0/0/1" severity error;
    
    i <= (1=>'1', others=>'0');
    wait for 1 ns;
    assert(o1='0' and o0='1') report "Fail 0/0/1/0" severity error;
 
    i <= (2=>'1', others=>'0');
    wait for 1 ns;
    assert(o1='1' and o0='0') report "Fail 0/1/0/0" severity error;
  
    i <= (3=>'1', others=>'0');
    wait for 1 ns;
    assert(o1='1' and o0='1') report "Fail 1/0/0/0" severity error;
    
    -- Clear inputs
    i <= (others => '0');

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;