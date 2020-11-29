--Bài tập
--• Thiết kế mạch chạy trên 8 led đơn (LEDR0 đến LEDR7) chạy 3 kiểu
--như sau:
--• CĐ 1: 8 led sáng dần và tắt dần từ phải sang trái.
--• CĐ 2: 4 led bên trái sáng tắt 5 lần, 4 led bên phải sáng tắt 3 lần.
--• CĐ 3: 8 led sáng dần từ trái sang phải và tắt hết.
--• Sử dụng 2 nút nhấn reset và MODE. Khi nạp chương trình mạch dừng
--led tắt, nhấn reset thì mạch dừng led tắt. Nút MODE sử dụng để bắt
--đầu và đổi chương trình chạy.

--Thiết kế mạch đếm nhị phân mod 40, có thể
--điều khiển đếm lên/xuống bằng cách sử dụng 1
--nút nhấn, reset mạch bắt đầu đếm từ 000000
--và đếm lên. Tần số đếm có thể chọn 2Hz hoặc
--5Hz bằng 1 SW

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DK_8LED_3CDO_MODE is
Port ( CKHT: in STD_LOGIC;
		LED: out STD_LOGIC_VECTOR (7 downto 0);
		SW0: in STD_LOGIC;
		BTN_N: IN STD_LOGIC_VECTOR(2 DOWNTO 0));
end DK_8LED_3CDO_MODE;
architecture Behavioral of DK_8LED_3CDO_MODE is
SIGNAL RST, BTN_UD, BTN_SS, BTN_MODE: STD_LOGIC;
SIGNAL ENA_DB, ENA_DB1, ENA_DB2: STD_LOGIC;
SIGNAL ENA_SS, ENA_UD: STD_LOGIC;
SIGNAL Q_CD1, Q_CD2, Q_CD3: STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL COUNT, MODE: STD_LOGIC_VECTOR(1 DOWNTO 0):="00";
begin
	RST <= NOT BTN_N(0);
	--BTN_UD <= NOT BTN_N(1);
	BTN_MODE <= BTN_N(2);
--	BTN_SS <= NOT BTN_N(2);
	
--	CHIA_1ENA1HZ: ENTITY WORK.CHIA_10ENA
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP ( CKHT => CKHT,
				  ena5hz => ENA_DB
				  );
	CD1_LED8_STD_PST: ENTITY WORK.LED_STD_PST
		PORT MAP ( CKHT => CKHT, --XUNG CLOCK --VAR TU TAO
						ENA_DB => ENA_DB, -- TOC DO (XUNG TRONG 1 CHU KI)
						RST => RST, -- RESET
						OE => SW0, --CHO PHEP
						MODE => MODE, -- KHI KHAC MODE THI = 0
						Q => Q_CD1); -- Q OUT
	DIEUKHIEN_CHOPHEP: ENTITY WORK.DIEUKHIEN_CHOPHEP
		PORT MAP ( CKHT => CKHT,
						RST => RST,
						ENA_DB => ENA_DB,
						MODE => MODE,
						OE => COUNT);
	CD2_LED8_SANGTATxLAN: ENTITY WORK.LED_SANGTATxLAN
		PORT MAP ( CKHT => CKHT, 
						ENA_DB => ENA_DB,
						RST => RST, 
						OE => SW0,
						MODE => MODE,
						COUNT => COUNT,
						Q => Q_CD2);
	CD3_LED8_STD_PST: ENTITY WORK.LED_STD_TSP
		PORT MAP ( CKHT => CKHT, 
						ENA_DB => ENA_DB,
						RST => RST,
						MODE => MODE,	
						OE => SW0, 
						Q => Q_CD3); 

	CHUYENDOI_MODE: ENTITY WORK.DEM_2BIT_BTN
	PORT MAP ( CKHT => CKHT,
				  RST => RST,
				  BTN => BTN_MODE,
				  Q => MODE );
	
	LED <= Q_CD1 WHEN MODE = "01" ELSE
			 Q_CD2 WHEN MODE = "10" ELSE
			 Q_CD3 WHEN MODE = "11" ELSE
			 "00000000";
end Behavioral;