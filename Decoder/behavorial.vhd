library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity DECODER is
    port ( A,B : in  STD_LOGIC;
           Y3,Y2,Y1,Y0 : out  STD_LOGIC);
end DECODER;

 
architecture behavioral of DECODER is
begin
    process(A, B) is
    begin
        if (A = '0' and B = '0') then
            Y0 <= '1'; 
            Y1 <= '0';
            Y2 <= '0';
            Y3 <= '0';
        elsif (A = '0' and B = '1') then
            Y0 <= '0';
            Y1 <= '1';
            Y2 <= '0';
            Y3 <= '0';
        elsif (A = '1' and B = '0') then
            Y0 <= '0';
            Y1 <= '0';
            Y2 <= '1';
            Y3 <= '0';
        else
            Y0 <= '0';
            Y1 <= '0';
            Y2 <= '0';
            Y3 <= '1';
        end if;
    end process;
end behavioral;
