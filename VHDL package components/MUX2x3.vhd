LIBRARY ieee;
use ieee.std_logic_1164.all;
--3bit 2 to 1 mux
Entity MUX2x3 IS
	PORT (D0,D1: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			s:	IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END MUX2x3;

ARCHITECTURE Behavior of MUX2x3 IS 
	BEGIN 
			WITH s SELECT
			Q<= D0 WHEN '0',
			D1 WHEN '1';
END Behavior;
				