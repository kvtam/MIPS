LIBRARY ieee;
use ieee.std_logic_1164.all;
--4bit 4 to 1 mux
Entity MUX4x4 IS
	PORT (D0,D1,D2,D3: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			s:	IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			Q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END MUX4x4;

ARCHITECTURE Behavior of MUX4x4 IS 
	BEGIN 
			WITH s SELECT
			Q<= D0 WHEN "00",
			D1 WHEN "01",
			D2 WHEN "10",
			D3 WHEN "11";
END Behavior;
				