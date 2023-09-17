--==============================================================================================
--				MEIO SOMADOR
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity MEIO_S is
    port(A,B: in std_logic;
    S, Co: out std_logic);
end MEIO_S;

architecture ckt of MEIO_S is
begin
    
    S <= A xor B;
    Co <= A and B;

end ckt;