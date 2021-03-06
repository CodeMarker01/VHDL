
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NGUYENHUYQUAN is
    Port ( CKHT : in  STD_LOGIC;
           BELL : out  STD_LOGIC;
           BTN_N : in  STD_LOGIC_VECTOR (3 downto 0);
           SSEG, ANODE : out  STD_LOGIC_VECTOR (7 downto 0));
end NGUYENHUYQUAN;

architecture Behavioral of NGUYENHUYQUAN is

SIGNAL ENA_DB, ENA1KHZ: STD_LOGIC;
SIGNAL ENA_SS1, ENA_SS2, ENA_SS3, ENA_SS4: STD_LOGIC;
SIGNAL DONVI, CHUC: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DEM: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL DAU_CHAM_8LED: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ENA_GIAIMA_8LED: STD_LOGIC_VECTOR(7 DOWNTO 0);

begin
	BELL <= '1';
	DAU_CHAM_8LED <= X"FF";
	ENA_GIAIMA_8LED <= "11000011";
	
	ENA1: ENTITY WORK.DEM_1BIT_BTN
			PORT MAP(	CKHT => CKHT,
							BTN => NOT BTN_N(0),
							Q => ENA_SS1);	
	
	ENA2: ENTITY WORK.DEM_1BIT_BTN
			PORT MAP(	CKHT => CKHT,
							
							BTN => NOT BTN_N(1),
							Q => ENA_SS2);
							
	ENA3: ENTITY WORK.DEM_1BIT_BTN
			PORT MAP(	CKHT => CKHT,
							
							BTN => NOT BTN_N(2),
							Q => ENA_SS3);	
							
	ENA4: ENTITY WORK.DEM_1BIT_BTN
			PORT MAP(	CKHT => CKHT,
							
							BTN => NOT BTN_N(3),
							Q => ENA_SS4);	
							
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
			PORT MAP(	CKHT => CKHT,
							ENA5HZ => ENA_DB,
							ENA1KHZ => ENA1KHZ);	
							
	DEM_A_FF: ENTITY WORK.DEM_6BIT
			PORT MAP(	CKHT => CKHT,
							ENA_DB => ENA_DB,
							ENA_SS1 => ENA_SS1,
							ENA_SS2 => ENA_SS2,
							ENA_SS3 => ENA_SS3,
							ENA_SS4 => ENA_SS4,
							Q => DEM);
							
   HEXTOBCD: ENTITY WORK.HEXTOBCD_6BIT
			PORT MAP(	SOHEX6BIT => DEM,
							DONVI => DONVI,
							CHUC => CHUC);
							
   HIENTHI_2LED: ENTITY WORK.GIAIMA_HIENTHI_8LED_7DOAN
			PORT MAP(
					CKHT => CKHT,
					ENA1KHZ => ENA1KHZ,
					LED70 => X"1",
					LED71 => X"5", --- NHO SUA CHO NAY
					LED72 => X"F",
					LED73 => X"F",
					LED74 => X"F",
					LED75 => X"F",
					LED76 => DONVI,
					LED77 => CHUC,
					DAU_CHAM_8LED => DAU_CHAM_8LED,
					ENA_GIAIMA_8LED => ENA_GIAIMA_8LED,
					ANODE => ANODE,
					SSEG => SSEG);
	
end Behavioral;

