--==============================================================================================
--				LOGICA DO SOMADOR COMPLETO
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity SCOMP is
	port( A, B, Ci : in std_logic;
			S, Co : out std_logic);
end SCOMP;

architecture ckt of SCOMP is

	begin
		S <= A xor B xor Ci;
		Co <= (A and B) or (A and Ci) or (B and Ci);
		
end ckt;