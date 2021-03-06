LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;
--DATA MEM
Entity DATAMEM IS
	PORT ( WE, RE, CLK: IN STD_LOGIC;
			 ADDR, DIN:   IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			 DOUT:        OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END DATAMEM;

ARCHITECTURE Behavior of DATAMEM IS
	SIGNAL DCDOUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL DCDEN: STD_LOGIC;
	TYPE TWODARR IS ARRAY(INTEGER RANGE<>) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL DMEM: TWODARR(15 DOWNTO 0);
	SIGNAL ZEROES: STD_LOGIC_VECTOR(9 DOWNTO 0);
	
	
	BEGIN	
	DEC: DCD4X16 PORT MAP (ADDR(4 DOWNTO 1),DCDEN,DCDOUT);--MAP the ADDR DEC
	LOOPLABEL: 
	FOR i in 2 to 15 GENERATE
		B0: REG8 PORT MAP (DIN(7 DOWNTO 0),DCDOUT(i) AND WE,'0',CLK,DMEM(i)(7 DOWNTO 0));--LSB
		B1: REG8 PORT MAP (DIN(15 DOWNTO 8),DCDOUT(i) AND WE,'0',CLK,DMEM(i)(15 DOWNTO 8)); --MSB
	END GENERATE LOOPLABEL;
		B2: REG8 PORT MAP (x"A5",DCDOUT(0)AND WE, '0',CLK,DMEM(0)(7 DOWNTO 0));--Hard coding the values for addr 0x100 and 0x102
		B3: REG8 PORT MAP (x"03",DCDOUT(0)AND WE, '0',CLK,DMEM(0)(15 DOWNTO 8));
		B4: REG8 PORT MAP (x"55",DCDOUT(1)AND WE, '0',CLK,DMEM(1)(7 DOWNTO 0));
		B5: REG8 PORT MAP (x"06",DCDOUT(1)AND WE, '0',CLK,DMEM(1)(15 DOWNTO 8));
	
		--CHECKING  for all zeroeS
		ZEROES <=ADDR(15 DOWNTO 9) & ADDR(7 DOWNTO 5);
		WITH ZEROES SELECT 
		DCDEN<= ADDR(8) WHEN "0000000000",
		'0' WHEN OTHERS;
		
		PROCESS(RE,CLK)
		BEGIN
			IF(falling_edge(CLK)) THEN
			DOUT<= "ZZZZZZZZZZZZZZZZ";
				FORLOOP:
				FOR j in 0 to 15 LOOP
					IF (DCDOUT(j)='1' AND RE = '1') THEN
						DOUT(15 DOWNTO 0) <= DMEM(j)(15 DOWNTO 0);
					END IF;
				END LOOP FORLOOP;
			END IF;
		END PROCESS;
		
		
	

END Behavior;