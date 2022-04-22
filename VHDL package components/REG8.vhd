 LIBRARY ieee;
use ieee.std_logic_1164.all;
--This file is for a 8 bit register
Entity REG8 IS
	PORT (D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			EN:IN STD_LOGIC ;
			CLR: IN STD_LOGIC;
			CLK: IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END REG8;

ARCHITECTURE Behavior of REG8 IS
	BEGIN 
		PROCESS(CLK,CLR)
			BEGIN 
			IF CLR='1' THEN 
					Q <= x"00";
			ELSIF rising_edge(CLK) THEN 
				IF EN= '1' THEN 
					Q <= D;
				END IF;
			END IF;
		END PROCESS;	
END Behavior;
					