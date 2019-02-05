library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SubNormalMux is
	port (
		A			: in std_logic_vector(31 downto 0);
		B 			: in std_logic_vector(15 downto 0);
		S     	: in std_logic;
	   Z     	: out std_logic_vector(31 downto 0)
	 );
end SubNormalMux;

architecture Behavioural of SubNormalMux is
begin
	process (A, B, S) is
	begin
	  if S = '0' then
			Z <= A;
	  else
			Z <= "0000000000000000" & B;
	  end if;
	end process;
end Behavioural;