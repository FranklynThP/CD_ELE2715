--========================================================================
-- 	                MUX DE 16 BITS
--========================================================================
library ieee;
use ieee.std_logic_1164.all;

entity MUX16B is
    port(i : in std_logic_vector(15 downto 0);
         s : in std_logic_vector(3 downto 0);
         q : out std_logic);
end MUX16B;

architecture ckt of MUX16B is

begin

    q <= (i(0) and not s(3) and not s(2) and not s(1) and not s(0))
         or 
         (i(1) and not s(3) and not s(2) and not s(1) and s(0))
         or 
         (i(2) and not s(3) and not s(2) and s(1) and not s(0))
         or 
         (i(3) and not s(3) and not s(2) and s(1) and s(0))
         or 
         (i(4) and not s(3) and s(2) and not s(1) and not s(0))
         or 
         (i(5) and not s(3) and s(2) and not s(1) and s(0))
         or 
         (i(6) and not s(3) and s(2) and s(1) and not s(0))
         or 
         (i(7) and not s(3) and s(2) and s(1) and s(0)) 
         or --- s3 barrados---
         (i(8) and s(3) and not s(2) and not s(1) and not s(0))
         or 
         (i(9) and s(3) and not s(2) and not s(1) and s(0))
         or 
         (i(10) and s(3) and not s(2) and s(1) and not s(0))
         or 
         (i(11) and s(3) and not s(2) and s(1) and s(0))
         or 
         (i(12) and s(3) and s(2) and not s(1) and not s(0))
         or 
         (i(13) and s(3) and s(2) and not s(1) and s(0))
         or 
         (i(14) and s(3) and s(2) and s(1) and not s(0))
         or 
         (i(15) and s(3) and s(2) and s(1) and s(0));

end ckt;