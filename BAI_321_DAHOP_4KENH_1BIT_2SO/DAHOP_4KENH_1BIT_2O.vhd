--- MACH DA HOP 4 KENH 1 BIT 2 NGO RA: MOT NGO RA DUNG LENH GAN TIN HIEU DONG THOI, 
--- 1 NGO RA DUNG LENH GAN TIN HIEU CO LUA CHON , CAC TIN HIEU CO NGO VAO VA LUA CHON DUNG CHUNG---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity DAHOP_4KENH_1BIT_2O is
	Port ( sw: in STD_LOGIC_VECTOR (5 downto 0);
	      led: out STD_LOGIC_VECTOR (1 downto 0));
end DAHOP_4KENH_1BIT_2O;

---architecture---
architecture Behavioral of DAHOP_4KENH_1BIT_2O is
	begin
		DAHOP_SELECT_INS: ENTITY WORK.DAHOP_SELECT_INS
			PORT MAP( I => SW(3 DOWNTO 0),
						 S => SW(5 DOWNTO 4),
			          O => LED(0));
		DAHOP_CONDITIONAL_INS: ENTITY WORK.DAHOP_CONDITIONAL_INS
			PORT MAP( I => SW(3 DOWNTO 0),
						 S => SW(5 DOWNTO 4),
						 O => LED(1));
end Behavioral;