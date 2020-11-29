
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GIAIMA24H_2IC is
    Port ( SW : in  STD_LOGIC_VECTOR (3 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end GIAIMA24H_2IC;

architecture Behavioral of GIAIMA24H_2IC is

begin
	IC1: ENTITY WORK.GIAIMA_IF_INS
		  PORT MAP ( I => SW (1 DOWNTO 0),
						 O => LED (3 DOWNTO 0));
	IC2: ENTITY WORK.GIAIMA_CASE_INS
		  PORT MAP ( I => SW (3 DOWNTO 2),
						 O => LED (7 DOWNTO 4));

end Behavioral;

