LIBRARY ieee;
use ieee.std_logic_1164.all;
--3to8 dec
Entity DCD3x8 IS
	PORT (D: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			EN: IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END DCD3x8;

ARCHITECTURE Behavior of DCD3x8 IS
	SIGNAL RES : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN 
			WITH D SELECT
			RES<=x"01" WHEN "000",
			x"02" WHEN "001",
			x"04" WHEN "010",
			x"08" WHEN "011",
			x"10" WHEN "100",
			x"20" WHEN "101",
			x"40" WHEN "110",
			x"80" WHEN "111";
	PROCESS( EN)
	BEGIN
		IF EN ='1' THEN
			Q<=RES;
		ELSE
			Q<=x"00";
		END IF;
	END PROCESS;
	

END Behavior;
				