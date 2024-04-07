library ieee;
use ieee.std_logic_1164.all;

entity SRFF is
port(S, R, CLK : in std_logic;
	Q, Qnot : out std_logic);
end SRFF;


library ieee;
use ieee.std_logic_1164.all;

entity SRlatch is
port(S, R : in std_logic;
	Q, Qnot : out std_logic);
end SRlatch;


architecture Behavioural of SRlatch is
begin
	process(S, R) is
    begin
    	if ((S xor R) = '1') then
        	Q <= S;
            Qnot <= R;
        end if;
    end process;
end Behavioural;


architecture Structural of SRFF is

component SRlatch
port(S, R : in std_logic;
	Q, Qnot : out std_logic);
end component;

signal Q_temp, Qnot_temp : std_logic;

begin
  SR1: SRlatch port map(S, R, Q_temp, Qnot_temp);
   process (CLK)
    begin
        if rising_edge(CLK) then
            Q <= Q_temp;
            Qnot <= Qnot_temp;
        end if;
    end process;
end Structural;
