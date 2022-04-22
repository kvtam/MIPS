LIBRARY ieee;
use ieee.std_logic_1164.all;
use work.MIPS_components.all;

--Program counter
Entity CONTROL IS
	PORT (INST: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			REGDST, BRANCH,MEMREAD,MEMTOREG,MEMWRITE,ALUSRC,REGWRITE,JMP: OUT STD_LOGIC;
			ALUOP: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END CONTROL;

ARCHITECTURE Behavior of CONTROL IS
	SIGNAL FUN: STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL OP : STD_LOGIC_VECTOR (3 DOWNTO 0);
	
	BEGIN 
	OP<=INST(15 DOWNTO 12);
	FUN<=INST(2 DOWNTO 0);
		PROCESS(OP)
			BEGIN
			CASE OP IS
			WHEN x"0" =>
				REGDST  <='1';
				BRANCH  <='0';
				MEMREAD <='0';
				MEMTOREG<='0';
				ALUOP   <=FUN;
				MEMWRITE<='0';
				ALUSRC  <='0';
				REGWRITE<='1';
				JMP	  <='0';
			WHEN x"B" =>
				REGDST  <='0';
				BRANCH  <='0';
				MEMREAD <='1';
				MEMTOREG<='1';
				ALUOP   <="010";
				MEMWRITE<='0';
				ALUSRC  <='1';
				REGWRITE<='1';
				JMP	  <='0';
			WHEN x"F" =>
				REGDST  <='0';
				BRANCH  <='0';
				MEMREAD <='0';
				MEMTOREG<='0';
				ALUOP   <="010";
				MEMWRITE<='1';
				ALUSRC  <='1';
				REGWRITE<='0';
				JMP	  <='0';
			WHEN x"4" =>
				REGDST  <='0';
				BRANCH  <='1';
				MEMREAD <='0';
				MEMTOREG<='0';
				ALUOP   <="111";
				MEMWRITE<='0';
				ALUSRC  <='0';
				REGWRITE<='0';
				JMP	  <='0';
			WHEN x"2" =>
				REGDST  <='0';
				BRANCH  <='0';
				MEMREAD <='0';
				MEMTOREG<='0';
				ALUOP   <="010";
				MEMWRITE<='0';
				ALUSRC  <='1';
				REGWRITE<='0';
				JMP	  <='1';
			WHEN OTHERS =>
			null;
--				REGDST  <='0';
--				BRANCH  <='0';
--				MEMREAD <='0';
--				MEMTOREG<='0';
--				ALUOP   <="000";
--				MEMWRITE<='0';
--				ALUSRC  <='0';
--				REGWRITE<='0';
--				JMP	  <='0';
			END CASE;
		END PROCESS;
	
		
END Behavior;
				