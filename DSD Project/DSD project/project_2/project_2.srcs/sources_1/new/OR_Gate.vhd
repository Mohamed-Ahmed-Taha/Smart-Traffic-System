----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.12.2023 21:54:13
-- Design Name: 
-- Module Name: OR_Gate - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OR_Gate is
    Port ( OR_IN : in STD_LOGIC_VECTOR(3 downto 0);
           OR_OUT : out STD_LOGIC);
end OR_Gate;

architecture Behavioral of OR_Gate is

begin

    OR_OUT <= OR_IN(3) or OR_IN(2) or OR_IN(1) or OR_IN(0);

end Behavioral;
