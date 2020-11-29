library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DAHOP2B_4KENH is
 Port ( 	SW: in STD_LOGIC_VECTOR (9 downto 0);
			LED: out STD_LOGIC_VECTOR (1 downto 0));
end DAHOP2B_4KENH;

architecture Behavioral of DAHOP2B_4KENH is
begin
DAHOP_4KENH_2BIT: ENTITY WORK.DAHOP_4KENH_2BIT
 PORT MAP(
 IA => SW(1 DOWNTO 0),
 IB => SW(3 DOWNTO 2),
 IC => SW(5 DOWNTO 4),
 ID => SW(7 DOWNTO 6),
 S => SW(9 DOWNTO 8),
 O => LED);
end Behavioral;