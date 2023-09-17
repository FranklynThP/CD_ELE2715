library ieee;
use ieee.std_logic_1164.all;

entity ULA_BINBCD is
	port(A,B : in std_logic_vector(7 downto 0);
        K : in std_logic_vector(3 downto 0);
        Co: out std_logic;
        Z: out std_logic;
		HEX0,HEX1,HEX2: out std_logic_vector (6 downto 0));
end ULA_BINBCD;

architecture ckt of ULA_BINBCD is
    component ULA8 is
        port (  A,B : in std_logic_vector(7 downto 0);
                K : in std_logic_vector(3 downto 0);
                Co: out std_logic;
                Z: out std_logic;
                O: out std_logic_vector(7 downto 0));
    end component;

    component BINBCD is
        port( SW: in std_logic_vector(7 downto 0);
        HEX0,HEX1,HEX2: out std_logic_vector(6 downto 0));
    end component;

    signal O: std_logic_vector(7 downto 0);

begin

    ULALA: ULA8 port map(A,B,K,Co,Z,O);
    BIN_BCD: BINBCD port map(O,HEX0,HEX1,HEX2);

end ckt;
