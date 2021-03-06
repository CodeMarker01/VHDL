--- CHUONG TRINH CON CONG 2 SO 4 BIT
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- THU VIEN DUNG CHO TINH TOAN
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--- entity
entity CONG_2SO_4BIT is
Port ( SOA, SOB: in STD_LOGIC_VECTOR (3 downto 0);
KETQUA: out STD_LOGIC_VECTOR (4 downto 0));
end CONG_2SO_4BIT;

--- architecture
architecture Behavioral of CONG_2SO_4BIT is
SIGNAL KQT, SOAT, SOBT: SIGNED (4 downto 0);
begin
SOAT <= '0' & SIGNED(SOA);
SOBT <= '0' & SIGNED(SOB);
KQT <= SOAT + SOBT;
KETQUA <= STD_LOGIC_VECTOR(KQT);
end Behavioral;