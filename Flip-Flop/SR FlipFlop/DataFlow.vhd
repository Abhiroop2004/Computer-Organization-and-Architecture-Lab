library ieee;
use ieee.std_logic_1164.all;

entity SRFF is
port(S, R,  CLK : in std_logic;
	Q, Qnot : out std_logic);
end SRFF;

architecture Dataflow of SRFF is
begin
  process(S, R, CLK) is
  begin
    Q <= CLK and (S or (not R and Q));
    Qnot <= CLK and (R or (not S and Qnot));
  end process;
end Dataflow;
