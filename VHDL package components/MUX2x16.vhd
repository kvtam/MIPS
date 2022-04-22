LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;

--2 to 1 16 bit mux
Entity MUX2x16 IS
	PORT (A,B: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			S: IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END MUX2x16;

ARCHITECTURE Behavior of MUX2x16 IS

	BEGIN 
		WITH S SELECT
		Q<=A WHEN '0',
		B WHEN '1';		
	
		
END Behavior;