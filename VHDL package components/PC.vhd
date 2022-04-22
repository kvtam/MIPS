LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;

--Program counter
Entity PC IS
	PORT (CLK, EN, RST: IN STD_LOGIC ;
			PCIN: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			PCOUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END PC;

ARCHITECTURE Behavior of PC IS
	
	BEGIN 
		PROCESS(CLK,EN,RST)
		BEGIN
			IF (EN = '1' AND rising_edge(CLK)) THEN
				IF RST = '1' THEN
					PCOUT<= x"0000";
				ELSE
					PCOUT<=PCIN;
				END IF;
			END IF;
		END PROCESS;
	
		
END Behavior;
				