library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Lab1ALU is
	Port ( 
		inputA : in std_logic_vector(31 downto 0);
		inputB : in std_logic_vector(31 downto 0);
		sel    : in std_logic_vector (2 downto 0);
		ALUOut : out std_logic_vector(31 downto 0);
		OFlow  : out std_logic
	);
end Lab1ALU;

architecture Behavioural of Lab1ALU is
	signal a: std_logic_vector(32 downto 0);
begin
	process(inputA, inputB, sel)
	begin
		case sel is
			when "000" =>  -- Load upper immediate (B)
				OFlow <= '0';
				ALUOut <= inputB(31 downto 16) & "0000000000000000";
			when "001" =>  -- Set less than (A < B)
				OFlow <= '0';
				if (inputA < inputB) then  
					ALUOut <= "00000000000000000000000000000001";
				else 
					ALUOut <= "00000000000000000000000000000000";
				end if;
			when "010" =>  -- Arithmetic addition (account for overflow)
				a <= ('0' & inputA) + ('0' & inputB); 
				ALUOut <= a(31 downto 0);
				OFlow <= a(32);
			when "011" => 
				OFlow <= '0';
				ALUOut<= inputA - inputB; -- Arithmetic subtraction 
			when "100" => 
				OFlow <= '0';
				ALUOut<= inputA and inputB; -- AND logic
			when "101" => 
				OFlow <= '0';
				ALUOut<= inputA or inputB; -- OR logic
			when "110" => 
				OFlow <= '0';
				ALUOut<= inputA xor inputB ; -- XOR logic
			when "111" => 
				OFlow <= '0';
				ALUOut<= inputA nor inputB; --NOR logic 
			when others =>
				NULL;
		end case; 
	end process; 
end Behavioural;