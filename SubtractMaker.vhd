library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SubtractMaker is
	port (
		B    : in std_logic_vector(31 downto 0);  
		Sub  : in std_logic;
	   F    : out std_logic_vector(31 downto 0)
	 );
end SubtractMaker;

architecture Behavioural of SubtractMaker is
begin
	process (B, Sub) is
	begin
	  if Sub = '1' then
			F <= B XOR "11111111111111111111111111111111";
	  else
			F <= B;
	  end if;
	end process;
end Behavioural;