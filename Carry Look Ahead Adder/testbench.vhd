library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Tb_CLA IS
end Tb_CLA;

architecture behavior OF Tb_CLA is
  component CLA
    port(A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      Cin : in std_logic;
      S : out std_logic_vector(3 downto 0);
      Cout : out std_logic);
  end component;

  -- Inputs
  signal A : std_logic_vector(3 downto 0) := (others => '0');
  signal B : std_logic_vector(3 downto 0) := (others => '0');
  signal Cin : std_logic := '0';

  -- Outputs
  signal S : std_logic_vector(3 downto 0);
  signal Cout : std_logic;
  

begin
  uut: CLA port map (
    A => A,
    B => B,
    Cin => Cin,
    S => S,
    Cout => Cout
  );

  -- Stimulus process
  process
  begin
  
    -- Test cases
    A <= "0000"; B <= "0001"; Cin <= '0'; wait for 10 ns;
    A <= "0010"; B <= "0011"; Cin <= '1'; wait for 10 ns; 
    A <= "0100"; B <= "0101"; Cin <= '0'; wait for 10 ns; 
    A <= "0110"; B <= "0111"; Cin <= '1'; wait for 10 ns; 
    A <= "1000"; B <= "1001"; Cin <= '0'; wait for 10 ns;
    A <= "1001"; B <= "1010"; Cin <= '1'; wait for 10 ns;
    A <= "1010"; B <= "1011"; Cin <= '0'; wait for 10 ns;
    A <= "1110"; B <= "1111"; Cin <= '1'; wait for 10 ns;
    A <= "0000"; B <= "0000"; Cin <= '0';
    assert false report "Test done." severity note;
    wait;
  end process;
end;
