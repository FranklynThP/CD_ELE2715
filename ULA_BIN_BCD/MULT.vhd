--==============================================================================================
--				                    MULTIPLICADOR
--==============================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity MULT is
    port(A, B : in std_logic_vector(7 downto 0);
            Co : out std_logic;
            S : out std_logic_vector(7 downto 0));
end MULT;

architecture ckt of MULT is

    component AND_MULT is
        port (A : in std_logic_vector(7 downto 0);
                B : in std_logic;
                S : out std_logic_vector(7 downto 0));
    end component;

    component ADD8 is
        port (A, B : in std_logic_vector(7 downto 0);
			    Ci : in std_logic;
			    Co : out std_logic;
			    S : out std_logic_vector(7 downto 0));
    end component;

    component BARREL_R is
        port (S : in std_logic_vector(2 downto 0);
			    I : in std_logic_vector(7 downto 0);
			    Y : out std_logic_vector(7 downto 0));
    end component;

    signal cout : std_logic_vector(6 downto 0); --mudei de 7 para 6, porque nao estao usando o bit 7

    signal aux_1 : std_logic_vector(7 downto 0);
    signal aux_2 : std_logic_vector(7 downto 0);
    signal aux_3 : std_logic_vector(7 downto 0);
    signal aux_4 : std_logic_vector(7 downto 0);
    signal aux_5 : std_logic_vector(7 downto 0);
    signal aux_6 : std_logic_vector(7 downto 0);
    signal aux_7 : std_logic_vector(7 downto 0);
    signal aux_8 : std_logic_vector(7 downto 0);

    signal desc_1 : std_logic_vector(7 downto 0);
    signal desc_2 : std_logic_vector(7 downto 0);
    signal desc_3 : std_logic_vector(7 downto 0);
    signal desc_4 : std_logic_vector(7 downto 0);
    signal desc_5 : std_logic_vector(7 downto 0);
    signal desc_6 : std_logic_vector(7 downto 0);
    signal desc_7 : std_logic_vector(7 downto 0);

    signal sum_1 : std_logic_vector(7 downto 0);
    signal sum_2 : std_logic_vector(7 downto 0);
    signal sum_3 : std_logic_vector(7 downto 0);
    signal sum_4 : std_logic_vector(7 downto 0);
    signal sum_5 : std_logic_vector(7 downto 0);
    signal sum_6 : std_logic_vector(7 downto 0);
    signal sum_7 : std_logic_vector(7 downto 0);

    begin 
    
        OPR1 : AND_MULT port map (A, B(0), aux_1);
	DESC1 : BARREL_R port map ("001", aux_1, desc_1);
        OPR2 : AND_MULT port map (A, B(1), aux_2);
        

        OPR3 : AND_MULT port map (A, B(2), aux_3);

        OPR4 : AND_MULT port map (A, B(3), aux_4);

        OPR5 : AND_MULT port map (A, B(4), aux_5);

        OPR6 : AND_MULT port map (A, B(5), aux_6);

        OPR7 : AND_MULT port map (A, B(6), aux_7);

        OPR8 : AND_MULT port map (A, B(7), aux_8);


        SUM1 : ADD8 port map (aux_2, desc_1, '0', cout(0), sum_1);
	desc_2 <= cout(0)&sum_1(7 downto 1);
        SUM2 : ADD8 port map (aux_3, desc_2, '0', cout(1), sum_2);
	desc_3 <= cout(1)&sum_2(7 downto 1);
        SUM3 : ADD8 port map (aux_4, desc_3, '0', cout(2), sum_3);
	desc_4 <= cout(2)&sum_3(7 downto 1);
        SUM4 : ADD8 port map (aux_5, desc_4, '0', cout(3), sum_4);
	desc_5 <= cout(3)&sum_4(7 downto 1);
        SUM5 : ADD8 port map (aux_6, desc_5, '0', cout(4), sum_5);
	desc_6 <= cout(4)&sum_5(7 downto 1);
        SUM6 : ADD8 port map (aux_7, desc_6, '0', cout(5), sum_6);
	desc_7 <= cout(5)&sum_6(7 downto 1);
        SUM7 : ADD8 port map (aux_8, desc_7, '0', cout(6), sum_7);
	
	S <= sum_7(0) & sum_6(0) & sum_5(0) & sum_4(0) & sum_3(0) & sum_2(0) & sum_1(0) & aux_1(0); --juntando os primeiros 8 bits menos significativos da operacao
        
	Co <= sum_7(7) or sum_7(6) or sum_7(5) or sum_7(4) or sum_7(3) or sum_7(2) or sum_7(1); --Os bits mais significativos restantes serao 

end ckt;