
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEM_8BIT_1HZ_2HZ_4HZ_2GIAY is
    Port ( CKHT, BTN_N0 : in  STD_LOGIC;
           LED_N : out  STD_LOGIC_VECTOR (7 downto 0);
           BELL : out  STD_LOGIC);
end DEM_8BIT_1HZ_2HZ_4HZ_2GIAY;

architecture Behavioral of DEM_8BIT_1HZ_2HZ_4HZ_2GIAY is
SIGNAL ENA_DB, RST: STD_LOGIC;
SIGNAL Q: STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
DINH_THOI_124: ENTITY WORK.DINH_THOI_124								
				PORT MAP(	CKHT => CKHT,
								RST => RST,
								ENA_DB => ENA_DT);
DEM_8BIT: ENTITY WORK.DEM_8BIT
				PORT MAP( 	CKHT => CKHT,
								RST => RST,
								ENA_DB => ENA_DT,
								Q => Q);


end Behavioral;

