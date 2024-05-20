-------------------------------------------------------------------------------
--
-- Title       : OUTPUT_REGISTER
-- Design      : Sap_1
-- Author      : Hema
-- Company     : student
--
-------------------------------------------------------------------------------
--
-- File        : C:/My_Designs/Project/Sap_1/src/Output_Register.vhd
-- Generated   : Sat May  4 23:13:58 2024
-- From        : Interface description file
-- By          : ItfToHdl ver. 1.0
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--    and may be overwritten
--{entity {OUTPUT_REGISTER} architecture {Behavoral}}

library IEEE;
use IEEE.std_logic_1164.all;

entity OUTPUT_REGISTER is
	port(
		Lo_c : in STD_LOGIC;
		Clk : in STD_LOGIC;
		Data_in : in STD_LOGIC_VECTOR(7 downto 0);
		Data_out : out STD_LOGIC_VECTOR(7 downto 0)
		);
end OUTPUT_REGISTER;

--}} End of automatically maintained section

architecture Behavoral of OUTPUT_REGISTER is
	
	
begin
	-- Enter your statements here -- 
	process (clk)  
	begin
		if(rising_edge(clk)) then
			if(Lo_c = '0')then
				Data_out <= Data_in;
			end if;	
		end if;
	end process;
	
end Behavoral;
