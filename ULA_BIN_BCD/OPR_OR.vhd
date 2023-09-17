--==============================================================================================
--				                    OPERACAO OR
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity OPR_OR is
    port (A, B : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0);
            Z : out std_logic);
end OPR_OR;

architecture ckt of OPR_OR is

begin

    S <= A or B;

end ckt;