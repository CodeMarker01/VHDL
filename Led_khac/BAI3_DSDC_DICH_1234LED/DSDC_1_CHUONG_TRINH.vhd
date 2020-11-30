----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:49:58 07/03/2017 
-- Design Name: 
-- Module Name:    DSDC_1_CHUONG_TRINH - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DSDC_1_CHUONG_TRINH is
    Port ( CKHT, BTN_N0 : in  STD_LOGIC;
           BELL : out  STD_LOGIC;
           LED_N : out  STD_LOGIC_VECTOR (7 downto 0));
end DSDC_1_CHUONG_TRINH;

architecture Behavioral of DSDC_1_CHUONG_TRINH is
SIGNAL ENA_DB, RST: STD_LOGIC;
SIGNAL Q_DSDC_PST: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	BELL <= '1';
	RST <= NOT BTN_N0;
	LED_N <= NOT Q_DSDC_PST;

CHIA_10ENA: ENTITY WORK.CHIA_10ENA
	PORT MAP(CKHT => CKHT,
				ENA5HZ => ENA_DB);
		
LED_DSDC_PST: ENTITY WORK. LED_DSDC_PST
	PORT MAP(CKHT => CKHT,
				RST => RST,
				ENA_DB => ENA_DB,
				Q => Q_DSDC_PST);

end Behavioral;

