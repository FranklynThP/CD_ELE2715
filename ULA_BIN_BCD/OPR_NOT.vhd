--==============================================================================================
--				                    OPERACAO NOT
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity OPR_NOT is
    port (A : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0);
            Z : out std_logic);
end OPR_NOT;

architecture ckt of OPR_NOT is

begin

    S <= not A;

end ckt;