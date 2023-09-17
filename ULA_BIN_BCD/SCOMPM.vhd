--==============================================================================================
--				LOGICA DO SOMADOR COMPLETO COM MEIO SOMADOR
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity SCOMPM is
	port( A, B, Ci : in std_logic;
			S, Co : out std_logic);
end SCOMPM;

architecture ckt of SCOMPM is
	component MEIO_S is
		port( A,B: in std_logic;
		  S, Co: out std_logic);
	end component;

	signal MSA1,MSA2,MSB1: std_logic;

begin
  
	MS_A: MEIO_S port map(A,B,MSA1,MSA2);

	MS_B: MEIO_S port map(Ci,MSA1,S,MSB1);
	
	Co <= MSB1 or MSA2;
	
end ckt;
