----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 01:02:35 AM
-- Design Name: 
-- Module Name: Data_generator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL; -- For type conversions

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_generator is
  Port (
  
  --IN
  tready: in std_logic;
  clk_in: in std_logic;
  --OUT
  tvalid: out std_logic;  
  data_o : out std_logic_vector(31 downto 0)
  
   );
end Data_generator;

architecture Behavioral of Data_generator is

signal counter: integer:= 0;

begin

process(clk_in)
begin

if rising_edge(clk_in) then
    if tready ='1' then
        tvalid <='1';
        if counter>1000 then
            counter <=0;
         else
            counter <= counter+2;
        end if;
    else
     tvalid <='0';
    end if;
end if;    
        
end process;

data_o<= std_logic_vector(to_unsigned(counter, 32));


end Behavioral;
