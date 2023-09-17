--==============================================================================================
--				SUBTRATOR DE 8 BITS COMPLETO
--==============================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity SUB8 is
    port (A, B : in std_logic_vector(7 downto 0);
            Ti : in std_logic;
            Tout : out std_logic;
            S : out std_logic_vector(7 downto 0));
end SUB8;

architecture ckt of SUB8 is

    component SUBCOMP is
        port ( a, b : in std_logic;
                Ti : in std_logic;
                Tout : out std_logic;
                S : out std_logic);
    end component;

    signal borrow : std_logic_vector(7 downto 0);

begin

    Q1 : SUBCOMP port map (A(0), B(0), Ti, borrow(0), S(0));
    Q2 : SUBCOMP port map (A(1), B(1), borrow(0), borrow(1), S(1));
    Q3 : SUBCOMP port map (A(2), B(2), borrow(1), borrow(2), S(2));
    Q4 : SUBCOMP port map (A(3), B(3), borrow(2), borrow(3), S(3));
    Q5 : SUBCOMP port map (A(4), B(4), borrow(3), borrow(4), S(4));
    Q6 : SUBCOMP port map (A(5), B(5), borrow(4), borrow(5), S(5));
    Q7 : SUBCOMP port map (A(6), B(6), borrow(5), borrow(6), S(6));
    Q8 : SUBCOMP port map (A(7), B(7), borrow(6), Tout, S(7));

end ckt;