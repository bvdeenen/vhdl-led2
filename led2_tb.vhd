--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:03:59 04/07/2013
-- Design Name:   
-- Module Name:   /home/bvdeenen/Dropbox/development/vhdl-playground/led2/led2_tb.vhd
-- Project Name:  led2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: led2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY led2_tb IS
END led2_tb;
 
ARCHITECTURE behavior OF led2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT led2
    PORT(
         clk : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0);
         dir : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal dir : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: led2 PORT MAP (
          clk => clk,
          led => led,
          dir => dir
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*250;

		dir <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
