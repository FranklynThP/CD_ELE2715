--==============================================================================================
--				                    SUBTRATOR COMPLETO
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity SUBCOMP is
    port ( a, b : in std_logic;
            Ti : in std_logic;
            Tout : out std_logic;
            S : out std_logic);
end SUBCOMP;

architecture ckt of SUBCOMP is

begin

    Tout <= (not a and b) or (not a and Ti) or (b and Ti);
    S <= (a xor b) xor Ti;

end ckt;