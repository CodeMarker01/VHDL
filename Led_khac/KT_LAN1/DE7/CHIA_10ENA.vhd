LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY CHIA_10ENA IS
	PORT(CKHT:IN STD_LOGIC;
			ENA1HZ : OUT STD_LOGIC
--			ENA2HZ: OUT STD_LOGIC;
--			ENA5HZ: OUT STD_LOGIC
--			ENA10HZ: OUT STD_LOGIC
--			ENA20HZ : OUT STD_LOGIC;
--			ENA25HZ: OUT STD_LOGIC;
--			ENA50HZ: OUT STD_LOGIC;
--			ENA100HZ: OUT STD_LOGIC;
--			ENA1KHZ: OUT STD_LOGIC;
--			ENA1MHZ: OUT STD_LOGIC
         );
END CHIA_10ENA;

ARCHITECTURE BEHAVIORAL OF CHIA_10ENA IS
CONSTANT N: INTEGER := 50000000;
SIGNAL D1HZ_REG, D1HZ_NEXT : INTEGER RANGE 0 TO N := 1;
SIGNAL D2HZ_REG, D2HZ_NEXT : INTEGER RANGE 0 TO N/2 := 1;
SIGNAL D5HZ_REG, D5HZ_NEXT : INTEGER RANGE 0 TO N/5 := 1;
SIGNAL D10HZ_REG, D10HZ_NEXT : INTEGER RANGE 0 TO N/10 := 1;
SIGNAL D20HZ_REG, D20HZ_NEXT : INTEGER RANGE 0 TO N/20 := 1;
SIGNAL D25HZ_REG, D25HZ_NEXT : INTEGER RANGE 0 TO N/25 := 1;
SIGNAL D50HZ_REG, D50HZ_NEXT : INTEGER RANGE 0 TO N/50 := 1;
SIGNAL D100HZ_REG, D100HZ_NEXT : INTEGER RANGE 0 TO N/100 := 1;
SIGNAL D1KHZ_REG, D1KHZ_NEXT : INTEGER RANGE 0 TO N/1000 := 1;
SIGNAL D1MHZ_REG, D1MHZ_NEXT : INTEGER RANGE 0 TO N/1000000 := 1;

BEGIN
--REGISTER
	PROCESS(CKHT)
	BEGIN
		IF(FALLING_EDGE(CKHT)) THEN D1HZ_REG <= D1HZ_NEXT;
											 D2HZ_REG <= D2HZ_NEXT;
											 D5HZ_REG <= D5HZ_NEXT;
											 D10HZ_REG <= D10HZ_NEXT;
											 D20HZ_REG <= D20HZ_NEXT;
											 D25HZ_REG <= D25HZ_NEXT;
											 D50HZ_REG <= D50HZ_NEXT;
											 D100HZ_REG <= D100HZ_NEXT;
											 D1KHZ_REG <= D1KHZ_NEXT;
											 D1MHZ_REG <= D1MHZ_NEXT;
		END IF;
	END PROCESS;
-- NEXT STATE LOGIC
D1HZ_NEXT<= 1 WHEN D1HZ_REG =N/1 ELSE 
				D1HZ_REG+1;
D2HZ_NEXT<= 1 WHEN D2HZ_REG =N/2 ELSE 
				D2HZ_REG+1;
D5HZ_NEXT<= 1 WHEN D5HZ_REG =N/5 ELSE 
				D5HZ_REG+1;
D10HZ_NEXT<= 1 WHEN D10HZ_REG =N/10 ELSE 
				D10HZ_REG+1;
D20HZ_NEXT<= 1 WHEN D20HZ_REG =N/20 ELSE 
				D20HZ_REG+1;
D25HZ_NEXT<= 1 WHEN D25HZ_REG =N/25 ELSE 
				D25HZ_REG+1;
D50HZ_NEXT<= 1 WHEN D50HZ_REG =N/50 ELSE 
				D50HZ_REG+1;
D100HZ_NEXT<= 1 WHEN D100HZ_REG =N/100 ELSE 
				D100HZ_REG+1;
D1KHZ_NEXT<= 1 WHEN D1KHZ_REG =N/1000 ELSE 
				D1KHZ_REG+1;
D1MHZ_NEXT<= 1 WHEN D1MHZ_REG =N/1000000 ELSE 
				D1MHZ_REG+1;
-- OUT LOGIC
ENA1HZ <= '1' WHEN D1HZ_REG=N/(1*2) ELSE		'0';
--ENA2HZ <= '1' WHEN D2HZ_REG=N/(2*2) ELSE
--			'0'; 
--	ENA5HZ <= '1' WHEN D5HZ_REG=N/(5*2) ELSE '0';
--			
--ENA10HZ <= '1' WHEN D10HZ_REG=N/(10*2) ELSE
--			'0';
--ENA20HZ <= '1' WHEN D20HZ_REG=N/(20*2) ELSE
--			'0';
--ENA25HZ <= '1' WHEN D25HZ_REG=N/(25*2) ELSE
--			'0';
--ENA50HZ <= '1' WHEN D50HZ_REG=N/(50*2) ELSE
--			'0';
--ENA100HZ <= '1' WHEN D100HZ_REG=N/(100*2) ELSE
--			'0';
--ENA1KHZ <= '1' WHEN D1KHZ_REG=N/(1000*2) ELSE
--			'0';
--ENA1MHZ <= '1' WHEN D1MHZ_REG=N/(1000000*2) ELSE
--			'0';	*/		
--			
END BEHAVIORAL;