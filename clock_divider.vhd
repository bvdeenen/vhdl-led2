----------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY clock_divider is
	generic ( 
		max_cnt : integer := 10 -- 12500000/2
	);
   port (
		clk_in  : in    STD_LOGIC;
		clk_out : out   STD_LOGIC
	);
end clock_divider;


ARCHITECTURE clock_divider_arch of clock_divider is
	SIGNAL cnt : natural range 0 to max_cnt := 0;

	SIGNAL c_out : STD_LOGIC := '0';

	begin process (clk_in) begin
		-- if (clk_in'event and clk_in = '1') then
		if rising_edge(clk_in) then
			if cnt = max_cnt then
				c_out <= not(c_out);
				cnt <= 0;
			else	
				c_out <= c_out;
				cnt <= cnt + 1;
			end if;
			clk_out <= c_out;
		end if;
	end process;
end clock_divider_arch;

