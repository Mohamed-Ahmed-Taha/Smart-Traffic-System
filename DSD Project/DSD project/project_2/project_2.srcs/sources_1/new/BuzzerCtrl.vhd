----------------------------------  Buzzer Control ------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity BuzzerCtrl is
    Port(
        clk : in STD_LOGIC;
        echo_count : in STD_LOGIC_VECTOR (24 downto 0);
        echo : in STD_LOGIC;
        RedState : in STD_LOGIC;
        buzz : out STD_LOGIC
        );
end BuzzerCtrl;

architecture Behavioral of BuzzerCtrl is
    
    signal buzzTemp : STD_LOGIC := '0';
    
begin

   process(echo) begin
        if falling_edge(echo) then 
            if (echo_count < 20e3 and RedState = '1') then-- no. of ticks to produce 12cm: 70000 = 12cm * 2 * 100e6 MHZ / 34300 cm/
                buzzTemp <= '1';
           else
              buzzTemp <= '0';
             end if;
         end if;
    end process ;
    buzz <= buzzTemp;

end Behavioral;
