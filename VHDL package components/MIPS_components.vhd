library ieee;
use ieee.std_logic_1164.all;

PACKAGE MIPS_components IS
--DECODER LAB0
		component DCD3x8	--3 to 8 decoder
				PORT (D: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
						EN: IN STD_LOGIC;
						Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
			end component;
		component DCD4x16	--4 to 16 decoder Made in lab 6
				PORT (D: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
						EN:IN STD_LOGIC;
						Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
		component DCD5x32	--5 to 32 decoder Made in lab 6
				PORT (D: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
						EN:IN STD_LOGIC;
						Q: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
			end component;
--MULTIPLEXORS LAB0
			component MUX2x16 -- 16-bit 2-to-1 mux Made in LAB 6
				PORT (A,B: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
					   S: IN STD_LOGIC;
					   Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
			component MUX2x3 -- 3-bit 2-to-1 mux Made in LAB 7
				PORT (D0,D1: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
						s:	IN STD_LOGIC;
						Q: OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
			end component;
			component MUX3x16 -- 16-bit 3-to-1 mux Made in LAB 6
				PORT (A,B,C: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
						S: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
						Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
			component MUX4x4 -- 4-bit 4-to-1 mux
				PORT (D0,D1,D2,D3: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
						s:	IN STD_LOGIC_VECTOR (1 DOWNTO 0);
						Q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
			end component;
			component MUX8x16 -- 16-bit 8-to-1 mux
				PORT (D0,D1,D2,D3,D4,D5,D6,D7: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
						s:	IN STD_LOGIC_VECTOR (2 DOWNTO 0);
						Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
--REGISTERS	LAB4
			component REG8	 -- 8-bit register
				PORT (D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
						EN:IN STD_LOGIC ;
						CLR: IN STD_LOGIC;
						CLK: IN STD_LOGIC;
						Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
			end component;
			component REG16 -- 16-bit register
				PORT (D: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
						EN:  IN STD_LOGIC ;
						CLR: IN STD_LOGIC;
						CLK: IN STD_LOGIC;
						Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
			component REG8x16 -- 16-bit register file with 8 registers
				PORT (ADD_R1,ADD_R2,ADD_W: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
						WE,CLK: IN STD_LOGIC;
						DIN: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
						DOUT1, DOUT2: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
-- ALU COMPS LAB5
			component ADD4 -- 4 bit adder
				PORT (A,B :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
						Cin :IN STD_LOGIC;
						S   :OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
						Cout:OUT  STD_LOGIC);
			end component;
--LAB6
			component ADD16 --16 bit ADDER
				PORT(A,B :IN STD_LOGIC_VECTOR(15 DOWNTO 0);
						Cin :IN STD_LOGIC;
						S:OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
						Cout:OUT  STD_LOGIC);
			end component;
-- BITwise LAB5
			component BWAND4 -- 4-bit and
				PORT (A,B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
						Q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
			end component;
			component BWOR4 -- 4-bit OR
				PORT (A,B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
						Q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
			end component;
			component PINV4 -- 4-bit inverter
				PORT (A: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
						EN: IN STD_LOGIC;
						Q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
			end component;
-- ALUS	LAB5
			component ALU4 -- 4-bit ALU
				PORT (A,B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
						LESS,CIN: IN STD_LOGIC;
						SEL: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
						COUT,OVERFLOW,SET,ZERO: OUT STD_LOGIC;
						F: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
			end component;
			
			component ALU16 --16 bit ALU
				PORT (A,B: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
						SEL: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
						COUT,OVERFLOW,ZERO: OUT STD_LOGIC;
						F: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
-- MEMORY STUFF LAB6

			component SHLONE --16 bit Shift left by one bit
				PORT (A: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
						F: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
			
			component INTWO --16 bit add 2
				PORT (A :IN STD_LOGIC_VECTOR(15 DOWNTO 0);
						COUT:OUT STD_LOGIC;
						S:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
			end component;
			
			component SGNEXT6x16 --6 to 16 bit sign extend
				PORT (D: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
						Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
			
			component INSMEM --INSTRUCTION MEMORY 
				PORT (ADDR: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
						DOUT: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
			end component;
			
			component DATAMEM --INSTRUCTION MEMORY 
				PORT (WE, RE, CLK: IN STD_LOGIC;
						ADDR, DIN:   IN STD_LOGIC_VECTOR(15 DOWNTO 0);
						DOUT:        OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
			end component;


		
	end MIPS_components;