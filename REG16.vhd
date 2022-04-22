LIBRARY ieee;
use ieee.std_logic_1164.all;
--16 bit reg
Entity REG16 IS
	PORT (D: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			EN:  IN STD_LOGIC ;
			CLR: IN STD_LOGIC;
			CLK: IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END REG16;

ARCHITECTURE Behavior of REG16 IS
	COMPONENT Processor
		PORT (D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			EN:IN STD_LOGIC ;
			CLR: IN STD_LOGIC;
			CLK: IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
	END COMPONENT;
	BEGIN 
		lowend: Processor PORT MAP (D(7 DOWNTO 0),EN,CLR,CLK,Q(7 DOWNTO 0));
		highend: Processor PORT MAP(D(15 DOWNTO 8),EN,CLR,CLK,Q(15 DOWNTO 8));
			
END Behavior;
					