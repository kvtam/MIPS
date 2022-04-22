LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;
--Instruction memory
Entity INSMEM IS
	PORT (ADDR: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			DOUT: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END INSMEM;

ARCHITECTURE Behavior of INSMEM IS
		TYPE TWODARR is ARRAY(INTEGER RANGE <>)of STD_LOGIC_VECTOR(15 DOWNTO 0);
		SIGNAL MEM: TWODARR(0 TO 31);
		SIGNAL DCDOUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL EN: STD_LOGIC;
	BEGIN	
	
		DCD_comp: DCD5x32 PORT MAP (ADDR(5 DOWNTO 1),EN,DCDOUT);
		
		MEM(0)<="1011" & "111" & "001" & "000000"; --lw R1 0(0)
		MEM(1)<="1011" & "111" & "010" & "000010"; --lw R2 2(0)
 		MEM(2)<="0000" & "001" & "010" & "011" & "010"; -- add R3, R1, R2
		MEM(3)<="1111" & "000" & "011" & "000100"; -- sw R3 4(0)
		MEM(4)<="0010" & "000000000000";	--loop this instruction
		
		GEN: FOR i in 5 to 31 GENERATE --make a loop for the other instructions
			MEM(i)<=x"0000";
			END GENERATE GEN;
		
		--ChCK addrress validity
--		
		PROCESS(ADDR)
		BEGIN	
			IF (ADDR(15 DOWNTO 6)="0000000000" AND ADDR(0)='0') THEN
				EN<='1';
				ELSE
				EN<='0';
				END IF;
				
				DOUT<="ZZZZZZZZZZZZZZZZ";
				GEN2:
				FOR j in 0 to 31 LOOP
				 IF DCDOUT(j)= '1' AND EN= '1' THEN
					DOUT<=MEM(j);
					END IF;
					END LOOP GEN2;
					END PROCESS;
--				 

--		WITH ADDR(4 DOWNTO 0) SELECT
--			DOUT<= MEM(0) when "00000",
--					 MEM(1) when "00010",
--					 MEM(2) when "00100",
--					 MEM(3) when "00110",
--					 MEM(4) when "01000",
--					 MEM(5) when "01010",
--					 MEM(6) when "01100",
--					 MEM(7) when "01110",
--					 MEM(8) when "10000",
--					 MEM(9) when "10010",
--					 MEM(10) when "10100",
--					 MEM(11) when "10110",
--					 MEM(12) when "11000",
--					 MEM(13) when "11010",
--					 MEM(14) when "11100",
--					 MEM(15) when "11110",
--					 "XXXXXXXXXXXXXXXX" WHEN OTHERS;
	

END Behavior;