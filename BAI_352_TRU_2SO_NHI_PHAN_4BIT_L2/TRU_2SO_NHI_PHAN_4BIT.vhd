-- TRU 2 SO NHI PHAN 4 BIT
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TRU_2SO_NHI_PHAN_4BIT is
Port ( sw: in STD_LOGIC_VECTOR (7 downto 0);
led: out STD_LOGIC_VECTOR (4 downto 0));
end TRU_2SO_NHI_PHAN_4BIT;
architecture Behavioral of TRU_2SO_NHI_PHAN_4BIT is
begin
TRU_SO_NHI_PHAN: ENTITY WORK.TRU_2SO_4BIT
PORT MAP( SOA => SW(3 DOWNTO 0),
SOB => SW(7 DOWNTO 4),
KETQUA => LED);
end Behavioral;