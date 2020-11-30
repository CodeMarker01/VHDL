
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BTN_UD is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           BTN_UD : in  STD_LOGIC;
           BTN_UD_Q : out  STD_LOGIC);
end BTN_UD;

architecture Behavioral of BTN_UD is
SIGNAL ENA_DB: STD_LOGIC;
SIGNAL ENA_UD, ENA_SS: STD_LOGIC;
begin
CD_LAM_HEP_BTN_UP: ENTITY WORK.CD_LAM_HEP_BTN
				PORT MAP (	CKHT => CKHT,
								BTN => BTN_UD,
								BTN_CDLH => ENA_UD);
DEM_1BIT:	ENTITY WORK.DEM_1BIT
				PORT MAP( CKHT => CKHT,
							RST => RST,
							ENA_DB => ENA_DB,
							BTN_UD_Q => BTN_UD_Q);
end Behavioral;

