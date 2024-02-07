library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BuzzTimeCounter is
    Port ( clk : in STD_LOGIC;
           Buzz_In : in STD_LOGIC;
           Buzz_Out : out STD_LOGIC);
end BuzzTimeCounter;

architecture Behavioral of BuzzTimeCounter is

begin

    process(clk) 
        variable OnTimeCounter : integer := 0;
    begin
        if rising_edge(clk) then
            if (Buzz_In = '1') then
                    OnTimeCounter := 0;
            end if;
            if (OnTimeCounter < 200e6) then
                Buzz_Out <= '1';
                OnTimeCounter := OnTimeCounter + 1;
            else
                Buzz_Out <= '0';
            end if;
        end if;
    end process;

end Behavioral;
