library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Lab02InstructionCache is
  port(
    Instruction : out std_logic_vector(31 downto 0);
    ADDR        : in  std_logic_vector(6 downto 0)
    );
end Lab02InstructionCache;


architecture Behavioural of Lab02InstructionCache is
	type instructionCache is array(0 to 127) of std_logic_vector(7 downto 0);
	signal instChe : instructionCache;
begin
	-- Instructions loaded beforehand 
	-- syscall (op 0 fn 12)
	--instChe(0) <= "00000000";
	--instChe(1) <= "00000000";
	--instChe(2) <= "00000000";
	--instChe(3) <= "00001100";
	
	-- addi $t1, $s0, 0x0FFF(op 8) 
	instChe(0) <= "00100010";
	instChe(1) <= "00001001";
	instChe(2) <= "00001111";
	instChe(3) <= "11111111";
	
	-- sw $t1, 0($s0)  (op 43)
	instChe(4) <= "10101110";
	instChe(5) <= "00001001";
	instChe(6) <= "00000000";
	instChe(7) <= "00000000";
	
	-- xor $t0, $t1, $s1 (op 0 fn 38)
	instChe(8) <= "00000001";
	instChe(9) <= "00110001";
	instChe(10) <= "01000000";
	instChe(11) <= "00100110";
	
	-- lw $t2, 0($s0)  (op 35)
	instChe(12) <= "10001110";
	instChe(13) <= "00001010";
	instChe(14) <= "00000000";
	instChe(15) <= "00000000";
	
	-- lui $t2, 0xBCBC  (op 15)
	instChe(16) <= "00111100";
	instChe(17) <= "00001010";
	instChe(18) <= "10111100";
	instChe(19) <= "10111100";
	
	-- andi $t2, $t2, 0x0FF0  (op 12)
	--instChe(16) <= "00110001";
	--instChe(17) <= "01001010";
	--instChe(18) <= "00001111";
	--instChe(19) <= "11110000";
	

	Instruction <= instChe(to_integer(unsigned(ADDR))) & instChe(to_integer(unsigned(ADDR)) + 1) & instChe(to_integer(unsigned(ADDR)) + 2)
		& instChe(to_integer(unsigned(ADDR)) + 3);
end Behavioural;