library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SubSubNormalMux is
	port (
		A,B 	: in std_logic_vector(31 downto 0);
		C		: in std_logic_vector(29 downto 0);
		S     : in std_logic_vector(1 downto 0);
	   Z     : out std_logic_vector(31 downto 0)
	 );
end SubSubNormalMux;

architecture Behavioural of SubSubNormalMux is
begin
	process (A, B, C, S) is
	begin
		case S is
			when "00" => 
				Z <= A;
			when "01" => 
				Z <= B;
			when "10" => 
				Z <= C & "00";
			when others =>
				NULL;
		end case; 
	end process;
end Behavioural;