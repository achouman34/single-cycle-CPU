library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NormalMux is
	port (
		A,B,C,D		: in std_logic_vector(4 downto 0);
		S     	: in std_logic_vector(1 downto 0);
	   Z     	: out std_logic_vector(4 downto 0)
	 );
end NormalMux;

architecture Behavioural of NormalMux is
begin
	process (A, B, C, D, S) is
	begin
	  if S = "00" then
			Z <= A;
	  elsif S = "01" then
			Z <= B;
	  elsif S = "10" then
			Z <= C;
	  else
			Z <= D;
	  end if;
	end process;
end Behavioural;