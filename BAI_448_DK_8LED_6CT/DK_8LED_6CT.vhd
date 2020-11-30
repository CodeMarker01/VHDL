library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DK_8LED_6CT is
Port ( CKHT, BTN_N0: in STD_LOGIC;
LED: out STD_LOGIC_VECTOR (7 downto 0));
end DK_8LED_6CT;

architecture Behavioral of DK_8LED_6CT is
SIGNAL ENA_DB, RST: STD_LOGIC;
SIGNAL Q_STD_PST,Q_STD_TSP: STD_LOGIC_VECTOR (7 downto 0);
SIGNAL Q_STD_TNV,Q_STD_TTR: STD_LOGIC_VECTOR (7 downto 0);
SIGNAL Q_DSDC_PST,Q_DSDC_TSP: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL OE: STD_LOGIC_VECTOR (5 downto 0):="000000";
Begin
	RST <= NOT BTN_N0;
CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP ( CKHT => CKHT,
	ENA5HZ => ENA_DB);
LED_STD_PST: ENTITY WORK.LED_STD_PST
	PORT MAP ( CKHT => CKHT,
	RST => RST,
	ENA_DB => ENA_DB,
	OE => OE(0),
	Q => Q_STD_PST);
	LED_STD_TSP: ENTITY WORK.LED_STD_TSP
	PORT MAP ( CKHT => CKHT,
	RST => RST,
	ENA_DB => ENA_DB,
	OE => OE(1),
	Q => Q_STD_TSP);
LED_STD_TNV: ENTITY WORK.LED_STD_TNV
	PORT MAP ( CKHT => CKHT,
	RST => RST,
	ENA_DB => ENA_DB,
	OE => OE(2),
	Q => Q_STD_TNV);
LED_STD_TTR: ENTITY WORK.LED_STD_TTR
	PORT MAP ( CKHT => CKHT,
	RST => RST,
	ENA_DB => ENA_DB,
	OE => OE(3),
	Q => Q_STD_TTR);
DIEUKHIEN_CHOPHEP: ENTITY WORK.DIEUKHIEN_CHOPHEP
	PORT MAP ( CKHT => CKHT,
	RST => RST,
	ENA_DB => ENA_DB,
	OE => OE);
LED_DSDC_PST: ENTITY WORK.LED_DSDC_PST
	PORT MAP ( CKHT => CKHT,
	RST => RST,
	ENA_DB => ENA_DB,
	OE => OE(4),
	Q => Q_DSDC_PST);
LED_DSDC_TSP: ENTITY WORK.LED_DSDC_TSP
	PORT MAP ( CKHT => CKHT,
	RST => RST,
	ENA_DB => ENA_DB,
	OE => OE(5),
	Q => Q_DSDC_TSP);
	
LED <= Q_STD_PST OR Q_STD_TSP OR Q_STD_TNV OR Q_STD_TTR OR Q_DSDC_TSP OR Q_DSDC_PST;

end Behavioral;