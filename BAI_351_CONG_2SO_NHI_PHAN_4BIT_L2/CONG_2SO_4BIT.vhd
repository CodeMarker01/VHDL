-- CHUONG TRINH CON CONG 2 SO NHI PHAN
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity CONG_2SO_4BIT is
Port ( SOA, SOB: in STD_LOGIC_VECTOR (3 downto 0);
KETQUA: out STD_LOGIC_VECTOR (4 downto 0));
end CONG_2SO_4BIT;
architecture Behavioral of CONG_2SO_4BIT is
SIGNAL KQT, SOAT, SOBT: SIGNED (4 downto 0);
begin
-- khi cong 2 so nhi phan 4 bit
-- ket qua mã la so 5 bit
SOAT <= '0' & SIGNED(SOA);
SOBT <= '0' & SIGNED(SOB);
KQT <= SOAT + SOBT;
KETQUA <= STD_LOGIC_VECTOR(KQT);
end Behavioral;