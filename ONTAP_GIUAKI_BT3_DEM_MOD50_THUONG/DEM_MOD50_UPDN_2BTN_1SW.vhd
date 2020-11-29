library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEM_MOD50_UPDN_2BTN_1SW is
	Port ( CKHT, SW: in STD_LOGIC;
			BTN_N: in STD_LOGIC_VECTOR(1 downto 0);
			LED: out STD_LOGIC_VECTOR (5 downto 0);
			LEDG: out STD_LOGIC_VECTOR(1 downto 0));
end DEM_MOD50_UPDN_2BTN_1SW;

architecture Behavioral of DEM_MOD50_UPDN_2BTN_1SW is
SIGNAL ENA_DB, RST, BTN, TOGGLE: STD_LOGIC;
Begin
	RST <= NOT BTN_N(0);
	BTN <= NOT BTN_N(1);
	
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP ( 	CKHT => CKHT,
					ENA5HZ => ENA_DB);
					
	DEM_1BIT_BTN: ENTITY WORK.DEM_1BIT_BTN
	PORT MAP (	CKHT => CKHT,
					RST => RST,
					BTN => BTN,
					Q => TOGGLE);
					
	DEM_MOD50: ENTITY WORK.DEM_MOD50
	PORT MAP (	CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					Sw => SW,
					TOGGLE => TOGGLE,
					Q => LED,
					LEDG => LEDG);
end Behavioral;