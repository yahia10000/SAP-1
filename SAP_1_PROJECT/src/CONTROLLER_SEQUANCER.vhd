-------------------------------------------------------------------------------
--
-- Title       : CONTROLLER_SEQUANCER
-- Design      : sap_1
-- Author      : solo
-- Company     : student
--
-------------------------------------------------------------------------------
--
-- File        : D:/ALDEC/files/sap_1/sap_1/src/CONTROLLER_SEQUANCER.vhd
-- Generated   : Sat May  4 23:29:29 2024
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
--{entity {CONTROLLER_SEQUANCER} architecture {CONTROLLER_SEQUANCER}}

library IEEE;
use IEEE.std_logic_1164.all;

entity CONTROLLER_SEQUANCER is
	port(
		CP :   out STD_LOGIC;
		EP :   out STD_LOGIC;
		LM_C : out STD_LOGIC;
		CE_C : out STD_LOGIC;
		LI_C : out STD_LOGIC;
		EI_C : out STD_LOGIC;
		LA_C : out STD_LOGIC;
		EA 	:  out STD_LOGIC;
		SU : out STD_LOGIC_VECTOR(1 downto 0);
		EU :   out STD_LOGIC;
		LB_C : out STD_LOGIC;
		LO_C : out STD_LOGIC;
		OPCODE : in STD_LOGIC_VECTOR(2 downto 0);
		CLK: in STD_LOGIC
		);
end CONTROLLER_SEQUANCER;

--}} End of automatically maintained section

architecture CONTROLLER_SEQUANCER of CONTROLLER_SEQUANCER is

signal counter : integer range 0 to 5:=1;

signal IS_HALT : STD_LOGIC := '0';
	
begin
	
	-- Enter your statements here --
	process(CLK, counter)
	begin 
		if( falling_edge(CLK) and IS_HALT='0' )then
			if (counter < 5) then
				counter <= counter +1;
			else 
				counter <= 1;
			end if;
		end if;	  
		
		if (counter = 1)then  
			CP   <= '0';
			EP   <= '1';
			LM_C <= '0';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
		end if;	 
		
		if (counter = 2)then  
			CP   <= '1';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '0';
			LI_C <= '0';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
		end if;
		
		if (counter = 3 and OPCODE = "000")then  
			-- LDA
			CP   <= '0';
			EP   <= '0';
			LM_C <= '0';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '0';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
		end if;	 
		
		if (counter = 3 and (OPCODE = "001" or OPCODE="010" ) )then  
			-- ADD SUB 
			CP   <= '0';
			EP   <= '0';
			LM_C <= '0';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '0';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
		end if;	  
		
		if (counter = 3 and OPCODE = "101")then  
			-- OUT
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '1';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '0';  
			
			  counter <= 0; --reset timer
			
		end if;	 
		
		if (counter = 3 and OPCODE = "111")then  
			-- HLT
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';   
			
			IS_HALT	<= '1';
		end if;	 
		
		if(counter = 3 and OPCODE ="011") then	
			-- SHIFT LEFT
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '0';
			EA   <= '0';
			SU 	 <= "10"; 
			EU 	 <= '1';
			LB_C <= '1';
			LO_C <= '1';
			
			counter <= 0; --reset timer
		end if;
		
		if(counter = 3 and OPCODE ="100") then 
			-- SHIFT RIGHT
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '0';
			EA   <= '0';
			SU 	 <= "01"; 
			EU 	 <= '1';
			LB_C <= '1';
			LO_C <= '1';  
			
			counter <= 0; --reset timer
		end if;
			
		
		if (counter = 4 and OPCODE = "000")then  
			-- LDA
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '0';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '0';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';	 
			
			counter <= 0; --reset timer
			
		end if;	   
		
		if (counter = 4 and (OPCODE = "001" or OPCODE="010") )then  
			-- ADD SUB 
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '0';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '0';
			LO_C <= '1';
			
		end if;	  
		
		if (counter = 4 and OPCODE = "011")then  
			-- SHIFT LEFT
			--NO ACTION
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "10"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
		end if;	  
		
		if (counter = 4 and OPCODE = "100")then  
			-- SHIFT RIGHT
			--NO ACTION
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "01"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
		end if;	  
		
		if (counter = 4 and OPCODE = "101")then  
			-- OUT	
			--NO ACTION
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
			
			
			
		end if;	 
		
		if (counter = 5 and OPCODE = "000")then  
			-- LDA	 
			--NO ACTION
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
			
			
		end if;	   
		
		if (counter = 5 and OPCODE = "001")then  
			-- ADD
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '0';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '1';
			LB_C <= '1';
			LO_C <= '1';
			
		end if;	   
		
		if (counter = 5 and OPCODE = "010")then  
			-- SUB
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '0';
			EA   <= '0';
			SU 	 <= "11"; 
			EU 	 <= '1';
			LB_C <= '1';
			LO_C <= '1';
			
		end if;	
		
		
		if (counter = 5 and OPCODE = "011")then  
			-- SHIFT LEFT 
			--NO ACTION
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "10"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
		end if;	  
		
		if (counter = 5 and OPCODE = "100")then  
			-- SHIFT RIGHT
			--NO ACTION
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "01"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
		end if;	  
		
		
		if (counter = 5 and OPCODE = "101")then  
			-- OUT	
			--NO ACTION
			CP   <= '0';
			EP   <= '0';
			LM_C <= '1';  
			CE_C <= '1';
			LI_C <= '1';
			EI_C <= '1';
			LA_C <= '1';
			EA   <= '0';
			SU 	 <= "00"; 
			EU 	 <= '0';
			LB_C <= '1';
			LO_C <= '1';
			
			
			
		end if;	 
		
	end process;
	
end CONTROLLER_SEQUANCER;
