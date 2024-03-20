LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Tb_Ripple_Adder IS
END Tb_Ripple_Adder;

ARCHITECTURE behavior OF Tb_Ripple_Adder IS

COMPONENT Ripple_Adder
PORT(A : IN std_logic_vector(3 downto 0);
B : IN std_logic_vector(3 downto 0);
Cin : IN std_logic;
S : OUT std_logic_vector(3 downto 0);
Cout : OUT std_logic);
END COMPONENT;

--Inputs
signal A : std_logic_vector(3 downto 0) := (others => '0');
signal B : std_logic_vector(3 downto 0) := (others => '0');
signal Cin : std_logic := '0';
--Outputs
signal S : std_logic_vector(3 downto 0);
signal Cout : std_logic;
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: Ripple_Adder PORT MAP (
A => A,
B => B,
Cin => Cin,
S => S,
Cout => Cout);
-- Stimulus process
stim_proc: process
begin
 	A <= "0000"; B <= "0001"; Cin <= '0'; wait for 10 ns;
    A <= "0010"; B <= "0011"; Cin <= '1'; wait for 10 ns; 
    A <= "0100"; B <= "0101"; Cin <= '0'; wait for 10 ns; 
    A <= "0110"; B <= "0111"; Cin <= '1'; wait for 10 ns; 
    A <= "1000"; B <= "1001"; Cin <= '0'; wait for 10 ns;
    A <= "1010"; B <= "1011"; Cin <= '1'; wait for 10 ns;
    A <= "1110"; B <= "1111"; Cin <= '0'; wait for 10 ns;
    A <= "0000"; B <= "0000"; Cin <= '0';
wait;
end process;
END; 
