library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity AdderForALU is
	Port ( 
		X      : in std_logic_vector(31 downto 0);
		Y      : in std_logic_vector(31 downto 0);
		Cin    : in std_logic;
		AddOut : out std_logic_vector(31 downto 0);
		Ovfl   : out std_logic
	);
end AdderForALU;

architecture Behavioural of AdderForALU is
	signal a: std_logic_vector(32 downto 0);
begin
	process(X, Y, Cin)
	begin
		a <= ('0' & X) + ('0' & Y);
		AddOut <= a(31 downto 0);
		Ovfl <= a(32);
	end process;
end Behavioural;