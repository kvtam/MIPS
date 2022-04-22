LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ADD4 IS
    PORT(A,B :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         Cin :IN STD_LOGIC;
         S   :OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
         Cout:OUT  STD_LOGIC);
END ADD4;

ARCHITECTURE BEHAVIOR OF ADD4 IS
SIGNAL    G,P,T :    STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL    Cn: STD_LOGIC_VECTOR(3 DOWNTO 1);

BEGIN
    T <= A XOR B;
    G <= A AND B;
    P <= A OR B;
    PROCESS (G,P,Cn)
    BEGIN
    Cn(1) <= G(0) OR (P(0) AND Cin);
        CGEN: FOR i IN 1 TO 2 LOOP
              Cn(i+1) <= G(i) OR (P(i) AND Cn(i));
              END LOOP;
    Cout <= G(3) OR (P(3) AND Cn(3));
    END PROCESS;

    S(0) <= T(0) XOR Cin;
    S(3 DOWNTO 1) <= T(3 DOWNTO 1) XOR Cn(3 DOWNTO 1);
END behavior;