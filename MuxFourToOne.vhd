library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MuxFourToOne is
	port (
		A     : in std_logic_vector(15 downto 0);
		B     : in std_logic;
		C,D   : in std_logic_vector(31 downto 0);  
		S     : in std_logic_vector(1 downto 0);
	   Z     : out std_logic_vector(31 downto 0)
	 );
end MuxFourToOne;

architecture Behavioural of MuxFourToOne is
begin
	process (A, B, C, D, S) is
	begin
	  if S = "00" then
			Z <= A & "0000000000000000";
	  elsif S = "01" then
			Z <= "0000000000000000000000000000000" & B;
	  elsif S = "10" then
			Z <= C;
	  else
			Z <= D;
	  end if;
	end process;
end Behavioural;