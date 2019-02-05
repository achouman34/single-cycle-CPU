library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity AdderForNextInstr is
	Port ( 
		X      : in std_logic_vector(29 downto 0);
		Y      : in std_logic_vector(29 downto 0);
		AddOut : out std_logic_vector(29 downto 0)
	);
end AdderForNextInstr;

architecture Behavioural of AdderForNextInstr is
	signal a: std_logic_vector(29 downto 0);
begin
	process (X, Y)
	begin
		a <= X + Y + "000000000000000000000000000001";
		AddOut <= a;
	end process;
end Behavioural;