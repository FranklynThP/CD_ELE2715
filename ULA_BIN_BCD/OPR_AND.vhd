--==============================================================================================
--				            OPERACAO AND
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity OPR_AND is
    port (A, B : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0);
            Z : out std_logic);
end OPR_AND;

architecture ckt of OPR_AND is

begin

    S <= A and B;

end ckt;