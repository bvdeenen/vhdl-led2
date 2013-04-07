----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:38:11 08/03/2007 
-- Design Name: 
-- Module Name:    led2 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY led2 is
    Port ( clk : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR(7 downto 0);
           dir : in  STD_LOGIC); -- switch 3 determines direction of led walk
end led2;

ARCHITECTURE led_arch of led2 is
	COMPONENT clock_divider is
		port ( 
			clk_in : in std_logic;
			clk_out : out std_logic );
	end COMPONENT clock_divider;

	SIGNAL clk_1Hz : std_logic;
	SIGNAL status : std_logic_vector(7 downto 0) := "00000001";

begin
	clk_divider : clock_divider
		port map ( clk_in => clk,
			clk_out => clk_1Hz);

	process(clk_1Hz) is
	begin
		if (clk_1Hz'event and clk_1Hz='1') then
			if ( dir = '1' ) then
				if ( status="10000000" ) then
					status <= "00000001";
				else	
					status <= (status(6 downto 0) & '0');
				end if;	
			else
				if ( status = "00000001" ) then
					status <= "10000000";
				else	
					status <= ('0' & status(7 downto 1) );
				end if;	
			end if;

			led <= status;
		end if;
	end process;	

end led_arch;

------------
