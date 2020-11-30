----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:50 09/26/2017 
-- Design Name: 
-- Module Name:    DEM_2BIT_BTN - Behavioral 
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
entity DEM_2BIT_BTN is
    Port (CKHT, RST, BTN: in  STD_LOGIC;
    		Q:    out    STD_LOGIC_VECTOR (1 downto 0));
end DEM_2BIT_BTN;

architecture Behavioral of DEM_2BIT_BTN is
SIGNAL ENA_DB: STD_LOGIC;
BEGIN

CD_LAM_HEP_BTN:   ENTITY WORK.CD_LAM_HEP_BTN
            PORT MAP (  CKHT    => CKHT,   
                        BTN     => BTN,        
                        BTN_CDLH => ENA_DB);  
                            
DEM_2BIT: 	ENTITY WORK.DEM_2BIT           
            PORT MAP (  CKHT   => CKHT,   
                        RST    => RST,
                        ENA_DB => ENA_DB,
                        Q    => Q);
end Behavioral;
