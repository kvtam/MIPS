LIBRARY ieee;
use ieee.std_logic_1164.all;
--4bit bitwise OR
Entity BWOR4 IS
	PORT (A,B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END BWOR4;

ARCHITECTURE Behavior of BWOR4 IS

	BEGIN 
	gen_bits:
		for I in 0 to 3 generate
			Q(i)<=A(i) OR B(i);
		end generate gen_bits;
		

END Behavior;