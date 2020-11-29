library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BINARY_GRAY_4BIT is
Port ( BINARY: in STD_LOGIC_VECTOR (3 downto 0);
		GRAY: out STD_LOGIC_VECTOR (3 downto 0));
end BINARY_GRAY_4BIT;

architecture Behavioral of BINARY_GRAY_4BIT is
BEGIN
	GRAY <= BINARY XOR ('0' & BINARY(3 DOWNTO 1));
end Behavioral;