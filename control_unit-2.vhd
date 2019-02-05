library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC is
	port (
		CLK: in std_logic;    
      PC_In: in unsigned(29 downto 0);
      PC_out: out unsigned(31 downto 0)
	);
end PC;

architecture Behavioral of PC is
begin
  process(clk)
  begin
    if CLK = '1' and CLK'event then
			PC_out <= PC_In & "00";
    end if;
  end process;
end Behavioral;