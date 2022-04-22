LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;

--5x32 dec
Entity DCD5x32 IS
	PORT (D: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			EN:IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END DCD5x32;

ARCHITECTURE Behavior of DCD5x32 IS
		Signal RES: STD_LOGIC_VECTOR(31 DOWNTO 0);
	BEGIN 
		LOWBITS: DCD4x16 PORT MAP(D(3 DOWNTO 0),(NOT D(4)),RES(15 DOWNTO 0));
		HIGHBITS: DCD4x16 PORT MAP(D(3 DOWNTO 0),D(4),RES(31 DOWNTO 16));
		WITH EN SELECT
			Q<="00000000000000000000000000000000" WHEN '0',
			RES WHEN '1';
	
		
END Behavior;