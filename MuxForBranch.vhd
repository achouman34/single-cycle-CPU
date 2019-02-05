library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MuxForBranch is
	port (
		A,C,D		: in std_logic_vector(29 downto 0);
		B     	: in std_logic_vector(25 downto 0); 
		IncrIn	: in std_logic_vector(3 downto 0);
		S     	: in std_logic_vector(1 downto 0);
	   Z     	: out std_logic_vector(29 downto 0)
	 );
end MuxForBranch;

architecture Behavioural of MuxForBranch is
begin
	process (A, B, C, D, IncrIn, S) is
	begin
	  if S = "00" then
			Z <= A;
	  elsif S = "01" then
			Z <= IncrIn & B;
	  elsif S = "10" then
			Z <= C;
	  else
			Z <= D;
	  end if;
	end process;
end Behavioural;