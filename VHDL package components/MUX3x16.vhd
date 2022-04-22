LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;

--3 to1 16 bit mux
Entity MUX3x16 IS
	PORT (A,B,C: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			S: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END MUX3x16;

ARCHITECTURE Behavior of MUX3x16 IS
	SIGNAL INPUT: STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN 
		MUX1: MUX2x16 PORT MAP (A,B,S(1),INPUT);
		MUX2: MUX2x16 PORT MAP (INPUT,C,S(0),Q);
	
		
END Behavior;
				