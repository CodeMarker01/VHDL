--Thiết kế mạch đếm nhị phân mod 40, có thể
--điều khiển đếm lên/xuống bằng cách sử dụng 1
--nút nhấn, reset mạch bắt đầu đếm từ 000000
--và đếm lên. Tần số đếm có thể chọn 2Hz hoặc
--5Hz bằng 1 SW

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DEM_MOD40_UD_BTN is
Port ( CKHT: in STD_LOGIC;
		LED: out STD_LOGIC_VECTOR (5 downto 0);
		SW0: in STD_LOGIC;
		BTN_N: IN STD_LOGIC_VECTOR(2 DOWNTO 0));
end DEM_MOD40_UD_BTN;
architecture Behavioral of DEM_MOD40_UD_BTN is
SIGNAL RST, BTN_UD, BTN_SS: STD_LOGIC;
SIGNAL ENA_DB, ENA_DB1, ENA_DB2: STD_LOGIC;
SIGNAL ENA_SS, ENA_UD: STD_LOGIC;
begin
	RST <= NOT BTN_N(0);
	BTN_UD <= NOT BTN_N(1);
	BTN_SS <= NOT BTN_N(2);
--	CHIA_1ENA1HZ: ENTITY WORK.CHIA_10ENA
	CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP ( CKHT => CKHT,
				  ena2hz => ENA_DB1,
				  ena5hz => ENA_DB2
				  );
	process (SW0)
	begin
	IF (SW0 = '1') THEN ENA_DB <= ENA_DB1;
	ELSE 					  ENA_DB <= ENA_DB2;
	END IF;
	end process;
	
	DEM_1BIT_BTN_SS: ENTITY WORK.DEM_1BIT_BTN
	PORT MAP ( CKHT => CKHT,
				  RST => RST,
				  BTN => BTN_SS,
				  Q => ENA_SS );
				  
	DEM_1BIT_BTN_UD: ENTITY WORK.DEM_1BIT_BTN
	PORT MAP ( CKHT => CKHT,
				  RST => RST,
				  BTN => BTN_UD,
				  Q => ENA_UD );
	
	DEM_MOD40: ENTITY WORK.DEM_MOD40_UD_CHI
	PORT MAP ( CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					Q => LED,
					ENA_SS => ENA_SS,
					ENA_UD => ENA_UD);
	
end Behavioral;