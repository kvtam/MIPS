LIBRARY ieee;
use ieee.std_logic_1164.all;
--6to16 
Entity SGNEXT6x16 IS
	PORT (D: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END SGNEXT6x16;

ARCHITECTURE Behavior of SGNEXT6x16 IS
	BEGIN
	
	PROCESS(D)
		BEGIN 
		IF D(5)='0' THEN
			Q<= (x"0000" OR D);
		ELSE
			Q<= ("1111111111000000" OR D);
		END IF;
	
	END PROCESS;
	

END Behavior;