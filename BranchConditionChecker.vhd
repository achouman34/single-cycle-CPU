library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BranchConditionChecker is
	port (
		RT 		: in std_logic_vector(31 downto 0);
		RS 		: in std_logic_vector(31 downto 0);
		BrType 	: in std_logic_vector(1 downto 0);
		BrTrue   : out std_logic
	);
end BranchConditionChecker;

architecture Behavioural of BranchConditionChecker is
begin
	process (RT, RS, BrType) is
	begin
		case BrType is
			when "01" => 
				if RT = RS then
					BrTrue <= '1';
				else
					BrTrue <= '0';
				end if;
			when "10" => 
				if RT = RS then
					BrTrue <= '0';
				else
					BrTrue <= '1';
				end if;
			when "11" => 
				if RS < 0 then
					BrTrue <= '1';
				else
					BrTrue <= '0';
				end if;
			when others =>
				BrTrue <= '0';
		end case;
	end process;
end Behavioural;