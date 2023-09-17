--==============================================================================================
--				            OPERACAO AND PARA MULTIPLICACAO
--==============================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity AND_MULT is
    port (A : in std_logic_vector(7 downto 0);
            B : in std_logic;
            S : out std_logic_vector(7 downto 0));
end AND_MULT;

architecture ckt of AND_MULT is

    begin
        S(0) <= A(0) and B;
        S(1) <= A(1) and B;
        S(2) <= A(2) and B;
        S(3) <= A(3) and B;
        S(4) <= A(4) and B;
        S(5) <= A(5) and B;
        S(6) <= A(6) and B;
        S(7) <= A(7) and B;

end ckt;
