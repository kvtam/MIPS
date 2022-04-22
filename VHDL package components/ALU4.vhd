LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;

--4bit ALU
Entity ALU4 IS
	PORT (A,B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			LESS,CIN: IN STD_LOGIC;
			SEL: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			COUT,OVERFLOW,SET,ZERO: OUT STD_LOGIC;
			F: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END ALU4;

ARCHITECTURE Behavior of ALU4 IS
	SIGNAL RES_AND, RES_OR, RES_ADD, RES_SLT,B_ADD, BINV: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL COUT_TEMP, CIN_TEMP: STD_LOGIC;
	
BEGIN 
	OPAND: BWAND4 PORT MAP(A(3 DOWNTO 0),B(3 DOWNTO 0),RES_AND(3 DOWNTO 0));	--PORTMAP all of the inputs for the 4x4 mux
	OP_OR: BWOR4  PORT MAP(A(3 DOWNTO 0),B(3 DOWNTO 0),RES_OR(3 DOWNTO 0));
	OPINV: PINV4  PORT MAP(B(3 DOWNTO 0),SEL(2),BINV(3 DOWNTO 0));
	OPADD: ADD4   PORT MAP(A(3 DOWNTO 0),BINV,CIN,RES_ADD(3 DOWNTO 0),COUT_TEMP);
	OPSEL: MUX4x4 PORT MAP(RES_AND,RES_OR,RES_ADD,RES_SLT, SEL(1 DOWNTO 0),F);
	OVERFLOW<= NOT(A(3) XOR B(3) XOR COUT_TEMP);
--		PROCESS(LESS)
--		BEGIN
--			IF LESS = '1' THEN
--				RES_SLT(3 DOWNTO 1)<= "000";
--				RES_SLT(0)<='1';
--				SET <= '1';
--			ELSE
--				RES_SLT<= "0000";
--				SET <= '0';
--				
--			END IF;
--		END PROCESS;
		RES_SLT<= "000" & LESS;
		PROCESS(SEL)
		BEGIN
--			IF SEL(2)= '1' THEN
--				B_ADD<= BINV;
--			ELSE
--				B_ADD<= B;
--			END IF;
			IF SEL(1 DOWNTO 0)= "10" THEN
				COUT<=COUT_TEMP;
			END IF;
			
			SET<=RES_ADD(3);
		END PROCESS;
		
		PROCESS(A,B,COUT_TEMP)
		BEGIN
				ZERO<= '0';
			IF A=B THEN 
				ZERO<= '1';
			END IF;
			
		END PROCESS;
		

	
	

END Behavior;