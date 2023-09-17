--==============================================================================================
--				                    OPERACAO XOR
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity OPR_XOR is
    port (A, B : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0);
            Z : out std_logic);
end OPR_XOR;

architecture ckt of OPR_XOR is

begin

    S <= A xor B;

end ckt;