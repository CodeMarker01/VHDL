---MACH DA HOP 4 KENH 2 BIT---

---library ---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity----
entity GIAIDAHOP_4KENH is
	Port ( SW: in STD_LOGIC_VECTOR (3 downto 0);
			LED: out STD_LOGIC_VECTOR (7 downto 0));
end GIAIDAHOP_4KENH;

---architecture---
architecture Behavioral of GIAIDAHOP_4KENH is
	begin
		GIAIDAHOP_4KENH_2BIT: ENTITY WORK.GIAIDAHOP_4KENH_2BIT
			PORT MAP( I => SW(1 downto 0),
						 S => SW(3 DOWNTO 2),
						 OA => LED(1 DOWNTO 0),
						 OB => LED(3 DOWNTO 2),
						 OC => LED(5 DOWNTO 4),
						 OD => LED(7 DOWNTO 6)
						 );
end Behavioral;