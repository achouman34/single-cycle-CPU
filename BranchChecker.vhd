library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity BranchChecker is
	port (
		Imm    : in std_logic_vector(15 downto 0);
		BrTrue : in std_logic;
		F      : out std_logic_vector(29 downto 0)
	);
end BranchChecker;

architecture Behavioural of BranchChecker is
begin
	process (Imm, BrTrue) is
	begin
	  if BrTrue = '1' then
			F <= "00000000000000" & Imm;
	  else
			F <= "000000000000000000000000000000";
	  end if;
	end process;
end Behavioural;