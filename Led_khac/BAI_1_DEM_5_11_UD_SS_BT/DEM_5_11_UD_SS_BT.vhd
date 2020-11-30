
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DEM_5_11_UD_SS_BT is
    Port ( CKHT: in  STD_LOGIC;
           BTN_N : in  STD_LOGIC_VECTOR (2 downto 0);
           LED_N : OUT  STD_LOGIC_VECTOR (3 downto 0);
           BELL : out  STD_LOGIC);
end DEM_5_11_UD_SS_BT;

architecture Behavioral of DEM_5_11_UD_SS_BT is
SIGNAL RST, BTN_UD, BTN_SS: STD_LOGIC;
SIGNAL Q: STD_LOGIC_VECTOR (3 DOWNTO 0);
begin
	BELL <= '1';
	RST <= NOT BTN_N(0);
	BTN_UD <= NOT BTN_N(1);
	BTN_SS <= NOT BTN_N(2);
	LED_N <= NOT Q;
	
	DEM_5_11_BTN: ENTITY WORK.DEM_5_11_BTN
	PORT MAP (	CKHT => CKHT,
					RST => RST,
					BTN_UD => BTN_UD,
					BTN_SS => BTN_SS,
					Q => Q);
					
end Behavioral;

