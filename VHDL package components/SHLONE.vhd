LIBRARY ieee;
use ieee.std_logic_1164.all;



--16bit SHL
Entity SHLONE IS
	PORT (A: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			F: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END SHLONE;

ARCHITECTURE Behavior of SHLONE IS
	
	
BEGIN 
 
	SHIFT:
	for I in 15 downto 1 generate
		F(I)<= A(I-1);
	end generate SHIFT;
		
	F(0)<='0';
	
END Behavior;