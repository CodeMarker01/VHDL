-- MA HOA UU TIEN 4->2 CO 1 NGO RA (ACTIVE) CHO BIET TRANG THAI TICH CUC
library IEEE;
use ieee.std_logic_1164.all;

entity MAHOAUUTIEN2_42H is
	Port( sw: in std_logic_vector(7 downto 0);
			led: out std_logic_vector(5 downto 0)
	);
end MAHOAUUTIEN2_42H;

--architecture quang of MAHOAUUTIEN2_42H is
begin
	MAHOA_SELECT_INS: entity work.mahOA_SELECT_INS
		Port map ( i => sw(3 downto 0),
						o => led (1 downto 0),
						act => led(2)
		);
	MAHOA_CONDITIONAL_INS: entity work.mahOA_CONDITIONAL_INS
		Port map ( i => sw (7 downto 4),
					  o => led (4 downto 3),
					  act => led(5)
		);


end quang;