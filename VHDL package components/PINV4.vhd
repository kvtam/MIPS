LIBRARY ieee;
use ieee.std_logic_1164.all;
--4bit bitwise inverter
Entity PINV4 IS
	PORT (A: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			EN: IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END PINV4;

ARCHITECTURE Behavior of PINV4 IS
	
	BEGIN 
		with EN select
		Q<= NOT A when '1',
		A when others;
			
	
		

END Behavior;