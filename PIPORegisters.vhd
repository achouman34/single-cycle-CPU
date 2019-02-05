library ieee;
use ieee.std_logic_1164.all;

entity pipo is
	port(
		CLK : in std_logic;
		enable0Low : in std_logic;
		enable1Low : in std_logic;
		enable2Low : in std_logic;
		enable3Low : in std_logic;
		D: in std_logic_vector(15 downto 0);
		Q1: out std_logic_vector(31 downto 0);
		Q2: out std_logic_vector(31 downto 0)
	);
end pipo;

architecture behavioural of pipo is

begin

process (CLK)
begin
	if (CLK'event and CLK='1' and enable0Low='0') then
		Q1(31 downto 16) <= D;
	elsif (CLK'event and CLK='1' and enable1Low='0') then
		Q1(15 downto 0) <= D;
	elsif (CLK'event and CLK='1' and enable2Low='0') then
		Q2(31 downto 16) <= D;
	elsif (CLK'event and CLK='1' and enable3Low='0') then
		Q2(15 downto 0) <= D;
	end if;
end process;

end behavioural;