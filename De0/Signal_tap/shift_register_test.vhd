library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_register_test is
    Port (
        -- ADC signals
        ADC_CONVST    : out STD_LOGIC;
        ADC_SCK       : out STD_LOGIC;
        ADC_SDI       : out STD_LOGIC;
        ADC_SDO       : in STD_LOGIC;
        
        -- Arduino I/O signals
        ARDUINO_IO    : inout STD_LOGIC_VECTOR(15 downto 0);
        ARDUINO_RESET_N : inout STD_LOGIC;
        
        -- Clock signals
        FPGA_CLK1_50 : in STD_LOGIC;
        FPGA_CLK2_50 : in STD_LOGIC;
        FPGA_CLK3_50 : in STD_LOGIC;
        
        -- Key inputs
        KEY           : in STD_LOGIC_VECTOR(1 downto 0);
        
        -- LED outputs
        LED           : out STD_LOGIC_VECTOR(7 downto 0);
        
        -- Switch inputs
        SW            : in STD_LOGIC_VECTOR(3 downto 0)
    );
end shift_register_test;

architecture Behavioral of shift_register_test is


  

	 signal clk_out : std_logic := '0';              
	 
	 signal output_reg: std_logic_vector(7 downto 0) :="00000001";
	 
	 
begin


	 

	 	 
	 
process (clk_out)
    begin
        if falling_edge(clk_out) then
         
			output_reg(3) <= output_reg(2);
			output_reg(2) <= output_reg(1);
			  
			output_reg(5) <= output_reg(4);
			output_reg(4) <= output_reg(3);
			output_reg(7) <= output_reg(6);
			output_reg(6) <= output_reg(5);
			output_reg(1) <= output_reg(0);
			output_reg(0) <= '0';
 		  
        end if;
end process;


	 

--Divided clock
clk_out <= KEY(0);	



--LED <= output_reg;

LED(0) <= KEY(0);
LED(1) <= KEY(1);
	
		
	 
end Behavioral;