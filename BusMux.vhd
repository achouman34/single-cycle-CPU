library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_32to1 is
    Port ( SEL : in  STD_LOGIC_VECTOR(1 downto 0);
           A   : in  STD_LOGIC_VECTOR (31 downto 0);
           B   : in  STD_LOGIC_VECTOR (31 downto 0);
			  C   : in  STD_LOGIC_VECTOR (31 downto 0);
           X   : out STD_LOGIC_VECTOR (31 downto 0));
end mux_32to1;

architecture Behavioural of mux_32to1 is
begin
process(SEL)
begin
case SEL is
	when "00" =>
		X <= A;
	when "01" =>
		X <= B;
	when "10" =>
		X <= C;
	when others =>
		NULL;
end case;
end process;
end Behavioural;