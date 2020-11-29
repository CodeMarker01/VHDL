-- NHI PHAN 4 BIT -> GRAY
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity BINARY_TO_GRAY_4BIT is
Port ( sw: in STD_LOGIC_VECTOR (3 downto 0);
led: out STD_LOGIC_VECTOR (7 downto 0));
end BINARY_TO_GRAY_4BIT;
architecture Behavioral of BINARY_TO_GRAY_4BIT is
begin
BINARY_TO_BCD: ENTITY WORK.BINARY_GRAY_4BIT
PORT MAP( BINARY => SW,
GRAY => LED(3 DOWNTO 0));
LED(7 DOWNTO 4) <= SW;
end Behavioral;