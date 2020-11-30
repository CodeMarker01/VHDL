
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GIO_NHIET_DO_NUT_NHAN_PRO is
    Port ( CKHT : in  STD_LOGIC;
           BELL : out  STD_LOGIC;
           BTN_N : in  STD_LOGIC_VECTOR (4 downto 0);
           DS18B20 : inout  STD_LOGIC;
           SSEG, ANODE : OUT  STD_LOGIC_VECTOR (7 downto 0);
           DECIMAL : out  STD_LOGIC_VECTOR (3 downto 0));
end GIO_NHIET_DO_NUT_NHAN_PRO;

architecture Behavioral of GIO_NHIET_DO_NUT_NHAN_PRO is
SIGNAL ENA_DB, ENA1KHZ, RST, BTN_MOD, BTN_UP, BTN_DW, BTN_HT, DS_PRESENT, SS_ND : STD_LOGIC;
SIGNAL ENA_UP, ENA_DW, ENA_MOD, ENA_HT, ENA_CHINH, ENA2HZ: STD_LOGIC;
SIGNAL GIAY, PHUT, GIO: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL GIO5: STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL GIATRI_MOD: STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL CH_GIO, DV_GIO: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL CH_PHUT, DV_PHUT: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL CH_GIAY, DV_GIAY: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL CH_ND, DV_ND: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL DAU_CHAM_8LED: STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL ENA_GIAIMA_8LED: STD_LOGIC_VECTOR (7 DOWNTO 0);

SIGNAL DONVI, CHUC, TRAM: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LED0, LED1, LED2: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LED_0, LED_1, LED_2, LED_3, LED_4, LED_5, LED_6, LED_7: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL NHIETDO, GIOI_HAN_ND: STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL TEMPERATURE: STD_LOGIC_VECTOR (11 DOWNTO 0);
begin
	
	RST <= NOT BTN_N(0);
	BTN_UP <= NOT BTN_N(1);
	BTN_DW <= NOT BTN_N(2);
	BTN_MOD <= NOT BTN_N(3);
	BTN_HT <=  NOT BTN_N(4);
--------------------------------------------------------------
GIO <= '0'& GIO5;
CHIA_10ENA: ENTITY WORK.CHIA_10ENA
			PORT MAP(	CKHT => CKHT,
							ENA10HZ => ENA_DB,
							ENA5HZ => ENA_CHINH,
							ENA2HZ => ENA2HZ,
							ENA1KHZ => ENA1KHZ);
CHONGDOI_UP: ENTITY WORK.DEBOUNCE_BTN
			PORT MAP(	CKHT => CKHT,
							BTN => BTN_UP,
							DB_TICK => ENA_UP);
CHONGDOI_DW: ENTITY WORK.DEBOUNCE_BTN
			PORT MAP(	CKHT => CKHT,
							BTN => BTN_DW,
							DB_TICK => ENA_DW);	
							
CD_LAM_HEP_BTN_MOD: ENTITY WORK.CD_LAM_HEP_BTN
			PORT MAP(	CKHT => CKHT,
							BTN => BTN_MOD,
							BTN_CDLH => ENA_MOD);
							
NUT_HT: ENTITY WORK.DEM_1BIT_BTN
			PORT MAP(	CKHT => CKHT,
							RST => RST,
							BTN => BTN_HT,
							Q => ENA_HT);			
							
XULY_MOD_DAUCHAM_NHAP_NHAY:	ENTITY WORK.XULY_MOD_DAUCHAM_NHAP_NHAY
			PORT MAP(	CKHT => CKHT,
							RST => RST,
							ENA_DB => ENA_MOD,
							ENA2HZ => ENA2HZ,
							ENA_UP => ENA_UP,
							ENA_DW => ENA_DW,
							ENA_HT => ENA_HT,
							SS_ND => SS_ND,
							ENA_GIAIMA_8LED => ENA_GIAIMA_8LED,
							GIATRI_MOD => GIATRI_MOD,
							DAU_CHAM_8LED => DAU_CHAM_8LED);
							
DEM_GIOPHUTGIAY: ENTITY WORK.DEM_GIOPHUTGIAY
			PORT MAP(	CKHT => CKHT,
							RST => RST,
							ENA_DB => ENA_DB,
							ENA_HT => ENA_HT,
							GIATRI_MOD => GIATRI_MOD,
							ENA_UP => ENA_UP,
							ENA_DW => ENA_DW,
							ENA_CHINH => ENA_CHINH,
							GIO => GIO5,
							PHUT => PHUT,
							GIAY => GIAY);
							
HEXTOBCD_GIO: ENTITY WORK.HEXTOBCD_6BIT
			PORT MAP(	SOHEX6BIT => GIO,
							DONVI => DV_GIO,
							CHUC => CH_GIO);
							
HEXTOBCD_PHUT: ENTITY WORK.HEXTOBCD_6BIT
			PORT MAP(	SOHEX6BIT => PHUT,
							DONVI => DV_PHUT,
							CHUC => CH_PHUT);
							
HEXTOBCD_GIAY: ENTITY WORK.HEXTOBCD_6BIT
			PORT MAP(	SOHEX6BIT => GIAY,
							DONVI => DV_GIAY,
							CHUC => CH_GIAY);
-----------------------------------------------------------------------------
NHIETDO <= TEMPERATURE (11 DOWNTO 4);
DECIMAL <= TEMPERATURE (3 DOWNTO 0);

DS18B20_TEMPERATURE: ENTITY WORK.DS18B20_TEMPERATURE
	PORT MAP ( 	CKHT => CKHT,
					RST => RST,
					DS18B20 => DS18B20,
					DS_PRESENT => DS_PRESENT,
					TEMPERATURE_OUT => TEMPERATURE);
	PROCESS (DS_PRESENT, DONVI, CHUC, TRAM)
	BEGIN
		IF (DS_PRESENT = '0') THEN
									LED0 <= DONVI;
									LED1 <= CHUC;
									LED2 <= TRAM;
		ELSE
									LED0 <= X"E";
									LED1 <= X"E";
									LED2 <= X"E";
		END IF;
	END PROCESS;	
HEXTOBCD_ND: ENTITY WORK.HEXTOBCD_8BIT
			PORT MAP(	SOHEX8BIT => NHIETDO,
							DONVI => DONVI,
							CHUC => CHUC,
							TRAM => TRAM);	
DAT_GIOI_HAN_ND: ENTITY WORK.DEM_8BIT
			PORT MAP(	CKHT => CKHT,
							RST => RST,
							ENA_CHINH => ENA_CHINH,
							ENA_UP => ENA_UP,
							ENA_DW => ENA_DW,
							ENA_HT => ENA_HT,
							Q => GIOI_HAN_ND);			
HEXTOBCD_CAI_ND: ENTITY WORK.HEXTOBCD_8BIT
			PORT MAP(	SOHEX8BIT => GIOI_HAN_ND,
							DONVI => DV_ND,
							CHUC => CH_ND);	
SS_ND <= '1' WHEN NHIETDO = GIOI_HAN_ND ELSE '0';		
BELL <=  '1';				
------------------------------------------------------------------------------
LED_0 <= DV_GIAY WHEN ENA_HT = '0' ELSE LED0;
LED_1 <= CH_GIAY WHEN ENA_HT = '0' ELSE LED1;
LED_2 <= X"F" WHEN ENA_HT = '0' ELSE LED2;
LED_3 <= DV_PHUT WHEN ENA_HT = '0' ELSE X"F";
LED_4 <= CH_PHUT WHEN ENA_HT = '0' ELSE X"F";
LED_5 <= X"F" WHEN ENA_HT = '0' ELSE X"F";
LED_6 <= DV_GIO WHEN ENA_HT = '0' ELSE DV_ND;
LED_7 <= CH_GIO WHEN ENA_HT = '0' ELSE CH_ND;
---------------------------------------------------------------------------					
HIENTHI_2LED: ENTITY WORK.GIAIMA_HIENTHI_8LED_7DOAN
			PORT MAP(
					CKHT => CKHT,
					ENA1KHZ => ENA1KHZ,
					LED70 => LED_0,
					LED71 => LED_1,
					LED72 => LED_2,
					LED73 => LED_3,
					LED74 => LED_4,
					LED75 => LED_5,
					LED76 => LED_6,
					LED77 => LED_7,
					DAU_CHAM_8LED => DAU_CHAM_8LED,
					ENA_GIAIMA_8LED => ENA_GIAIMA_8LED,
					ANODE => ANODE,
					SSEG => SSEG);																	
end Behavioral;

