library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DEM_4BIT_BTN is
	Port (CKHT, RST, BTN: in STD_LOGIC;
			Q: out STD_LOGIC_VECTOR (3 downto 0));
end DEM_4BIT_BTN;
architecture Behavioral of DEM_4BIT_BTN is
SIGNAL ENA_D, ENA: STD_LOGIC;
BEGIN
	DEBOUNCE_BTN: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP ( CKHT => CKHT,
					BTN => BTN,
					DB_TICK => ENA_D);
	LAM_HEP_XUNG: ENTITY WORK.LAM_HEP_XUNG
	PORT MAP ( CKHT => CKHT,
					D => ENA_D,
					Q => ENA);
--toc do sang led -> phu thuoc ENA -> phu thuoc MACH_HEP_XUNG
	DEM_4BIT: ENTITY WORK.DEM_4BIT
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA,
					Q => Q);
end Behavioral;