library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DECODER is
    port (
        A, B : in STD_LOGIC;
        Y3, Y2, Y1, Y0 : out STD_LOGIC);
end DECODER;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_GATE is
    port (a, b : in STD_LOGIC;
        y : out STD_LOGIC);
end AND_GATE;

architecture behavioral of AND_GATE is
begin
    Y <= A and B;
end behavioral;

architecture structural of DECODER is
    component AND_GATE
        port (
            A, B : in STD_LOGIC;
            Y : out STD_LOGIC);
    end component;    
begin
   Y1_A: AND_GATE port map(not A, not B, Y0);
   Y2_A: AND_GATE port map(not A, B,Y1);
   Y3_A: AND_GATE port map( A, not B,Y2);
   Y4_A: AND_GATE port map( A, B,Y3);
end structural;
     
