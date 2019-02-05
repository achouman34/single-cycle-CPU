library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Lab02DataCache is
  port(
    DATA_IN     : in  std_logic_vector(31 downto 0);
    DATA_OUT    : out std_logic_vector(31 downto 0);
    ADDR        : in  std_logic_vector(6 downto 0);
	 CS          : in  std_logic;
	 WE          : in  std_logic;
	 OE          : in  std_logic
    );
end Lab02DataCache;


architecture Behavioural of Lab02DataCache is
  type RAM is array(0 to 127) of std_logic_vector(31 downto 0);
  signal datChe: RAM;
begin
  theCache : process (DATA_IN, CS, WE, OE) is
  begin
    if CS = '1' then
		if WE = '1' then
			datChe(to_integer(unsigned(ADDR))) <= DATA_IN;
		elsif OE = '1' then
			DATA_OUT <= datChe(to_integer(unsigned(ADDR)));
		else
			DATA_OUT <= "00000000000000000000000000000000";
		end if;
	 else
		DATA_OUT <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    end if;
  end process;
end Behavioural;