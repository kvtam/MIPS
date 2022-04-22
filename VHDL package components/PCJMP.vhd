LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;

--combines 3 MSBs of PC with 12 bits of jump and shl 2
Entity PCJMP IS
	PORT (PC: 	IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			ADDR: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
			DOUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END PCJMP;

ARCHITECTURE Behavior of PCJMP IS
	
	BEGIN 
		DOUT<= PC(15 DOWNTO 13) & ADDR & '0';
	
		
END Behavior;
				