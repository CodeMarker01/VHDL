----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEM_MODE_HZ is
	PORT(
				CKHT, BTN_N0: IN STD_LOGIC;
				BELL: OUT STD_LOGIC;
				LED_N: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end DEM_MODE_HZ;

architecture Behavioral of DEM_MODE_HZ is

SIGNAL ENA_DB, RST, ENA_DB1, ENA_DB2, ENA_DB5, ENA_DB2S: STD_LOGIC;
SIGNAL S: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LED: STD_LOGIC_VECTOR(7 DOWNTO 0);

begin
		BELL <= '1';
		LED_N <= NOT LED; 
		RST <= NOT BTN_N0;
CHIA_3_TAN_SO: ENTITY WORK.CHIA_10ENA_1HZ_1MHZ
	PORT MAP (
					CKHT => CKHT,
					ENA1HZ => ENA_DB1,
					ENA2HZ => ENA_DB2,
					ENA5HZ => ENA_DB5
	);
GIAI_MA: ENTITY WORK.GIAIMA_CONDITIONAL_INS
	PORT MAP(
					ENA1HZ => ENA_DB1,
					ENA2HZ => ENA_DB2,
					ENA5HZ => ENA_DB5,
					S => S,
					O => ENA_DB
	);
DEM_8BIT: ENTITY WORK.DEM_8BIT
	PORT MAP(
					CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					Q => LED
	);
DEM_2BIT: ENTITY WORK.DEM_2BIT_TAM  -----TAO TIN HIEU DKHIEN S
	PORT MAP(
					CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB2S,
					Q => S
	);
DEM_2S: ENTITY WORK.DEM_2BIT   --- DEM 2S
	PORT MAP(
					CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB1,
					Q => ENA_DB2S
	);
end Behavioral;

