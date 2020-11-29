-- MACH DEM 8 BIT
-- DUNG ENA5HZ TANG GIA TRI DEM
-- RST -> RESET
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DEM_NHI_PHAN_8BIT is
Port ( CKHT, BTN_N0: in STD_LOGIC;
		LED: out STD_LOGIC_VECTOR (7 downto 0));
end DEM_NHI_PHAN_8BIT;
architecture Behavioral of DEM_NHI_PHAN_8BIT is
SIGNAL ENA_DB, RST: STD_LOGIC;
begin
	RST <= NOT BTN_N0;
--	CHIA_1ENA1HZ: ENTITY WORK.CHIA_10ENA
	CHIA_1ENA1HZ: ENTITY WORK.CHIA_10ENA
	PORT MAP ( CKHT => CKHT,
				  ena20hz => ENA_DB);
	DEM_8BIT: ENTITY WORK.DEM_8BIT
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					Q => LED);
end Behavioral;