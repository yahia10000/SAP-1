-------------------------------------------------------------------------------
--
-- Title       : SAP_1
-- Design      : SAP_1_PROJECT
-- Author      : asus
-- Company     : asus
--
-------------------------------------------------------------------------------
--
-- File        : D:/Projects/ALDEC_workspace/SAP_1_PROJECT/SAP_1_PROJECT/src/SAP_1.vhd
-- Generated   : Tue May  7 21:48:28 2024
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
--{entity {SAP_1} architecture {SAP_1}}

library IEEE;
use IEEE.std_logic_1164.all;

entity SAP_1 is
	port(
		CLK : in STD_LOGIC;
		OUTPUT : out STD_LOGIC_VECTOR(7 downto 0)
		);
end SAP_1;

--}} End of automatically maintained section

architecture SAP_1 of SAP_1 is 
	
	component ALU is
		port(
			SU : in STD_LOGIC_VECTOR(1 downto 0);
			EU : in STD_LOGIC;
			DATA_A : in STD_LOGIC_VECTOR(7 downto 0);
			DATA_B : in STD_LOGIC_VECTOR(7 downto 0);
			DATA_OUT_BUS : out STD_LOGIC_VECTOR(7 downto 0) := "ZZZZZZZZ"
			);
	end component;
	
	component ACCUMULATOR is
		port(
			LA_C : in STD_LOGIC;
			EA : in STD_LOGIC;
			CLK : in STD_LOGIC;
			DATA_INPUT : in STD_LOGIC_VECTOR(7 downto 0);
			DATA_OUTPUT_BUS : out STD_LOGIC_VECTOR(7 downto 0):= "ZZZZZZZZ";	
			DATA_OUTPUT_ALU : out STD_LOGIC_VECTOR(7 downto 0)
			);
	end component;
	
	component OUTPUT_REGISTER is
		port(
			Lo_c : in STD_LOGIC;
			Clk : in STD_LOGIC;
			Data_in : in STD_LOGIC_VECTOR(7 downto 0);
			Data_out : out STD_LOGIC_VECTOR(7 downto 0)
			);
	end component;
	
	
	component program_Counter is
		port(
			Cp : in STD_LOGIC;
			Ep : in STD_LOGIC;
			Clk_c : in STD_LOGIC;
			Clr_c : in STD_LOGIC;
			Adress_out : out STD_LOGIC_VECTOR(4 downto 0):= "ZZZZZ"
			);
	end component;	   
	
	component RAM is
		port(
			CE_c : in STD_LOGIC;
			ADDRESS_IN : in STD_LOGIC_VECTOR(4 downto 0);
			RAM_OUT : out STD_LOGIC_VECTOR(7 downto 0) := "ZZZZZZZZ"
			);
	end component;	 
	
	component INSTRUCTION_REGISTER is
		port(
			LI_C : in STD_LOGIC;
			CLK : in STD_LOGIC;
			CLR : in STD_LOGIC;
			EI_C : in STD_LOGIC;
			DATA_INPUT : in STD_LOGIC_VECTOR(7 downto 0);
			DATA_OUTPUT_BUS : out STD_LOGIC_VECTOR(4 downto 0):= "ZZZZZ";
			DATA_OUTPUT_CONTROLLER : out STD_LOGIC_VECTOR(2 downto 0)
			);
	end component; 
	
	component MAR is
		port(
			LM_C : in STD_LOGIC;
			CLK : in STD_LOGIC;
			DATA_INPUT : in STD_LOGIC_VECTOR(4 downto 0);
			DATA_OUTPUT_RAM : out STD_LOGIC_VECTOR(4 downto 0));
		
	end component;
	
	component B_REGISTER is
		port(
			LB_C : in STD_LOGIC;
			CLK : in STD_LOGIC;
			DATA_INPUT : in STD_LOGIC_VECTOR(7 downto 0);
			DATA_OUTPUT_ALU : out STD_LOGIC_VECTOR(7 downto 0)
			);
	end component;
	
	component CONTROLLER_SEQUANCER is
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
			CLK: 	in STD_LOGIC
			);
	end component;
	
	signal CP_SIGNAL 		: STD_LOGIC:= '0';
	signal CLK_C_SIGNAL 	: STD_LOGIC;
	signal CLR_SIGNAL 		: STD_LOGIC:= '0';
	signal CLR_C_SIGNAL 	: STD_LOGIC:= '1';
	signal EP_SIGNAL 		: STD_LOGIC:= '0';
	signal LM_C_SIGNAL 		: STD_LOGIC:= '1';
	signal CE_C_SIGNAL 		: STD_LOGIC:= '1';
	signal LI_C_SIGNAL 		: STD_LOGIC:= '1';
	signal EI_C_SIGNAL 		: STD_LOGIC:= '1';
	signal LA_C_SIGNAL 		: STD_LOGIC:= '1';
	signal EA_SIGNAL 		: STD_LOGIC:= '0';
	signal SU_SIGNAL 		: STD_LOGIC_VECTOR(1 downto 0) := "00";
	signal EU_SIGNAL 		: STD_LOGIC:= '0';
	signal LB_C_SIGNAL 		: STD_LOGIC:= '1';
	signal LO_C_SIGNAL 		: STD_LOGIC:= '1';
	
	signal DATA_ACC_ALU : STD_LOGIC_VECTOR(7 downto 0);
	signal DATA_B_ALU : STD_LOGIC_VECTOR(7 downto 0);  
	signal DATA_MAR_RAM : STD_LOGIC_VECTOR(4 downto 0); 
	signal DATA_CU_IR : STD_LOGIC_VECTOR(2 downto 0); 
	
	signal BUS_SIGNAL : STD_LOGIC_VECTOR(7 downto 0);  
	
begin
	
	-- Enter your statements here --		
	CLK_C_SIGNAL <= not CLK;   
	
	
	ALU_COM: ALU port map(
		SU_SIGNAL,
		EU_SIGNAL,
		DATA_ACC_ALU,
		DATA_B_ALU,
		BUS_SIGNAL
		);
	
	ACC_COMP: ACCUMULATOR port map(
		LA_C_SIGNAL,
		EA_SIGNAL,
		CLK,
		BUS_SIGNAL,
		BUS_SIGNAL,
		DATA_ACC_ALU
		);
	
	B_REG_COMP: B_REGISTER 
	port map (
		LB_C_SIGNAL,
		CLK,
		BUS_SIGNAL,
		DATA_B_ALU
		);
	
	OUT_REG_COMP: OUTPUT_REGISTER 
	port map(
		LO_C_SIGNAL,
		clk,
		BUS_SIGNAL,
		OUTPUT
		);
	
	PC_COMP: program_Counter 
	port MAP(
		CP_SIGNAL,
		EP_SIGNAL,
		CLK_C_SIGNAL,
		CLR_C_SIGNAL,
		BUS_SIGNAL(4 downto 0)
		);
	
	MAR_COMP: MAR 
	port map(
		LM_C_SIGNAL,
		CLK,
		BUS_SIGNAL(4 downto 0),
		DATA_MAR_RAM
		);
	
	RAM_COMP: RAM 
	port map(
		CE_C_SIGNAL	,
		DATA_MAR_RAM,
		BUS_SIGNAL
		);
	
	IR_COMP : INSTRUCTION_REGISTER 
	port map(
		LI_C_SIGNAL,
		CLK ,
		CLR_SIGNAL,
		EI_C_SIGNAL,
		BUS_SIGNAL,
		BUS_SIGNAL(4 downto 0),
		DATA_CU_IR
		);
	
	CU_COMP: CONTROLLER_SEQUANCER 
		port map(
			CP_SIGNAL,
			EP_SIGNAL,
			LM_C_SIGNAL,
			CE_C_SIGNAL,
			LI_C_SIGNAL,
			EI_C_SIGNAL,
			LA_C_SIGNAL,
			EA_SIGNAL,
			SU_SIGNAL,
			EU_SIGNAL,
			LB_C_SIGNAL,
			LO_C_SIGNAL,
			DATA_CU_IR,
			CLK
			);

	
end SAP_1;
