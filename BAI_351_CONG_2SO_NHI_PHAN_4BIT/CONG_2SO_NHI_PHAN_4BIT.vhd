--- Chtr 9: mach cong 2 so nhi phan 4 bit
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--- entity
entity CONG_2SO_NHI_PHAN_4BIT is
Port ( 	sw: in STD_LOGIC_VECTOR (7 downto 0);
			led: out STD_LOGIC_VECTOR (4 downto 0));
end CONG_2SO_NHI_PHAN_4BIT;
--- architecture
architecture Behavioral of CONG_2SO_NHI_PHAN_4BIT is
begin
CONG_SO_NHI_PHAN: ENTITY WORK.CONG_2SO_4BIT
PORT MAP( SOA => SW(3 DOWNTO 0),
SOB => SW(7 DOWNTO 4),
KETQUA => LED);
END Behavioral;