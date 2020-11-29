--Bài tập số 4
-- Thiết kế mạch chạy 2 chương trình: mạch đếm nhị phân hiển thị trên
--led G và dịch led hiển thị trên led R
--• Khi nạp chương trình mạch đếm bắt đầu đếm từ 0 đến 20 thì dừng lại
--• Kế tiếp 8 led sáng dần từ phải sang trái rồi dừng lại
--• Tiếp theo mạch đếm tiếp tục đếm từ 21 đến 40 rồi dừng lại
--• Kế tiếp 8 led tắt dần từ phải sang trái.
--• Lặp lại từ đầu.
-- 20 = 0001 0100
-- 40 = 0010 1000

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DEM_BIN_0_40_8LED_TSP_PST is
Port ( CKHT: in STD_LOGIC;
		LED: out STD_LOGIC_VECTOR (5 downto 0); --DEM
		LEDR: out STD_LOGIC_VECTOR (7 downto 0); -- DICH
--		SW0: in STD_LOGIC;
		BTN_N0: IN STD_LOGIC);
end DEM_BIN_0_40_8LED_TSP_PST;
architecture Behavioral of DEM_BIN_0_40_8LED_TSP_PST is
SIGNAL RST, BTN_UD, BTN_SS: STD_LOGIC;
SIGNAL ENA_DB, ENA_DB1, ENA_DB2: STD_LOGIC;
SIGNAL ENA_SS, ENA_UD: STD_LOGIC;
SIGNAL MODE: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Q_STD_PST: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Q_DEM_0_40: STD_LOGIC_VECTOR(5 DOWNTO 0);
begin
	RST <= NOT BTN_N0;
--	CHIA_1ENA1HZ: ENTITY WORK.CHIA_10ENA
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP ( CKHT => CKHT,
				  ena2hz => ENA_DB
				  );
	
	CD1_CD3: ENTITY WORK.LED_STD_PST
	PORT MAP ( CKHT => CKHT,
					ENA_DB => ENA_DB,
					RST => RST,
					OE => MODE(1),
				  Q => Q_STD_PST );
				  
	CD2_CD4: ENTITY WORK.DEM_BIN_0_20_UP
	PORT MAP ( CKHT => CKHT,
				  RST => RST,
				  ENA_DB => ENA_DB,
				  OE => MODE(0),
				  Q => Q_DEM_0_40 );
	
	DIEUKHIEN_CHOPHEP: ENTITY WORK.DIEUKHIEN_CHOPHEP
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					OE => MODE );
	LED <= Q_DEM_0_40;
	LEDR <= Q_STD_PST;
end Behavioral;