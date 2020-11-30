library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DAO_LED is
	Port ( Q : in STD_LOGIC_VECTOR (7 downto 0);
			LED_N : out STD_LOGIC_VECTOR (7 downto 0));
end DAO_LED;

architecture Behavioral of DAO_LED is
begin
	LED_N <= NOT Q;
end Behavioral;