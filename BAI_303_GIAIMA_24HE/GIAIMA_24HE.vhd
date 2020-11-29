library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GIAIMA_24HE is
    Port ( SW : in  STD_LOGIC_VECTOR (5 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end GIAIMA_24HE;

architecture Behavioral of GIAIMA_24HE is

begin
	IC1: ENTITY WORK.GIAIMA_IF_INS_E
	PORT MAP ( I  => SW (1 DOWNTO 0),
				  E1 => SW (4),
				  O  => LED (3 DOWNTO 0));
	IC2: ENTITY WORK.GIAIMA_CASE_INS_E
	PORT MAP ( I  => SW (3 DOWNTO 2),
				  E2 => SW (5),
				  O  => LED (7 DOWNTO 4));	

end Behavioral;
