library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hex_seg_driver is
	port
	(
		-- Input ports
		innerHex : in std_logic_vector(3 downto 0); --ABCD, where A is MSB

		-- Output ports
		HexOut : out std_logic_vector(6 downto 0)
	);
end entity hex_seg_driver;


architecture arch of hex_seg_driver is

	signal catHex : std_logic_vector(6 downto 0); 
	signal sel : std_logic_vector(3 downto 0); 
begin
	sel <= innerHex;
	HexOut <= catHex(6 downto 0);
	with sel select
	catHex		 <=	"0000001" when x"0",
							"1001111" when x"1",
							"0010010" when x"2",
							"0000110" when x"3",
							"1001100" when x"4",
							"0100100" when x"5",
							"0100000" when x"6",
							"0001111" when x"7",
							"0000000" when x"8",
							"0000100" when x"9",
							"0001000" when x"A",
							"1100000" when x"B",
							"0110001" when x"C",
							"1000010" when x"D",
							"0110000" when x"E",
							"0111000" when x"F";
end arch;
