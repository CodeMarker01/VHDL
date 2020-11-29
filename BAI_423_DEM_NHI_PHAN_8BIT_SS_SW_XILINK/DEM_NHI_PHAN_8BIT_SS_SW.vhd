library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_NHI_PHAN_8BIT_SS_SW is
    Port ( CKHT : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
			  sw0   : in  STD_LOGIC;
           LED  : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_NHI_PHAN_8BIT_SS_SW;

architecture Behavioral of DEM_NHI_PHAN_8BIT_SS_SW is
	SIGNAL ENA_DB,RST: STD_LOGIC;
begin
	RST <= BTN0;
	IC1: ENTITY WORK.CHIA_10ENA
		PORT MAP (CKHT   => CKHT,
					 ENA5HZ => ENA_DB);
	IC2: ENTITY WORK.DEM_8BIT_SS
		PORT MAP (CKHT	  => CKHT,
					 RST	  => RST,
					 ENA_SS => sw0,
					 ENA_DB => ENA_DB,
					 Q		  => LED);

end Behavioral;