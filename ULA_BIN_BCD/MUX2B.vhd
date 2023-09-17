--========================================================================
-- 	                        MUX DE 2 BITS
--========================================================================

library ieee;
use ieee.std_logic_1164.all;

entity MUX2B is
	port(s, i0, i1 : in std_logic;
			y : out std_logic);
end MUX2B;

architecture ckt of MUX2B is

	begin

		y <= (i0 and not s) or (i1 and s);

end ckt;