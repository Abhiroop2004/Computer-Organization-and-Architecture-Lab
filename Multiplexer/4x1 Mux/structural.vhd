library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity mux is
    port (
        a,b,c,d: in STD_LOGIC;
        s1, s2: in STD_LOGIC;    
        mux_out : out STD_LOGIC
    );
end mux;

architecture structure of mux is
begin
    with s1 & s2 select
        mux_out <=  a when "00",
                    b when "01",
                    c when "10",            
                    d when "11",            
                    '0' when others;    

end structure;
