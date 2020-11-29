library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DEM_4BIT_BTN_CACH_2 is
	Port ( CKHT: in STD_LOGIC;
			 BTN_N: in STD_LOGIC_VECTOR(1 downto 0);
			 LED: out STD_LOGIC_VECTOR(3 downto 0));
end DEM_4BIT_BTN_CACH_2;
architecture Behavioral of DEM_4BIT_BTN_CACH_2 is
SIGNAL RST, BTN1: STD_LOGIC;
Begin
	RST <= NOT BTN_N(0);
	BTN1 <= NOT BTN_N(1);
	DEM_4BIT_BTN : ENTITY WORK.DEM_4BIT_BTN
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					BTN => BTN1,
					Q => LED);
End Behavioral;