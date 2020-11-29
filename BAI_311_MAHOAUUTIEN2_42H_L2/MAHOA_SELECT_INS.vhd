-- CHUONG TRINH CON MA HOA - GAN LUA CHON SELECT
library ieee;
use ieee.std_logic_1164.all;

entity MAHOA_SELECT_INS is
	Port ( i: in std_logic_vector (3 downto 0);
			 o: out std_logic_vector (1 downto 0);
			 act: out std_logic
	);
end mahOA_SELECT_INS;

architecture quang of mahOA_SELECT_INS is
begin
--	with I select
--	o <= "11" WHEN "1000"|"1001"|"1010"|"1011"|
--						"1100"|"1101"|"1110"|"1111",
--			"10" when "0111" | "0110" | "0101" | "0100",
--			"01" when "0010" | "0011",
--			"00" when others;
--	act <= I(3) or I(2) or I(1) or I(0);
--	
-- GAN CASE
	process(I)
	begin
		case I is:
			when "1000"|"1001"|"1010"|"1011"|
					"1100"|"1101"|"1110"|"1111" => O <= "11";
			when "0111" | "0110" | "0101" | "0100" => O <= "10";
			when "0010" | "0011" => O <= "01";
			when others => O <= "00";
		end case;
	end process;
	act <= I(3) or I(2) or I(1) or I(0);

end quang;