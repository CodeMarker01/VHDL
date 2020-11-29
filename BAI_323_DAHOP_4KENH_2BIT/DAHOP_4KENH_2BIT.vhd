--- CHUONG TRINH CON MACH DA HOP 2 KENH 4 BIT---

---library---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---entity---
entity DAHOP_4KENH_2BIT is
	Port ( IA, IB, IC, ID: IN STD_LOGIC_VECTOR (1 downto 0);
							  S: IN STD_LOGIC_VECTOR(1 downto 0);
							  O: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
end DAHOP_4KENH_2BIT;

---architecture---
architecture Behavioral of DAHOP_4KENH_2BIT is
	begin
		O <= IA WHEN S = "00" ELSE
			  IB WHEN S = "01" ELSE
		     IC WHEN S = "10" ELSE
		     ID;
end Behavioral;