

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity XOA_SO_0_VN is
    Port ( TRAM, CHUC : in  STD_LOGIC_VECTOR (3 downto 0);
           ENA_GIAIMA_8LED : out  STD_LOGIC_VECTOR (7 downto 0));
end XOA_SO_0_VN;

architecture Behavioral of XOA_SO_0_VN is

begin
	PROCESS (TRAM, CHUC)
	BEGIN
		IF TRAM = X"0" AND CHUC =X"0" THEN	ENA_GIAIMA_8LED <= X"C1";
		ELSIF TRAM =X"0" THEN 					ENA_GIAIMA_8LED <= X"C3";
		ELSE											ENA_GIAIMA_8LED <= X"C7";
		END IF;
	END PROCESS;
end Behavioral;

