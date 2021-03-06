-- MACH DEM NHI PHAN 4 BIT
-- CKHT -> DONG BO FF
-- ENA1HZ DIEU KHIEN TANG GIA TRI DEM
-- RST (BTN_N0) -> RESET MACH DEM
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DEM_NHI_PHAN_4BIT is
Port ( CKHT, BTN_N0: in STD_LOGIC;
		LED: out STD_LOGIC_VECTOR (3 downto 0));
end DEM_NHI_PHAN_4BIT;
architecture Behavioral of DEM_NHI_PHAN_4BIT is
SIGNAL ENA_DB, RST: STD_LOGIC;
begin
	RST <= NOT BTN_N0;
--	CHIA_1ENA1HZ: ENTITY WORK.CHIA_10ENA
	CHIA_1ENA1HZ: ENTITY WORK.CHIA_10XUNG
	PORT MAP ( CKHT => CKHT,
				  CK10HZ => ENA_DB);
	DEM_4BIT: ENTITY WORK.DEM_4BIT
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					Q => LED);
end Behavioral;