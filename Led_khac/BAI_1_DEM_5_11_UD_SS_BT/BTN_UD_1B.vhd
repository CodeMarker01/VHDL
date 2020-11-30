
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity BTN_UD_1B is
    Port ( CKHT, RST, BTN: in  STD_LOGIC;
           Q : out  STD_LOGIC);
end BTN_UD_1B;

architecture Behavioral of BTN_UD_1B is
SIGNAL ENA_DB: STD_LOGIC;
begin
CD_LAM_HEP_BTN_UP: ENTITY WORK.CD_LAM_HEP_BTN
				PORT MAP (	CKHT => CKHT,
								BTN => BTN,
								BTN_CDLH => ENA_DB);
DEM_1BIT:	ENTITY WORK.DEM_1BIT
				PORT MAP( CKHT => CKHT,
							RST => RST,
							ENA_DB => ENA_DB,
							Q => Q);
end Behavioral;

