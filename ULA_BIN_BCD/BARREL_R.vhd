library ieee;
use ieee.std_logic_1164.all;

entity BARREL_R is
	port (S : in std_logic_vector(2 downto 0);
			I : in std_logic_vector(7 downto 0);
			Y : out std_logic_vector(7 downto 0));
end BARREL_R;

architecture ckt of BARREL_R is

	component SHR_1 is
		port(	s : in std_logic;
				i : in std_logic_vector(7 downto 0);
				y : out std_logic_vector(7 downto 0));
	end component;

	component SHR_2 is
		port(	s : in std_logic;
				i : in std_logic_vector(7 downto 0);
				y : out std_logic_vector(7 downto 0));
	end component;

	component SHR_4 is
		port(	s : in std_logic;
				i : in std_logic_vector(7 downto 0);
				y : out std_logic_vector(7 downto 0));
	end component;
	
	signal var_1 : std_logic_vector(7 downto 0);
	signal var_2 : std_logic_vector(7 downto 0);
	signal var_4 : std_logic_vector(7 downto 0);

	begin
		B1 : SHR_1 port map (S(0), I, var_1);
		B2 : SHR_2 port map (S(1), var_1, var_2);
		B4 : SHR_4 port map (S(2), var_2, var_4);

	Y <= var_4;
		
		
end ckt;