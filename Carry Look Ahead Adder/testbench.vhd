LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Tb_CLA IS
END Tb_CLA;

ARCHITECTURE behavior OF Tb_CLA IS
  -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT CLA
    PORT(
      A : IN std_logic_vector(3 downto 0);
      B : IN std_logic_vector(3 downto 0);
      Cin : IN std_logic;
      S : OUT std_logic_vector(3 downto 0);
      Cout : OUT std_logic
    );
  END COMPONENT;

  -- Inputs
  SIGNAL A : std_logic_vector(3 downto 0) := (others => '0');
  SIGNAL B : std_logic_vector(3 downto 0) := (others => '0');
  SIGNAL Cin : std_logic := '0';

  -- Outputs
  SIGNAL S : std_logic_vector(3 downto 0);
  SIGNAL Cout : std_logic;
  
BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut: CLA PORT MAP (
    A => A,
    B => B,
    Cin => Cin,
    S => S,
    Cout => Cout
  );

  -- Stimulus process
  PROCESS
  BEGIN
    -- Hold reset state for 100 ns.
    WAIT FOR 10 ns;

    -- Test cases
    A <= "0000"; B <= "0001"; Cin <= '0'; WAIT FOR 10 ns;
    A <= "0010"; B <= "0011"; Cin <= '1'; WAIT FOR 10 ns; 
    A <= "0100"; B <= "0101"; Cin <= '0'; WAIT FOR 10 ns; 
    A <= "0110"; B <= "0111"; Cin <= '1'; WAIT FOR 10 ns; 
    A <= "1000"; B <= "1001"; Cin <= '0'; WAIT FOR 10 ns;
    A <= "1001"; B <= "1010"; Cin <= '1'; WAIT FOR 10 ns;
    A <= "1010"; B <= "1011"; Cin <= '0'; WAIT FOR 10 ns;
    A <= "1110"; B <= "1111"; Cin <= '1'; WAIT FOR 10 ns;
    A <= "0000"; B <= "0000"; Cin <= '0';
    assert false report "Test done." severity note;
    WAIT;
  END PROCESS;
END;
