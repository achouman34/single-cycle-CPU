library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity LogicUnit is
	port ( 
		inputX   : in std_logic_vector(31 downto 0);
		inputY   : in std_logic_vector(31 downto 0);
		S        : in std_logic_vector(1 downto 0);
		LogicOut : out std_logic_vector(31 downto 0)
	);
end LogicUnit;

architecture Behavioural of LogicUnit is
begin
	process(inputX, inputY, S)
	begin
		case S is
			when "00" => 
				LogicOut <= inputX and inputY; -- AND logic
			when "01" => 
				LogicOut <= inputX or inputY; -- OR logic
			when "10" => 
				LogicOut <= inputX xor inputY ; -- XOR logic
			when "11" => 
				LogicOut <= inputX nor inputY; --NOR logic 
			when others =>
				NULL;
		end case; 
	end process; 
end Behavioural;