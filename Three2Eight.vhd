LIBRARY ieee;
use ieee.std_logic_1164.all;
--3to8 dec
Entity THREE2EIGHT IS
	PORT (D: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END THREE2EIGHT;

ARCHITECTURE Behavior of THREE2EIGHT IS

	BEGIN 
			WITH D SELECT
			Q<=x"01" WHEN "000",
			x"02" WHEN "001",
			x"04" WHEN "010",
			x"08" WHEN "011",
			x"10" WHEN "100",
			x"20" WHEN "101",
			x"40" WHEN "110",
			x"80" WHEN "111";
END Behavior;
				