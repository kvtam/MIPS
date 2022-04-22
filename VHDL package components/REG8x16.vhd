LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;
--8 to 16 bit register
Entity REG8x16 IS
	PORT (ADD_R1,ADD_R2,ADD_W: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			WE,CLK: IN STD_LOGIC;
			DIN: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			DOUT1, DOUT2: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END REG8x16;

ARCHITECTURE Behavior of REG8x16 IS
--	COMPONENT DCD3x8
--	 	PORT (D: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
--			Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
--	END COMPONENT;
--	COMPONENT REG16
--		PORT (D: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
--			EN:  IN STD_LOGIC ;
--			CLR: IN STD_LOGIC;
--			CLK: IN STD_LOGIC;
--			Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
--	END COMPONENT;
--	COMPONENT MUX8x16
--		PORT (D0,D1,D2,D3,D4,D5,D6,D7: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
--			s:	IN STD_LOGIC_VECTOR (2 DOWNTO 0);
--			Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
--	END COMPONENT;
	
	signal W,Q : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal A,B,C,D,E,F,G,H: STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN 
	
	ADDRESS_DECODER: DCD3x8 PORT MAP (ADD_W(2 DOWNTO 0),'1',Q(7 DOWNTO 0));
	
	W(0)<= WE AND Q(0);
	W(1)<= WE AND Q(1);
	W(2)<= WE AND Q(2);
	W(3)<= WE AND Q(3);
	W(4)<= WE AND Q(4);
	W(5)<= WE AND Q(5);
	W(6)<= WE AND Q(6);
	W(7)<= WE AND Q(7);
	A<= x"0000";
	H<= x"0100";
	
	--REG0: REG16 PORT MAP (DIN(15 DOWNTO 0),W(0),'0',CLK,A(15 DOWNTO 0));
	REG1: REG16 PORT MAP (DIN(15 DOWNTO 0),W(1),'0',CLK,B(15 DOWNTO 0));
	REG2: REG16 PORT MAP (DIN(15 DOWNTO 0),W(2),'0',CLK,C(15 DOWNTO 0));
	REG3: REG16 PORT MAP (DIN(15 DOWNTO 0),W(3),'0',CLK,D(15 DOWNTO 0));
	REG4: REG16 PORT MAP (DIN(15 DOWNTO 0),W(4),'0',CLK,E(15 DOWNTO 0));
	REG5: REG16 PORT MAP (DIN(15 DOWNTO 0),W(5),'0',CLK,F(15 DOWNTO 0));
	REG6: REG16 PORT MAP (DIN(15 DOWNTO 0),W(6),'0',CLK,G(15 DOWNTO 0));
	--REG7: REG16 PORT MAP (DIN(15 DOWNTO 0),W(7),'0',CLK,H(15 DOWNTO 0));
	
	MUX1: MUX8x16 PORT MAP (A,B,C,D,E,F,G,H,ADD_R1,DOUT1);
	MUX2: MUX8x16 PORT MAP (A,B,C,D,E,F,G,H,ADD_R2,DOUT2);
	
	
	
	
END Behavior;