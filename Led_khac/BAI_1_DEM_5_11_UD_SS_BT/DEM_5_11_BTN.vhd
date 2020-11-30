
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity DEM_5_11_BTN is
    Port ( CKHT, RST, BTN_UD, BTN_SS : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end DEM_5_11_BTN;

architecture Behavioral of DEM_5_11_BTN is
SIGNAL ENA_UD, ENA_DB, ENA_SS: STD_LOGIC;
begin
CHIA_10ENA: ENTITY WORK.CHIA_10ENA
				PORT MAP(	CKHT => CKHT,
								ENA2HZ => ENA_DB);
BTN_UD_1B: ENTITY WORK.BTN_UD_1B
				PORT MAP (	CKHT => CKHT,
								RST => RST,
								BTN => BTN_UD,
								Q => ENA_UD);
BTN_SS_1B: ENTITY WORK.BTN_SS_1B
				PORT MAP (	CKHT => CKHT,
								RST => RST,
								BTN => BTN_SS,
								Q => ENA_SS);								
DEM_5_11: ENTITY WORK.DEM_5_11
				PORT MAP (	CKHT => CKHT,
								RST => RST,
								ENA_DB => ENA_DB,
								ENA_UD => ENA_UD,
								ENA_SS => ENA_SS,
								Q => Q);

end Behavioral;

