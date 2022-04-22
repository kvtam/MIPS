LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;



--16bit increment by two
Entity INCTWO IS
	PORT(A :IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		COUT:OUT STD_LOGIC;
         S:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END INCTWO;

ARCHITECTURE Behavior of INCTWO IS
	
BEGIN 
	ADD2: ADD16 PORT MAP(A,"0000000000000010",'0',S,COUT);
END Behavior;